---
title: R语言中的anova()并非单因素方差分析的ANOVA
date: 2017-03-18 12:24:14
categories: 
- 技术
- R 语言
tags: [单因素方差分析, R 语言, Anova, anova]
---

---

<center>(本文于  2016-11-30 17:09  首发于 [“科学网”](http://blog.sciencenet.cn/blog-651374-1017704.html))</center>



R语言中的 <font color=red>anova()并非我们一般实验设计的方差分析</font>，欢迎大家自行比对其他软件分析结果，在此就不赘述。



**一般的单因素方差分析即ANOVA**, 在R语言中有两种:

<!-- more -->

---

<center>**第一种：**</center>

① **aov()**->mod1,summary(mod1)，**此方法必须两步，不可直接 aov()；**

ex.,

``` bash
aov(y~factor(species))->mod1
summary(mod1)   

```

N.B.,此处结果在R语言中<font color=red>为type I 的ANOVA结果</font>，根据实验设计需求决定是否采取此方法, <font color=red>一般不采用</font>。

  

---

<center>**第二种：**</center>

② library(car)中的 Anova()

ex.,

``` bash
library(car)
aov(y~factor(group))->mod1
Anova(mod1,type=3)   # 注意字母大小写必须一致！
```


<font color=red>**上述 type=3 的结果才是我们常说的单因素方差分析的结果**</font>




---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn