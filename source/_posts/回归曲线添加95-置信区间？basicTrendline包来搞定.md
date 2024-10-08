---
title: 回归曲线添加95%置信区间？basicTrendline包来搞定
date: 2018-07-28 12:53:11
categories:
- 技术
- R 语言
tags: [R; basicTrendline]
---

---


{% asset_img basicTrendline.png basicTrendline.png %}


## 安装 basicTrendline包（在R或Rstudio中运行）

从CRAN安装:

	install.packages("basicTrendline")

从github安装:
	
	install.packages("devtools")
	devtools::install_github("PhDMeiwp/basicTrendline@master", force = TRUE)


<!-- more -->



## version 2.0.3 有哪些更新？	

- add several arguments to `trendline()` function, including show.equation, show.Rpvalue, Rname, Pname, xname, yname, yhat, CI.fill, CI.level, CI.alpha, CI.color, CI.lty, CI.lwd, ePos.x, ePos.y, las.
- enable to draw confidence interval for regression models (arguments CI.fill, CI.level, etc.)
- add 'show.equation' and show.Rpvale' arguments to enable to choose which parameter to show
- add 'Rname' and 'Pname' arguments to specify the character of R-square and P-vlaue (i.e. R^2 or r^2; P or p)
- add 'xname' and 'ynameto' arguments to specify the character of 'x' and 'y' in the equation
- add 'yhat' argument to enable to add a hat symbol on the top of 'y' in the equation
- add 'ePos.x' and 'ePos.y' arguments to specify the x and y co-ordinates of equation's position
- deleted the 'ePos' argument 
- add "Residual Sum of Squares" to the output of 'trendline_summary()' function


## 实例（8个cases）
	
		library(basicTrendline)
		x <- c(1, 3, 6,  9,  13,   17)
		y <- c(5, 8, 11, 13, 13.2, 13.5)

### [case 1] 默认case （自动添加95%置信区间lines and fill color）
		trendline(x, y, model="line2P", ePos.x = "topleft", summary=TRUE, eDigit=5)


{% asset_img case1.png case1.png %}

### [case 2]  只添加95%置信区间的lines，不fill color (set CI.fill = FALSE)
		trendline(x, y, model="line3P", CI.fill = FALSE, CI.color = "black", CI.lty = 2, linecolor = "blue")


{% asset_img case2.png case2.png %}

### [case 3]  只绘制回归曲线，不添加95%置信区间 (set CI.color = NA)
		trendline(x, y, model="log2P", ePos.x= "top", linecolor = "red", CI.color = NA)


{% asset_img case3.png case3.png %}

### [case 4]  显示方程，不显示R值和P值 (set show.Rpvalue = FALSE)
		trendline(x, y, model="exp2P", show.equation = TRUE, show.Rpvalue = FALSE)


{% asset_img case4.png case4.png %}

### [case 5]  自定义方程中的参数的名称
** see Arguments c('xname', 'yname', 'yhat', 'Rname', 'Pname') **
		trendline(x, y, model="exp3P", xname="T", yname=paste(delta^15,"N"),
				yhat=FALSE, Rname=1, Pname=0, ePos.x = "bottom")


{% asset_img case5.png case5.png %}

### [case 6]  改变方程的 小数位，字体颜色，字号大小
		trendline(x, y, model="power2P", eDigit = 3, eSize = 1.4, text.col = "blue")


{% asset_img case6.png case6.png %}
		
### [case 7]  不显示方程，只显示回归曲线 (set ePos.x = NA)
		trendline(x, y, model="power3P", ePos.x = NA)

{% asset_img case7.png case7.png %}


### [case 8]  使用 par {graphics} 设置绘图区大小（可到ggplot2的美观效果）
###                                缩小x轴文字的大小，x-lable和x轴之间的距离
		### NOT RUN
		par(mgp=c(1.5,0.4,0), mar=c(3,3,1,1), tck=-0.01, cex.axis=0.9)

		trendline(x, y)

		# dev.off()

		### END (NOT RUN)
	

{% asset_img case8.png case8.png %}

---

## 描述文件

Plot, draw regression line and confidence interval, and show regression equation, R-square and P-value, as simple as possible, 

by using different models built in the 'trendline()' function. The function includes the following models in the latest version: 

"line2P" (formula as: y=a\*x+b), 

"line3P" (y=a\*x<sup>2</sup>+b\*x+c), 

"log2P" (y=a\*ln(x)+b), 

"exp2P" (y=a\*e<sup>b\*x</sup>), 

"exp3P" (y=a\*e<sup>b\*x</sup>+c), 

"power2P" (y=a\*x<sup>b</sup>), 

"power3P" (y=a\*x<sup>b</sup>+c). 

Besides, the summarized results of each fitted model are also output by default.

## 使用

     trendline(x, y, model = "line2P", Pvalue.corrected = TRUE,
			linecolor = "blue", lty = 1, lwd = 1, 
			show.equation = TRUE, show.Rpvalue = TRUE, 
			Rname = 1, Pname = 0, xname = "x", yname = "y",
			yhat = FALSE, 
			summary = TRUE, 
			ePos.x = NULL, ePos.y = NULL, text.col = "black", eDigit = 5, eSize = 1, 
			CI.fill = TRUE, CI.level = 0.95, CI.color = "grey",	CI.alpha = 1, CI.lty = 1, CI.lwd = 1, 
			las = 1, xlab = NULL, ylab = NULL, ...)

## “参数”介绍

<br>**x, y**<br>	
the x and y arguments provide the x and y coordinates for the plot. Any reasonable way of defining the coordinates is acceptable.

<br>**model**<br>	
select which model to fit. Default is "line2P". The "model" should be one of c("line2P", "line3P", "log2P", "exp3P", "power3P"), their formulas are as follows:
<br>"line2P": y=a\*x+b 
<br>"line3P": y=a\*x<sup>2</sup>+b\*x+c 
<br>"log2P": y=a\*ln(x)+b 
<br>"exp2P": y=a\*e<sup>b\*x</sup>
<br>"exp3P": y=a\*e<sup>b\*x</sup>+c 
<br>"power2P": y=a\*x<sup>b</sup>
<br>"power3P": y=a\*x<sup>b</sup>+c

<br>**Pvalue.corrected**<br>	
if P-value corrected or not, the vlaue is one of c("TRUE", "FALSE").

<br>**linecolor**<br>	
color of regression line.

<br>**lty**<br>
line type. lty can be specified using either text c("blank","solid","dashed","dotted","dotdash","longdash","twodash") or number c(0, 1, 2, 3, 4, 5, 6). Note that lty = "solid" is identical to lty=1.

<br>**lwd**	<br>
line width. Default is 1.

<br>**show.equation**	<br>
whether to show the regression equation, the value is one of c("TRUE", "FALSE").

<br>**show.Rpvalue**	<br>
whether to show the R-square and P-value, the value is one of c("TRUE", "FALSE").

<br>**Rname**	<br>	
to specify the character of R-square, the value is one of c(0, 1), corresponding to c(r^2, R^2).

<br>**Pname**	<br>	
to specify the character of P-value, the value is one of c(0, 1), corresponding to c(p, P).

<br>**xname**	<br>	
to specify the character of "x" in equation, see Examples [case 5].

<br>**yname**	<br>	
to specify the character of "y" in equation, see Examples [case 5].

<br>**yhat**	<br>	
whether to add a hat symbol (^) on the top of "y" in equation. Default is FALSE.

<br>**summary**	<br>
summarizing the model fits. Default is TRUE.

<br>**ePos.x, ePos.y**<br>	
equation position. Default as ePos.x = "topleft". If no need to show equation, set ePos.x = NA. It's same as those in legend.

<br>**text.col**<br>
the color used for the legend text.

<br>**eDigit**	<br>
the numbers of digits for equation parameters. Default is 5.

<br>**eSize**	<br>
font size in percentage of equation. Default is 1.

<br>**CI.fill**<br>	
fill the confidance interval? (TRUE by default, see 'CI.level' to control)

<br>**CI.level**<br>		
level of confidence interval to use (0.95 by default)

<br>**CI.color**<br>		
line or fill color of confidence interval.

<br>**CI.alpha**<br>		
alpha value of fill color of confidence interval.

<br>**CI.lty**<br>		
line type of confidence interval.

<br>**CI.lwd**<br>		
line width of confidence interval.

<br>**las**<br>		
style of axis labels. (0=parallel, 1=all horizontal, 2=all perpendicular to axis, 3=all vertical)

<br>**xlab, ylab**<br>		
labels of x- and y-axis.

**...**<br>
additional parameters to plot,such as type, main, sub, xlab, ylab, col.

## 细节描述

The linear models (line2P, line3P, log2P) in this package are estimated by **lm** function, while the **nonlinear models (exp2P, exp3P, power2P, power3P)** are estimated by **nls** function (i.e., **least-squares method**).
<br>The argument 'Pvalue.corrected' is workful for non-linear regression only.
<br>If "Pvalue.corrected = TRUE", the P-vlaue is calculated by using "Residual Sum of Squares" and "Corrected Total Sum of Squares (i.e. sum((y-mean(y))^2))".
<br>If "Pvalue.corrected = TRUE", the P-vlaue is calculated by using "Residual Sum of Squares" and "Uncorrected Total Sum of Squares (i.e. sum(y^2))".

## 注意事项

Confidence intervals for nonlinear regression (i.e., objects of class nls) are based on the linear approximation described in Bates & Watts (2007).

## 参考文献

Bates, D. M., and Watts, D. G. (2007) *Nonlinear Regression Analysis and its Applications*. Wiley.

Greenwell B. M., and Schubert-Kabban, C. M. (2014) *investr: An R Package for Inverse Estimation*. The R Journal, 6(1), 90-100.

## 返回值

R<sup>2</sup>, indicates the R-Squared value of each regression model.

p, indicates the p-value of each regression model.

AIC or BIC, indicate the Akaike's Information Criterion or Bayesian Information Criterion for fitted model. Click AIC for details. The smaller the AIC or BIC, the better the model.

RSS, indicates the "Residual Sum of Squares” of regression model.

---

To see examples on how to use "basicTrendline" in R software, you can run the following R code if you have the "basicTrendline" package installed:

    library(basicTrendline)
    ?trendline()


## 致谢

We would like to express my special thanks to **Uwe Ligges, Swetlana Herbrandt, and CRAN team** for their very valuable comments to the 'basicTrendline' package.
Our thanks also go to those who contributed R codes by:

- adding conficende interval for both lm and nls objects: https://github.com/bgreenwell/investr
- adding-regression-line-equation-and-r2-on-graph-1: http://blog.sciencenet.cn/blog-267448-1021594.html
- adding-regression-line-equation-and-r2-on-graph-2: https://stackoverflow.com/questions/7549694/adding-regression-line-equation-and-r2-on-graph
- What is non-linear regression?: https://datascienceplus.com/first-steps-with-non-linear-regression-in-r/
- adding regression line for nonlinear regression: http://blog.sciencenet.cn/blog-651374-1014133.html
- R codes for 'print.summary.nls of exp3P and power3P' cite from https://github.com/SurajGupta/r-source/blob/master/src/library/stats/R/nls.R

## Bug修复

- If you have any question or comment to this package, tell me at [here](http://meiweiping.cn/en/basicTrendline-an-R-package-for-adding-trendline-of-basic-regression-models-to-plot/).

- Bugs and feature requests can be filed to https://github.com/PhDMeiwp/basicTrendline/issues. BTW, [Pull requests](https://github.com/PhDMeiwp/basicTrendline/pulls) are also welcome.

## PDF文件下载

The **PDF file** of this R package is available at https://cran.r-project.org/web/packages/basicTrendline/index.html 






---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn