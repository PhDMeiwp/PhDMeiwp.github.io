---
title: 在R中正确运行“系统（层次）聚类分析”
date: 2017-03-15 20:34:00
categories: 
- 技术
- R 语言
tags: [系统聚类, 层次聚类, R 语言]
---

---

<center>(本文于 2016-7-5 15:43 首发于 [“科学网”](http://blog.sciencenet.cn/blog-651374-988817.html))</center>

**Hierarchical Cluster Analysis in R or Rstudio**

<!-- more -->

**第一步：导入数据 ex.**

``` bash
library(vegan)
data(dune)
```

**第二步：将原始转换成“距离”矩阵**  #假设数据不需要进行标准化

``` bash
# library(vegan)
distance.ex<-vegdist(dune,method="euc",na.rm=TRUE)

#计算距离的method （Dissimilarity index）包括：

#"manhattan", "euclidean", "canberra","bray", "kulczynski", "jaccard", "gower", "altGower", "morisita", "horn","mountford", "raup" , "binomial", "chao", "cao" or "mahalanobis".

#其中"bray"是指 "Bray–Curtis [Dissimilarity] index"
```

**第三步：聚类分析**

``` bash
hclust.ex <- hclust(distance.ex,method="ward.D2")

#聚类的方法包括：

#"ward.D", "ward.D2", "single", "complete", "average" (= UPGMA), "mcquitty"(= WPGMA), "median" (= WPGMC) or "centroid" (= UPGMC).

# 注意一般软件ward算法相对应的hclust中为ward.D2，小心用错

# agnes(*, method="ward") corresponds to hclust(*, "ward.D2").
```

**第四步：作树状图**

``` bash
plot(hclust.ex,hang=-1)    
# hang取负数时，树状图y轴 从0 开始。
```

<img src="http://p1.bpimg.com/567571/dbb9fdc7b9e8bafd.jpg" width=80% align=center>

---

#补充一 

完整地写个bray-curtis距离的代码：

``` bash
library(vegan)
data(dune)
distance.bray<-vegdist(dune,method="bray",na.rm=TRUE)    # bray 距离
hclust.bray<- hclust(distance.bray,method="average")      # UPGMA 聚类
plot(hclust.bray,hang=-1)       
```

见下图，<font color=red>y轴的 Height 为 “Bray-Curtis不相似性百分比”</font>。

<img src="http://p1.bqimg.com/567571/5a5500ffdbb09b37.jpg" width=80% align=center>

---

<center>**Q & A**</center>

**（1）聚类方法"centroid" 相对应使用的距离为平方欧式距离 squared Euclidean distances.   如：hc1ust.centroid <- hclust(dist(cent)^2, method = "cen")**

**（2）聚类方法"ward.D2" 相对应使用的距离为欧式距离 "Euclidean" distances.**

**（3）聚类方法"average"(=UPGMA) 相对应使用的距离为 "bray"(=Bray-Curtis) distances.**

---


#补充二

``` bash
#{vegan} package 内还包含以下应用程序：ANOSIM，BIO-ENV，metaMDS（=nMDS），CCA,RDA,SIMPER,vegdist等
```

**参考：**

1. vegdist（）应用代码 https://cran.r-project.org/web/packages/vegan/vegan.pdf

2. hclust()应用代码 https://stat.ethz.ch/R-manual/R-devel/library/stats/html/hclust.html

3. 不同聚类方法的比较 https://cran.r-project.org/web/packages/dendextend/vignettes/Cluster_Analysis.html

4. 实例 http://ecology.msu.montana.edu/labdsv/R/labs/lab13/lab13.html





---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn