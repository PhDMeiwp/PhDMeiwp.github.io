---
title: 在R中正确运行ANOSIM——样品组间差异显著性检测及注意事项
date: 2017-03-15 20:44:57
categories: 
- 技术
- 数据处理
tags: [ANOSIM, R, PREMANOVA, type I error]
---

---

<center>(本文于   2016-10-6 19:42 首发于 [“科学网”](http://blog.sciencenet.cn/blog-651374-1007083.html))</center>



**R软件结果与PRIMER 7 及 PAST v3 软件结果一致！！！**

**Analysis of similarities (ANOSIM)** is a non-parametric statistical test widely used in the field of ecology.  The test was first suggested by K. R. Clarke as an ANOVA-like test, where instead of operating on raw data, operates on a ranked <font color=red>dissimilarity</font> matrix.



ANOSIM（Analysis ofsimilarities）等可用于检验样品组间（不是种间）的差异显著性。比如对多组数据进行聚类分析后得到3个大类，但是想知道这3个大类直接的差异是否显著，**可用ANOSIM方法（但一般情况更推荐用PREMANOVA方法）**。

**Step1：数据填写，及导入到R**

其中，**FishBio.csv为6种鱼的某一指标（如体长SL/cm）的数据**；

**FishBio.backup.csv**显示出了第一列为鱼的种类，第2列开始均为SL数据，但这个csv只是便于大家理解数据的含义，**在编码过程中不使用**；

**FishEnv.csv为6种鱼对应的3个分组**，分组可以依据实际需要进行分类或者按照聚类结果（如对FishBio.csv基于UPGMA算法进行聚类）进行分类。<font color=red>注意事项：分组内容建议用字母表示，一定不能不纯数字表示！！！</font>




<img src="http://p1.bpimg.com/567571/7c4dc4168d3e20ce.jpg" align=center>

<!-- more -->

# 上图为 FishEnv.csv

<img src="http://p1.bpimg.com/567571/69931828504786f9.jpg"  width=95% align=center>


#上图为 FishBio.csv

<img src="http://p1.bqimg.com/567571/99175066bde38ee1.jpg" width=95% align=center>

# 上图为 FishBio.backup.csv

``` bash
FishBio<-read.csv("~/FishBio.csv")

View(FishBio)

FishEnv<- read.csv("~/FishEnv.csv")

View(FishEnv)


#如需提前聚类分析，代码为

library("vegan")

distance.bray<-vegdist(FishBio,method = 'bray')

hclust.fish<-hclust(distance.bray,method = "average")

plot(hclust.fish)

#得到聚类结果后，再确定FishEnv.csv中Group 相应的值。
```

---

**Step2：进行ANOSIM计算**

接上面的代码继续写

``` bash
library("vegan")
distance.bray<-vegdist(FishBio,method = 'bray')
anosim.result<-anosim(distance.bray,FishEnv$Group,permutations = 999)
summary(anosim.result)
```

#得到结果如下图:

<img src="http://p1.bpimg.com/567571/8badb856c500c288.jpg" width=80% align=center>

<font color=red>Globe R = 0.2222，p-value= 0.1

每进行一个999次permutations，得到p-value可能会有微小的波动，但Glober R值不变。</font>

以上。

---

---

<center>**Q & A**</center>

1. 参考网址：http://cc.oulu.fi/~jarioksa/softhelp/vegan/html/anosim.html

2. 声明：“Pairwise tests are not possible in vegan. My understanding is that the non-R software with such tests makes separate pairwise tests using subsets of data with only two levels of a factor in one test. We don't provide that in vegan and have no plans to provide this in the future.”(cited by Jari Oksanen, author of anosim and Adonis{vegan} in R)   https://stat.ethz.ch/pipermail/r-sig-ecology/2013-June/003865.html  
我的理解是 PRIMER等软件对ANOSIM已经PERMANOVA的传统的pairwise analysis其实都是不准确的，<font color=red>R软件{vegan} package的原作者Jari Oksanen也不打算提供与PREMER等软件得到相同结果的传统的pairwise 代码，因为这种传统的pairwise显然会增加犯I类错误的概率，不能真实反应两两比较的显著水平。</font>**（见 I 类错误及 II 类错误的描述）**




---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn