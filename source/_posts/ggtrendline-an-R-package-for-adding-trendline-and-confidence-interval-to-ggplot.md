---
title: >-
  ggtrendline: an R package for adding trendline and confidence interval to
  ggplot
categories:
  - 技术
  - R 语言
tags:
  - R 语言
  - ggtrendline
  - R package
  - basicTrendline
date: 2022-05-04 18:15:51
---

{% asset_img ggtrendline.hex.png %} 

[![cran version](http://www.r-pkg.org/badges/version/ggtrendline)](http://cran.rstudio.com/web/packages/ggtrendline) 
[![rstudio mirror total downloads](http://cranlogs.r-pkg.org/badges/grand-total/ggtrendline)](https://github.com/metacran/cranlogs.app)
[![rstudio mirror downloads per month](http://cranlogs.r-pkg.org/badges/ggtrendline)](https://github.com/metacran/cranlogs.app)

## 0. Links

Links of 'ggtrendline' package are as follows: https://cran.r-project.org/package=ggtrendline and https://github.com/PhDMeiwp/ggtrendline

------

## 1. Installing "ggtrendline" package in R

###  1.1 Get the released version from CRAN:

		install.packages("ggtrendline")

###  1.2 Get the development version from Github:

		install.packages("devtools")
		devtools::install_github("PhDMeiwp/ggtrendline@master", force = TRUE)
		library(ggtrendline)

------

## 2. Using "ggtrendline" package
	
     library(ggplot2)
	 library(ggtrendline)
     x <- c(1, 3, 6, 9,  13,   17)
     y <- c(5, 8, 11, 13, 13.2, 13.5)

### 2.1 default ("line2P")

     ggtrendline(x, y, model = "line2P")  

{% asset_img summary.png %} 

{% asset_img line2P.png %} 


### 2.2 add geom_point()

     ggtrendline(x, y, model = "line3P") + 
			geom_point(aes(x, y)) + theme_bw()

{% asset_img line3P.png %} 

### 2.3 CI lines only, without CI filling

     ggtrendline(x, y, model = "log2P", CI.fill = NA) + 
			geom_point(aes(x, y))+ theme_classic() 
	
{% asset_img log2P.png %} 

### 2.4 set the regression line and geom_point()

     ggtrendline(x, y, model = "exp2P", linecolor = "blue", linetype = 1, linewidth = 1) + 
             geom_point(aes(x, y), color = "blue", shape = 1, size = 3)  

{% asset_img exp2P.png %} 
		
### 2.5 set confidence interval

     ggtrendline(x, y, model = "exp3P", CI.level = 0.99, 
                CI.fill = "red", CI.alpha = 0.1, CI.color = NA, CI.lty = 2, CI.lwd = 1.5) + 
             geom_point(aes(x, y)) 

{% asset_img exp3P.png %} 		

### 2.6 one trendline with different points belonged to multiple groups.

		library(ggplot2)
		library(ggtrendline)
		data("iris")
		x <- iris$Petal.Width
		y <- iris$Petal.Length
		group <- iris$Species
		ggtrendline(x,y,"exp3P") + geom_point(aes(x,y,color=group))

{% asset_img group.png %} 

------

## 3. Details

### 3.1 Description

The 'ggtrendline' package is developed for adding **trendline and confidence interval** of **linear or nonlinear regression** model, and **showing equation, R square, and P value**  to 'ggplot' as simple as possible. 

For a general overview of the methods used in this package, see Ritz and Streibig (2008) <doi:10.1007/978-0-387-09616-2> and Greenwell and Schubert Kabban (2014) <doi:10.32614/RJ-2014-009>.

### 3.2 ggtrendline function

The built-in 'ggtrendline()' function includes the following models:
"line2P", formula as: y = a\*x + b;
"line3P", y = a\*x<sup>2</sup> + b\*x + c;
"log2P" , y = a\*ln(x) + b; 
"exp2P", y = a\*e<sup>b\*x</sup>; 
"exp3P", y = a\*e<sup>b\*x</sup> + c;
"power2P", y = a\*x<sup>b</sup>;
"power3P", y = a\*x<sup>b</sup> + c.

### 3.3 stat_eq and stat_rrp functions

**The built-in 'stat_eq()' and 'stat_rrp()' functions can be used separately, i.e., not together with 'ggtrendline()' function.**

To see more details, you can run the following R code if you have the "ggtrendline" package installed:

    library(ggtrendline)
    ?ggtrendline
	?stat_eq
	?stat_rrp

------
	
## 4. Contact

- Bugs and feature requests can be filed to https://github.com/PhDMeiwp/ggtrendline/issues. 
- BTW, [Pull requests](https://github.com/PhDMeiwp/ggtrendline/pulls) are also welcome.

------

## 5. Acknowledgements

We would like to express our special thanks to **Uwe Ligges, Gregor Seyer, and CRAN team** for their valuable comments to the 'ggtrendline' package.


----
<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>
----

<p style="color:darkred"> 由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！转载与分享请注明：本文源于 http://meiweiping.cn </p>
