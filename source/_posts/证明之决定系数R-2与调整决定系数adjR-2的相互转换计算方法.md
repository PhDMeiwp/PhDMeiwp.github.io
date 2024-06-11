---
title: 证明之决定系数R^2与调整决定系数adjR^2的相互转换计算方法
date: 2017-03-08 15:16:38
categories: 
- 技术
- 数据处理
tags: [证明, 决定系数, 相关系数, 调整R平方]
---

---

<center>(本文于 2016-5-7 22:40  首发于 [“科学网”](http://blog.sciencenet.cn/blog-651374-975670.html))</center>



决定系数R^2与调整决定系数adjR^2的定义请大家自行查阅相关文献或者中英文维基百科。

进入正题，开始“决定系数R^2与调整决定系数adjR^2的相互转换计算方法”的推导过程，各点说明如下。

<font color=red>**点1. 各参数计算方式：**</font>

<img src="http://image.sciencenet.cn/album/201605/07/220449kfof2dgpklfgsnff.jpg"  align=center/>

<!-- more -->


<br>

<font color=red>**点2. 关于样本方差（sample variance 或 var(y) ）的计算公式：**</font>

<img src="http://image.sciencenet.cn/album/201605/07/213125zth0ut3uhbh5tt51.png"  align=center/>



<font color=red>**点3. 明确一些R^2计算相关英文的缩写：**</font>

**3.1: TSS=SST**   Total sum of squares;

**3.2: ESS=RegSS**   Regression (Explained) Sum of Squares (https://en.wikipedia.org/wiki/Explained_sum_of_squares);

**3.3: RSS=SSR=SSE** Residual Sum of Squares; Sum of Squared Residuals or Sum of Squared Errors of prediction（https://en.wikipedia.org/wiki/Residual_sum_of_squares);

**3.4: RegSS = SST - SSE;**

**3.5: TSS = ESS + RSS** (https://en.wikipedia.org/wiki/Partition_of_sums_of_squares);

**3.6: R^2 = RegSS/SST = 1 − SSE/SST.**

<font color=darkgreen><big>**3.7: Residual standard error σˆ =sqrt(SSE/(n−k))**</big></font>

<br>

<font color=red>**点4. SST与方差的关系**</font>

由"点1"和"点2"可知:

**4.1: SST=(var(y))*(n-1)**   即：总平方和 = 样本方差 * (样本数-1)

由此可以推导出在只知道 "Residual Sum of squares" (即SSE)的情况（如Origin 和 R 软件的非线性拟合），R^2的计算公式 <font color=red>equation(3)：</font>


<img src="http://image.sciencenet.cn/album/201605/07/222037tile9z9c72gi1ji2.png" width=50% aligin=center/)


<font color=red>点5. 决定系数R^2与调整决定系数R^2的换算公式，</font>请直接查阅[英文维基百科](https://en.wikipedia.org/wiki/Coefficient_of_determination)。

<font color=red>equation (2)：</font>

<img src="http://image.sciencenet.cn/album/201605/07/222634rjmsznstrsnljm6l.png" width=50% aligin=center/)


**补充内容如下：**

**the Residual standard error σˆ =sqrt(SSE/(n−k−1))**

**即 SSE= (residual standard error^2) * (n-k-1)**

<font color=darkgreen>#其中“n”为y的样本数，“k”为参数个数（此处k＝2，即y=a*x+b中的参数a和b)

∴ R^2 = 1- [(residual standard error^2) * (n-k)] / [(var(y)) * (n-1)]





<font color=red>equation (1)：</font>

<img src="http://image.sciencenet.cn/album/201605/07/222634tjrgtmzmzntmjsn1.png" width=50% aligin=center/)



其中“n"为变量y的样本数，“k”为变量个数（如k＝2，即y=a*x+b的拟合情况）</font>


<br></br>

---

**小贴士：决定系数R^2和相关系数r^2是两个不同的概念，但二者的数值是相等的，在描述时需要注意。**






---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn