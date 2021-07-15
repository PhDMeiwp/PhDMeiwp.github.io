---
title: 独立样本、配对样本及单样本 t 检验 样本数 至少每组多少为宜?
date: 2017-03-08 17:19:50
categories: 
- 技术
- 数据处理
tags: [样本数, t检验, 检验功效]
---

---

<center>(本文于  2016-11-25 09:12  首发于 [“科学网”](http://blog.sciencenet.cn/blog-651374-1016649.html))</center>



姑且先不说 t检验前提要求数据服从正态分布，<font color=red>以下两点需要注意：</font>

- 注意点一：一般来讲，希望有**80% 以上的统计功效（Statistical Power Level）假设检验才有效**。


- 注意点二：另外，**效应量（Effect Size，或R语言中为delta），反映处理效应大小的度量**。即，两样本平均数的差异，一般delta=1。

<!-- more -->

-  <font color=red>n ：number of observations (**per group**).</font>

<center>结果显示：一般情况（即达到80%以上统计功效的前提下），

<center>两独立样本双尾 t检验至少需要每组 17 个样本，
<center>两独立样本单尾 t 检验最少需要每组 13 个样本。</center>

补充：

power.t.test(power = 0.8,delta = 1,type = "paired")  

-   n=9.937864

<center>双尾 配对样本 t检验 至少每组 10 个样本

power.t.test(power = 0.8,delta =1,type = "paired",alternative = "one.side")

-  n = 7.727622

<center>单尾配对样本t检验至少每组8个样本

power.t.test(power = 0.8,delta =1,type = "one.sample")

-  n = 9.937864  


<center>双尾 单样本 t检验 至少每组 10 个样本


power.t.test(power = 0.8,delta =1,type = "one.sample",alternative = "one.side")

-  n = 7.727622

<center>单尾单样本t检验至少每组8个样本

<img src="http://image.sciencenet.cn/album/201611/26/124557tuulvikpegezuaeu.jpg" width=70% align=center/>

---
<center>**计算过程（在R软件中运行）如下：**</center>

> power.t.test(n = 4, delta = 1)



    Two-sample t test power calculation



n = 4

delta = 1

sd = 1

sig.level = 0.05

power = 0.2224633        #  样本数为4的话，统计功效very bad

alternative = two.sided



NOTE: n is number in *each* group

<br>

> power.t.test(n = 20, delta = 1)



Two-sample t test power calculation



n = 20

delta = 1

sd = 1

sig.level = 0.05

power = 0.8689528   # 样本数为20 的话，统计功效 good

alternative = two.sided



NOTE: n is number in *each* group

<br>

> power.t.test(power = 0.80, delta = 1)



Two-sample t test power calculation



n = 16.71477   # very important  # 两样本双尾t test，至少每组17个样本

delta = 1

sd = 1

sig.level = 0.05

power = 0.8

alternative = two.sided



NOTE: n is number in *each* group



> power.t.test(power = 0.80, delta = 1, alternative = "one.sided")



Two-sample t test power calculation



n = 13.09777   # very important  # 两样本单尾t test，至少每组13个样本

delta = 1

sd = 1

sig.level = 0.05

power = 0.8

alternative = one.sided



NOTE: n is number in *each* group



--------------------------------------------------

**特定情况，比如：效用值（Effect Size或曰 delta）为2的时候**

> power.t.test(power = 0.80, delta = 2)



Two-sample t test power calculation



n = 5.090008  # 特定条件，效用值=2 的情况，双尾只需要至少每组 5个样本

delta = 2

sd = 1

sig.level = 0.05

power = 0.8

alternative = two.sided



NOTE: n is number in *each* group



> power.t.test(power = 0.80, delta = 2, alternative = "one.sided")



Two-sample t test power calculation



n = 3.987012  # 特定条件，效用值=2 的情况，单尾只需要至少 每组 4 个样本

delta = 2

sd = 1

sig.level = 0.05

power = 0.8

alternative = one.sided



NOTE: n is number in *each* group

</center>



---

# 参考：

**1.**  [李淼新：您的t检验显著结果只是因为你的运气吗？](http://blog.sciencenet.cn/home.php?mod=space&uid=338817&do=blog&id=272318)

**2.**  [Power calculations for one and two sample t tests.](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/power.t.test.html)

**3.**  [Statistical power.](https://en.wikipedia.org/wiki/Statistical_power)

**4.** [统计功效和效应值.](http://wenku.baidu.com/view/f8d451b104a1b0717fd5dd82.html)

**5.** [t.test with varying delta.](http://www.evolutionarystatistics.org/document.pdf)



---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn