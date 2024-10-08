---
title: 新R函数包-Steel.Dwass.test
date: 2017-11-09 14:56:22
categories: 
- 技术
- R 语言
tags: [R, Steel.Dwass.test, R package]
---

---




> 大家现在可以在R软件中安装 Steel.Dwass.test 的函数包啦！

点击查看 [Steel.Dwass.test函数包的安装方法](https://github.com/PhDMeiwp/Steel.Dwass.test)。

- 我只是一个搬运工（将散落民间的Steel.Dwass.test函数编辑成可以在R软件中安装的package而已），代码并未投稿至CRAN，所以需要用github的方式进行安装此函数包

- Steel.Dwass.test的函数代码：http://aoki2.si.gunma-u.ac.jp/R/Steel-Dwass.html

- 源文献：Steel, R.G.D. (1961). Some rank sum multiple comparison tests. Biometrics 17, 539-552.

<!-- more -->


---

# Installing Steel.Dwass.test package in R

You can install directly from GitHub if you have the devtools package installed:
    
    install.packages("devtools")
    library(devtools)  
    install_github("PhDMeiwp/Steel.Dwass.test@master", force = TRUE)
    library(Steel.Dwass.test)

Then upload your dataset including x and group data, for example

     x <- c(6.9, 7.5, 8.5, 8.4, 8.1, 8.7, 8.9, 8.2, 7.8, 7.3, 6.8,9.6, 9.4, 9.5, 8.5, 9.4, 9.9, 8.7, 8.1, 7.8, 8.8,5.7, 6.4, 6.8, 7.8, 7.6, 7.0, 7.7, 7.5, 6.8, 5.9,7.6, 8.7, 8.5, 8.5, 9.0, 9.2, 9.3, 8.0, 7.2, 7.9, 7.8)
	 group <- rep(1:4, c(11, 10, 10, 11))

and run

		Steel.Dwass(x,group)

To see examples on how to use Steel.Dwass.test in R software, you can run the following R code if you have the Steel.Dwass.test package installed:

	library(Steel.Dwass.test)
    ?Steel.Dwass

# Acknowledgments

Thanks to DLMcArthur for help with R code improvement tips!





---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn