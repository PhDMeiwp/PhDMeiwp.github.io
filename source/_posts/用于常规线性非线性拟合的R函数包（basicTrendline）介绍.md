---
title: 用于常规线性非线性拟合的R函数包（basicTrendline）介绍
date: 2018-01-10 15:20:38
categories:   
- 技术
- R 语言
tags: [R, basicTrendline, nls, lm]
toc: false
---

---

CRAN官网链接： https://cran.r-project.org/web/packages/basicTrendline/index.html

{% asset_img CRAN-basicTrendline.JPG CRAN-basicTrendline.JPG %}

![log.png](https://i.loli.net/2017/12/20/5a39cf4962808.png)

<!-- more -->

![Multilines.png](https://i.loli.net/2018/01/10/5a55c3a42a16e.png)

> 使用过nls()来作非线性回归的朋友，感觉都要吐槽一下nls(formula, start = list(a = ***, b = ***)里面的起始值（a，b）的设定，n次都设不对是怎样一个感受？抓狂到想要放弃用R有木有？

其实我们只想要像excel里面添加趋势线那样简单，就能得到非线性回归方程的各个结果而已。

最新CRAN正式上线的R函数包——"basicTrendline" package 终于解决了这个问题。

先来看两张效果图（第一张为log线性回归，第二张为包含线性和非线性回归方程的组合图）：

> 如果对线性回归和非线性回归的区分还模棱两可的朋友，请看此R包第三作者的[这篇博文](http://blog.sciencenet.cn/blog-267448-686836.html)。


---

闲言太多，步入正题！

“basicTrendline”源代码直接点击 [这里](https://github.com/PhDMeiwp/basicTrendline)。

> **R函数包"basicTrendline"到底用来干什么？**

用于一步完成绘图，添加线性或非线性拟合线，在图上显示回归方程及R<sup>2</sup>和回归模型的p值（不是参数的p值）。</font> 并且，它默认会同时输出模型summary()的结果，即各参数的具体数值及SD值，t值，p值等等。

> **一个严肃的问题：它结果可信吗？**

- 我们已经检测了我们的R函数包“basicTrendline”, 它工作性能稳定；
- 更重要的是它的拟合**结果和商业软件OriginPro完全相等**；
- 甚至**对幂函数power函数（y=a\*x^b +c）比OriginPro软件更好**
（更高的R<sup>2</sup>，更低的p值，因为我们采取了优于Origin软件的selfStart计算方法）！


## 在R中安装 "basicTrendline" 函数包

1\. 直接从CRAN官方获取资源安装：

	install.packages("basicTrendline")
	library(basicTrendline)

2\. 使用Github资源安装：

    install.packages("devtools")
	library(devtools)   
	install_github("PhDMeiwp/basicTrendline@master", force = TRUE)
	library(basicTrendline)


## 使用 "basicTrendline" 函数包
	
建立 x，y数据集，比如：

    x<-c(1,30,90,180,360)
    y<-c(4,8,10,11,11)

然后运行：

	library(basicTrendline)

	trendline(x,y,model="exp3P", summary=TRUE, eDigit=10, ePos="topleft",linecolor="red")  
	
你能用通用的函数 "trendline()"，但只需改变参数 model 的值，即可输出不同的回归模型的结果以及图。

参数“model” 的值为 'lin2P','line3P','log2P','exp3P','power3P'的其中一个。
	
- "line2P"    # y=a\*x+b

- "line3P"    # y=a\*x^2+b\*x+c

- "log2P"     # y=a\*ln(x)+b

- "exp3P"     # y=a\*exp(b\*x)+c

- "power3P"   # y=a*x^b+c)


## 创新点（再强调一下而已）

- "basicTrendline"函数包对幂函数的拟合（'power3P' model：y = ax^b +c）能得到比OriginPro软件更好的结果（更高的R^2,更低的p值）。为什么呢？因为我们采取了比OriginPro软件更高级的针对幂函数回归的selfStart算法呀，其实核心是OriginPro软件里面的幂函数回归没有考虑数据的 凹凸趋势（增凹趋势，降凸趋势等等，文末 Examples 的代码里有提到）。下面是例子:

>formula as y=a*x^b +c

x<- c(1,30,60,90,180,360)

y<- c(2,14,16,18,19,20)  # increase convex-function

>OriginPro软件结果:

c=-7344.578

a=7347.183

b=43224.4

<font color=red>adjR^2= 0.97129       # lower adjR^2 value</font>

p-value of model=2.24891e-4

>'basicTrendline'函数包结果:

c=34.671

a=-32.703

b=-0.13999

<font color=red>adjR^2= 0.99346 >  0.97129   # higher (or better ) adjR^2 value</font>

p-value of model= 2.44924-5 < 2.24891e-4


## 输出图

![line2P.png](https://i.loli.net/2017/12/20/5a39cf4954e69.png)
![line3P.png](https://i.loli.net/2017/12/20/5a39d001c5049.png)
![log.png](https://i.loli.net/2017/12/20/5a39cf4962808.png)
![log0.5.png](https://i.loli.net/2017/12/20/5a39cf4962781.png)

![power.png](https://i.loli.net/2017/12/20/5a39cf496566f.png)

![Multilines.png](https://i.loli.net/2018/01/10/5a55c3a42a16e.png)

查看更多"basicTrendline"函数包的功能或使用方法, 请运行:

    library(basicTrendline)
    ?trendline()

上面各种类型的回归以及最后的组合图的例子，代码在 ?trendline()的 Examples 里面都有哦。下面也copy一下方便直接查看。

## Examples （R code）

	#先设计一些数据
	x1<-1:5
	x2<- -2:2
	x3<- c(101,105,140,200,660)
	x4<- -5:-1
	x5<- c(1,30,90,180,360)
	
	y1<-c(2,14,18,19,20)        # 增凸趋势 increasing convex trend
	y2<- c(-2,-14,-18,-19,-20)  # 降凹趋势 decreasing concave trend
	y3<-c(2,4,16,38,89)         # 增凹趋势 increasing concave trend
	y4<-c(-2,-4,-16,-38,-89)    # 降凸趋势 decreasing convex trend
	y5<- c(600002,600014,600018,600019,600020) # high y values with low range.
	
上面都是输入数据，下面才是核心，代码运行很简单有木有？	

	library(basicTrendline)
	trendline(x1,y1,model="line2P",summary=TRUE,eDigit=10) #第一张图的代码已完成。
	
	trendline(x2,y2,model="line3P",summary=FALSE,ePos="topright") #第二张图的代码已完成，诸如此类。
	
	trendline(x3,y3,model="log2P",linecolor="blue")
	trendline(x4,y4,model="exp3P",eSize=0.7) #change the font size of equation.
	trendline(x5,y5,model="power3P")
	
	## Not run 绘制组合图
	plot(x1,y1,main="Different regression lines in one plot") #绘制底图散点图
	
	library(basicTrendline)
	trendline(x1,y1,model="line2P",plot=FALSE,ePos="none",linecolor="red") #添加 y=a*x+b 线性回归
	
	trendline(x1,y1,model="log2P",plot=FALSE,ePos="none",linecolor="blue",lty=2) #添加 y=a*ln(x)+b 线性回归
	
	trendline(x1,y1,model="exp3P",plot=FALSE,ePos="none",linecolor="black",lty=3) #添加 y=a*exp(b*x)+c 非线性回归
	
	legend("bottomright",c("line2P","log2P","exp3P"), lty=c(1,2,3),col=c("red","blue","black")) #最后添加legend，完成。
	
	## END (Not run)


## 贡献者

R codes contributed by


- adding-regression-line-equation-and-r2-on-graph-1: http://blog.sciencenet.cn/blog-267448-1021594.html
- adding-regression-line-equation-and-r2-on-graph-2: https://stackoverflow.com/questions/7549694/adding-regression-line-equation-and-r2-on-graph
- What is non-linear regression?: https://datascienceplus.com/first-steps-with-non-linear-regression-in-r/
- adding regression line for nonlinear regression: http://blog.sciencenet.cn/blog-651374-1014133.html
- R codes for 'print.summary.nls of exp3P and power3P' cite from https://github.com/SurajGupta/r-source/blob/master/src/library/stats/R/nls.R
- and so on...



---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn