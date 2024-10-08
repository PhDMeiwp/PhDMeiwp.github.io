---
title: 在R中正确运行PERMANOVA and pairwise comparison及注意事项
date: 2017-03-17 15:30:51
categories: 
- 技术
- 数据处理
tags: [ANOSIM, PERMANOVA, R, type I error]
---

---

<center>(本文于  2016-10-16 14:15 首发于 [“科学网”](http://blog.sciencenet.cn/blog-651374-1009079.html))</center>



**PERMANOVA  and pairwise comparison——样品组间差异显著性分析及事后两两比较。**

(R软件结果与PRIMER 7及 PAST v3软件结果一致！！！)

PERMANOVA - permutational ANOVA/MANOVA

<font color=grey>Analyses univariate or multivariate data in response to factors, groups or treatments in an experimental design. PERMANOVA can be used as a better ANOVA/MANOVA. Whereas **ANOVA/MANOVA assumes normal distributions** and, implicitly, **Euclidean distance,** **PERMANOVA** works with **any distance** measure that is appropriate to the data, and uses **permutations **to make it **distribution free**. It carries this generalisation through to include most of the options you would expect from modern ANOVA/MANOVA implementation. For example, new theoretical work allows the handling of complex unbalanced designs, also including covariables.</font>



PERMANOVA与ANOSIM（Analysis of similarities）等方法目的类似，即比较样品组间的差异显著性。例：对多组数据进行聚类分析后得到3个大类，但是想知道这3个大类之间的差异是否显著，即可用上述方法。



ANOSIM比较的是组内或组间距离的平均值；对于样本量大小变化很敏感，适用于样本在欧式平面（Euclidean space）中单个数据变化有重要意义的情况；另，ANOSIM对异质性数据（方差不齐）很敏感，方差不等的情况不宜使用。

<font color=red>PERMANOVA比ANOSIM更强大，比较的是各组重心之间的差异；对样本数N以及方差的齐次性要求不高，推荐使用。</font>



以上论述依据推荐参考：
Anderson M,Walsh D.(2013) PERMANOVA, ANOSIM and the Mante test in the faceof heterogeneous dispersions: What null hypothesis are you testing?. Ecological Monographs,83(4):557-574.

---

<font color=red>Step1：数据填写方式如下图，及导入到R</font>


其中，

dune.fish.csv为6种鱼的某一指标（如体长SL/cm）的数据；

dune.fish.env32grp.csv为6种鱼对应的3个分组，分组可以依据实际需要进行分类或者按照聚类结果（如对dune.fish.csv基于UPGMA算法进行聚类）进行分类。

``` dash
dune.fish<-read.csv("~/dune.fish.csv")
View(dune.fish)
dune.fish.env32grp<- read.csv("~/dune.fish.env32grp.csv")
View(dune.fish.env32grp)
```


<img src="http://p1.bpimg.com/567571/f66c3d7d116aef92.jpg" width=80% align=center>

<!-- more -->

下图为dune.fish.backup.csv，仅仅为了方便理解数据含义，在R中不使用。

<img src="http://p1.bpimg.com/567571/f6b0947a4a30b05b.jpg" width=80% align=center>

<font color=red><center># 注意事项一，</center></font>

<font color=red>dune.fish.evn32grp.csv中的factor元素即”Group”的内容：</font>

**①必须按顺序排列，<font color=red>不能乱序</font>**

**②建议使用字母排序，如A，A，B，C，C，etc；<font color=red>不能使用纯数字</font>，如1，1，2，2，3，etc，因为纯数字在R软件中会被认为是只有1个变量，即即使增加类别，df不会改变，为1。**

---

<font color=red>Step2：进行PERMANOVA计算，结果如下图</font>

``` bash
library(vegan)
adonis(dune.fish~ Group,data = dune.fish.env32grp,permutations = 999,method="bray")->ad1
ad1
```

<img src="http://p1.bqimg.com/567571/de5cdea5a6eadeb8.jpg" width=80% align=center>

上图为PERMANOVA计算结果，与PRIMER或PAST 软件结果一致。


本例结果为，GroupA，B，C之间的F-value= 2.9155，p-value = 0.15。

<center><font color=red>注意事项二：</font></center>

**相同数据样本，在PRIMER和R软件中：SS, MS, and F-value结果完全相同，但，每进行一个999次permutations，得到p-value可能会有微小的波动。**

---

<font color=red>Step3：pairwise comparison for PERMANOVA in R software</font>

``` bash
#-------copy pairwise.adonis function code in R -----------
pairwise.adonis <-function(x,factors, sim.method, p.adjust.m)
{
 library(vegan)
 co = as.matrix(combn(unique(factors),2))
 pairs = c()
 F.Model =c()
 R2 = c()
 p.value = c()
 for(elem in 1:ncol(co)){
 ad = adonis(x[factors %in%c(as.character(co[1,elem]),as.character(co[2,elem])),] ~
 factors[factors %in%c(as.character(co[1,elem]),as.character(co[2,elem]))] , method =sim.method);
 pairs =c(pairs,paste(co[1,elem],'vs',co[2,elem]));
 F.Model =c(F.Model,ad$aov.tab[1,4]);
 R2 = c(R2,ad$aov.tab[1,5]);
 p.value = c(p.value,ad$aov.tab[1,6])
 }
 p.adjusted =p.adjust(p.value,method=p.adjust.m)
 pairw.res = data.frame(pairs,F.Model,R2,p.value,p.adjusted)
 return(pairw.res)
}
#-----------end copy-------------

pairwise.adonis(dune.fish, dune.fish.env32grp$Group, sim.method="bray", p.adjust.m= "bonferroni")

( 备忘 adonis( dune.fish~ Group, data = dune.fish.env32grp, permutations = 999, method="bray")->ad1 )
```

运行结果如下图，R软件结果与PRIMER或PAST软件一致

<img src="http://p1.bpimg.com/567571/65cd7c80a1138842.jpg" width=80% align=center>

以上！

代码分享，希望对大家有所帮助。

---

---

<center>**Q & A**</center>

Q[7]yifan1002

您好，我在用Past3的时候遇到了新的问题，当我进行mutivariate-tests-Two-way PERMANOVA分析时，也就是进行双因素permanova时，只能得到因素1和因素2及二者的总的差异是否显著，没有不同处理之间的结果…进行单因permanova时，就能得到不同处理之间的结果。我的理解，是不是因为直接进行双因素两两比较时，容易出错，所以基本上无论哪种软件都没有这种方法，不知您是否有遇到过这种情况~~~

A:

权当我发散一下思维吧：

这个<font color=red>双因素两两比较就是连续不断犯I型错误</font>，软件自己都不好意思了，或者说可能由于这个多重比较的I型错误大家都心知肚明吧，所以在等待世界优秀统计学家解决这个统计问题。PS：分享一个不太相关但很经典的例子：数据集a有两个数字 -2000和-5000，数据集b也有两个数字2000和5000，双尾t检验结果显示p-value>0.05，就是统计显示a和b的均值即-3500和3500无统计学显著差异，欢迎大家思考一下为什么
 
Q[6]yifan1002

好的，谢谢您。因为我有五个处理，两两比较就有十组，之前是分别把两组的数据提起出来单独进行比较，也就是分别进行十次比较，后来用pairwise analysis的结果和我单独比较的结果差别很大，几乎完全不一样，所以也在怀疑pairwise analysis的可靠性，我在研究下PAST3 的用法，非常感谢您~ 

A：不客气！
 
Q[5]梅卫平

ANOSIM 和 PERMANOVA的pairwise analysis声明：“Pairwise tests are not possible in vegan. My understanding is that the non-R software with such tests makes separate pairwise tests using subsets of data with only two levels of a factor in one test. We don't provide that in vegan and have no plans to provide this in the future.”(cited by Jari Oksanen, author of anosim and Adonis{vegan} in R)   https://stat.ethz.ch/pipermail/r-sig-ecology/2013-June/003865.html  

我的理解是 PRIMER等软件对ANOSIM已经PERMANOVA的传统的pairwise analysis其实都是不准确的，R软件{vegan} package的作者Jari Oksanen也不打算提供与PREMER等软件得到相同结果的传统的pairwise 代码，因为这种传统的pairwise显然会增加犯I类错误的概率，不能真实反应两两比较的显著水平。（参考 I 类错误及 II 类错误的描述）
 
Q[4]yifan1002 

您好，有两个问题想请教下，1、'nperm' >= set of all permutations: complete enumeration.
Set of permutations < 'minperm'. Generating entire set.

这个报错您解决了吗，或者这个报错对结果会不会也有影响。2、Step3中，您是把x换成dune.fish，factors换成Group之后就可以运行了吗~~最近也在做这个分析，这个代码特别有用，但运行过程中总是出错。

A：个人<font color=red>不建议对ANOSIM 或 PERMANOVA作所谓的pairwise analysis</font>，因为：例如有三group数据资料，PERMANOVA结果显示 p < 0.05；然后各group数据两两比较一次，则需比较3次，那么比较3次至少有一次犯 I 类错误 的概率就是 alpha' = 1-0.95^3 = 0.1426 > 0.05，即p-value=0.14也会判定并导出结果significant，没有意义的不正确结果。PS：如果一定要pairwise analysis的话，直接用免费的 PAST V3软件就足够用了！Best regards

 
Q[3]

非常有用，能够解决我的数据分析问题！感激！

A：

那就好。不客气
 
Q[2]

感谢！感谢！我试试！最近来沈阳应用生态所做稳定同位素实验，每天都好忙，没及时查看您的留言，再次表示抱歉啊！

A：

您客气了。希望有用。
 
Q[1]梅卫平

本文作者已进行多次反复验证，已经将R软件结果与PRIMER 7 软件和PAST v3 软件进行比较，得出上述结果。欢迎大家自行copy代码，对自己的数据和在R中使用并进行多软件分析比较。



---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn