---
title: '安装运行SIBER（in SIAR）时，如何解决 Error: not a matrix'
date: 2017-03-24 10:10:44
categories: 
- 科研
- 同位素
tags: [同位素, SIBER, SIAR, Error, not a matrix]
---

---

<center>(本文于 2016-5-30 22:09 首发于 [“科学网”](http://blog.sciencenet.cn/blog-651374-981319.html))</center>



<font color=red>原创博文，谢绝转载</font>

<font color=red>**2017/10/05 updated**</font>

<font color=red>温馨提示：请确保您的 R软件（及R相关软件）安装的系统盘（e.g., C盘），这点十分重要！ </font>


<!-- more -->


【SIBER (SIAR package) in R：物种生态位重复度计算】的博文请点击下面的网址:

http://meiweiping.cn/SIBER%20(SIAR-package)-in-R%EF%BC%9A%E7%89%A9%E7%A7%8D%E7%94%9F%E6%80%81%E4%BD%8D%E9%87%8D%E5%A4%8D%E5%BA%A6%E8%AE%A1%E7%AE%97/
 
<!-- more -->

When tring SIBER (in SIAR) , however after entering the following codes:

``` bash
SEA.B <- siber.ellipses(dC,dN,group,R=reps)
```

error occured as:

``` bash
Error: not a matrix
```

Eventhough try the following method, it does not worked.

1.Updated packages.

2.Updated R.

3.Delete R and reinstalled.

---

Anyway, now show you the **solved method** briefly:

**Step 1.** 

Install the lastest **"Rtools33.exe"** into your computer(e.g., **C: disk**) from website: 

https://cran.r-project.org/bin/windows/Rtools/



<b><font color=grey>

（所安装的Rtools版本号和 R软件的版本号是否对应正确，见下图）

![比如Rtools33.exe对应的R软件版本就是R3.2.x-3.3.x.PNG](https://i.loli.net/2017/10/05/59d6208f8ddca.png)


安装 Rtools34.exe的网友请另外注意：

Change History of Rtools34.exe

Changes since R 3.3.0

The version number has been updated to 3.4.x.y.

Support for the gcc 4.6.3 toolchain has been dropped.

We have updated Tcl/TK to version 8.6.4. If you are using Rtools34 to build R 3.3.x, you will need to change 

TCL_VERSION = 85

to

TCL_VERSION = 86

in R_HOME/src/gnuwin32/fixed/etc/Makeconf.

</font></b>


# It's a pity that the software is not working on Mac.


**Step 2.** 

Run some [codes](https://github.com/AndrewLJackson/siar) like below in R or Rstudio:

``` bash
library(devtools)

install_github("andrewljackson/siar@master", build_vingettes = TRUE)

library(siar)
```

Yeah,now it can work properly, right? OK, you can you try it.


---

---

<center>**FAQ**</center>

1\. 2017-3-28 23:07

Following my recent post about SIBER being broken by spatstat's new structure, if anyone is still using SIAR you will also need to update to the development version on github:

``` bash
devtools::install_github("andrewljackson/siar", build_vingettes == TRUE)
```

2\. 2017-03-28 20:18

**Important** SIBER news. 

A major change to the package spatstat on which SIBER depends has broken my new version of SIBER that i just uploaded to CRAN. I will not be able to get a new version up for a few weeks, so in the meantime, please install the development branch directly from github using the code below. More details available at 

https://github.com/AndrewLJackson/SIBER/blob/master/NEWS.md

``` bash
# install.packages("devtools") # install if necessary

devtools::install_github("andrewljackson/SIBER",
build_vingettes = TRUE)

library(SIBER)
```






---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn