---
title: 决定系数R^2与调整决定系数adjR^2的相互转换计算方法
date: 2017-03-08 15:15:17
categories: 
- 技术
- 数据处理
tags: [决定系数, 相关系数, 调整R平方]
---


<center>(本文于 2016-5-7 14:50  首发于 [“科学网”](http://blog.sciencenet.cn/blog-651374-975591.html))</center>



一般线性或者非线性拟合等情况下，

Origin 等软件可能会直接导出调整后的R^2（即adjR^2），

R 等软件可能只导出 Residual Sum of squares（即SSE），<font color=darkgreen>**或 Residual standard error**</font>

而不显示决定系数R^2（或者说相关系数 r^2 ），

但在发表论文时，可能会有需要把adjR^2转换成R^2，本文提供了二者相互转换的计算方法，相关引用在文末有注明。

<!-- more -->

---
# 正文

假设y~x 或者说 bogy weight~body length 的情况，用x来拟合y，<font color=red>其中“n”为y的样本数，“k”为参数个数（如k＝2，即y=a*x+b中的参数a和b）</font>，则：

<font color=red>equation (1)：

<img src="http://image.sciencenet.cn/album/201605/07/1424298z3efj63ar8vv38v.png" width=50%>



equation (2)：</font>

<img src="http://image.sciencenet.cn/album/201605/07/1424302p9q22w4p8w2pdj0.png" width=50%>

另外，补充一个 **R 或者 RStudio**软件中，只导出 "Residual Sum of squares" (**即SSE**)的情况，怎么计算R^2:

<font color=red>equation (3):</font>

<img src="http://image.sciencenet.cn/album/201605/07/143401w1dnwf0gf60xfabb.png" width=50%>


其中，var（y）为原始变量y的方差，不是标准差或其他意思，请注意。

<font color=darkgreen>再补充内容如下：

the residual standard error σˆ =sqrt(SSE/(n−k))

即 SSE= (residual standard error^2)*(n-k)

**#** 其中“n”为y的样本数，“k”为参数个数（如k＝2，即y=a*x+b中的参数a和b）

∴ R^2 = 1- [(residual standard error^2)*(n-k)] / [(var(y))*(n-1)]</font>







上述公式的<font color=dark>推导过程</font>，有兴趣的朋友们，欢迎查看下列我所引用的内容，或者查看我的[另外一篇博文](http://blog.sciencenet.cn/blog-651374-975670.html)。


---
# 参考
1.[决定系数(拟合优度)的相关概念.]( http://blog.sina.com.cn/s/blog_6aaea1760101oqbk.html)

2.[Definitions of R^2 adnd adjR^2.](https://en.wikipedia.org/wiki/Coefficient_of_determination)

3.[Residual sum of squares and Residual standard error,etc.Page7-8.](https://stat.ethz.ch/education/semesters/ss2012/regression/Part5.pdf)

4.[为什么样本方差（sample variance）的分母是n-1.](https://www.zhihu.com/question/20099757)





---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn