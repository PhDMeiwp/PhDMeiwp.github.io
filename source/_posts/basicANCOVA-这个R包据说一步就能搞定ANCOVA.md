---
title: 'basicANCOVA: 这个R包据说一步就能搞定ANCOVA'
date: 2018-04-16 21:05:57
categories: 
- 技术
- R 语言
tags: [R函数包, basicANCOVA, ANCOVA]
---

---


{% asset_img Fig.slope1.png Fig.slope1.png %}


<!-- more -->


[![HitCount](http://hits.dwyl.io/PhDMeiwp/basicANCOVA.svg)](http://hits.dwyl.io/PhDMeiwp/basicANCOVA)

Github源代码链接：https://github.com/PhDMeiwp/basicANCOVA

## 安装方法 (1.0.1)


    ### 从Github安装
	
	install.packages("devtools")
	library(devtools)  
	
	install_github("PhDMeiwp/basicANCOVA@master", force = TRUE)
	library(basicANCOVA)



## 使用

    ANCOVAplot(x, y, groups,data, 
       			col=1:length(levels(groups)),
       			pch=1:length(levels(groups)),
       			lty=1:length(levels(groups)),
       			legendPos="topleft",
       			...)


## 范例
	

    library(basicANCOVA)
	
    data("isotope",package = "basicANCOVA")
    View(isotope) #查看函数包自带的数据集

    
    ANCOVAplot(x = isotope$d13C,    y = isotope$d15N,
		  groups = isotope$area, data = isotope)



> R中直接输出所有数据结果，并完成作图（见文首图片）。




---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn