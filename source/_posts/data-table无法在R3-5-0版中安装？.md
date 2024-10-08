---
title: data.table无法在R3.5.0版中安装？
date: 2018-04-26 22:14:53
categories: 
- 技术
- R 语言
tags: [data.table]
---

---

R版本更新到3.5.0了，新问题又来了：最基础的data.table函数包无法安装了。

分享一下我刚刚试过并且成功了的解决方案(参考[这里](https://stackoverflow.com/questions/49838553/data-table-package-in-r-3-5-does-not-install))。

<!-- more -->

##第一步： 下载zip文件##

按照下面这个图片去github的[这个位置](https://github.com/Rdatatable/data.table/wiki)去下载data.table_1.10.5.zip文件到你的R默认工作路径PATH（一般都在C:/Users/yourPCname/Documents/）。

{% asset_img click.jpg click.jpg %}

提示：如果从上图中标示的（1）的位置下载的zip文件安装不成功，则用图示（2）的位置去下载zip文件。

##第二步：安装##

打开R软件（Rstudio此时没用），运行下面的代码，

	install.packages("~/data.table_1.10.5.zip")

出现 package ‘data.table’ successfully unpacked and MD5 sums checked 字样即表示安装成功。

	library(data.table)

运行data.table显示package ‘data.table’ was built under R version 3.6.0 ，也就是说在 R version 3.5.0肯定可以用啦。

{% asset_img Rcode.jpg Rcode.jpg %}

不放心的朋友，在R中安装完成后，可以重新打开Rstudio软件，看Packages里面应该就已经有 data.table函数包了，也就是安装成功啦。

以上。



---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn