---
title: 用R软件件作雷达图（或蜘蛛网图）
date: 2017-03-15 20:20:01
categories: 
- 技术
- R 语言
tags: [R 语言, 雷达图, 蜘蛛网图]
---

---

<center>(本文于 2016-7-1 13:15 首发于 [“科学网”](http://blog.sciencenet.cn/blog-651374-987966.html))</center>



以5个变量（即雷达图的5个坐标轴，如某种鱼的5种饵料贡献率 part1 to part5）数据为例，

<!-- more -->

**第一步：设置各个变量的取值范围**（即最小值和最大值，相当于二维图的x轴和y轴的取值范围），代码如下：

``` bash
maxmin <- data.frame(

    part1=c(50, 0),

    part2=c(50, 0),

    part3=c(50, 0),

    part4=c(50, 0),

    part5=c(50, 0))

# 取值范围为 先最大值 后最小值，即上述c（100,0）
```

**第二步：设置准备绘图的指标类型的数据**，如 A 种鱼的5种饵料贡献率

``` bash

dat.A<- data.frame(

    part1=50,

    part2=20,

    part3=15,

    part4=10,

    part5=5)
```

**第三步：把数据集 maxmin 和 dat.A 组合成为新的数据集**，命名为dat.A2

``` bash
dat.A2<-rbind(maxmin,dat.A)
```

**第四步: 绘图**

``` bash
# 如何没有安装套件的话，请先安装fmsb套件，
# 代码为 install.packages('fmsb')

library(fmsb)

radarchart(dat.A2, axistype=0, seg=5,centerzero = TRUE)

# seg的取值表示将各轴分成几段，centerzero表示蜘蛛网图中心点为最小值点，axistype为0表示不绘制各坐标轴标签
```

<img src="http://i1.piimg.com/567571/e019176fc9992606.jpg" width=80% align=center>

>然后，在 Plots栏→Export→Metafile→Copy Plot→粘贴到PowerPoint中进行编辑后，另存为 .tiff或.jpg文件就OK了，写论文用起来也方便

---

补充，如果要在**一个蜘蛛网图中绘制多个指标类型**，如 A种鱼 和 B种鱼 的5种饵料贡献率，代码如下：

``` bash
dat.AB <- data.frame(

      part1=c(50,20),

    part2=c(20,40),

    part3=c(15,20),

    part4=c(10,12),

    part5=c(5,8))

dat.AB2<-rbind(maxmin,dat.AB)

radarchart(dat.AB2, axistype=0, seg=5,centerzero = TRUE)
```

<img src="http://i1.piimg.com/567571/d684e8e517ff163b.jpg" width=80% align=center>

``` bash
#以上，参考链接 http://www.inside-r.org/packages/cran/fmsb/docs/radarchart
```

---

链接原文材料如下:

``` bash
radarchart {fmsb}

Drawing radar chart (a.k.a. spider plot)
Package: fmsb
Version: 0.5.2
Description



Drawing the radar chart with several lines from a data frame, which must be composed of more than 3 variables as axes and the rows indicate cases as series.



Usage

radarchart(df, axistype, seg, pty, pcol, plty, plwd, pdensity, pangle, pfcol,  cglty, cglwd, cglcol, axislabcol, title, maxmin, na.itp, centerzero,  vlabels, vlcex, caxislabels, calcex, paxislabels, palcex, ...)



Arguments

df

The data frame to be used to draw radarchart. If maxmin is TRUE, this must include maximum values as row 1 and minimum values as row 2 for each variables, and actual data should be given as row 3 and lower rows. The number of columns (variables) must be more than 2.

axistype

The type of axes, specified by any of 0:5. 0 means no axis label. 1 means center axis label only. 2 means around-the-chart label only. 3 means both center and around-the-chart (peripheral) labels. 4 is *.** format of 1, 5 is *.** format of 3. Default is 0.

seg

The number of segments for each axis (default 4).

pty

A vector to specify point symbol: Default 16 (closed circle), if you don't plot data points, it should be 32. This is repeatedly used for data series.

pcol

A vector of color codes for plot data: Default 1:8, which are repeatedly used.

plty

A vector of line types for plot data: Default 1:6, which are repeatedly used.

plwd

A vector of line widths for plot data: Default 1, which is repeatedly used.

pdensity

A vector of filling density of polygons: Default NULL, which is repeatedly used.

pangle

A vector of the angles of lines used as filling polygons: Default 45, which is repeatedly used.

pfcol

A vector of color codes for filling polygons: Default NA, which is repeatedly usd.

cglty

Line type for radar grids: Default 3, which means dotted line.

cglwd

Line width for radar grids: Default 1, which means thinnest line.

cglcol

Line color for radar grids: Default "navy"

axislabcol

Color of axis label and numbers: Default "blue"

title

if any, title should be typed.

maxmin

Logical. If true, data frame includes possible maximum values as row 1 and possible minimum values as row 2. If false, the maximum and minimum values for each axis will be calculated as actual maximum and minimum of the data. Default TRUE.

na.itp

Logical. If true, items with NA values are interpolated from nearest neighbor items and connect them. If false, items with NA are treated as the origin (but not pointed, only connected with lines). Default FALSE.

centerzero

Logical. If true, this function draws charts with scaling originated from (0,0). If false, charts originated from (1/segments). Default FALSE.

vlabels

Character vector for the names for variables. If NULL, the names of the variables as colnames(df) are used. Default NULL.

vlcex

Font size magnification for vlabels. If NULL, the font size is fixed at text()'s default. Default NULL.

caxislabels

Character vector for center axis labels, overwriting values specified in axistype option. If NULL, the values specified by axistype option are used. Default is NULL.

calcex

Font size magnification for caxislabels. If NULL, the font size is fixed at text()'s default. Default NULL.

paxislabels

Character vector for around-the-chart (peripheral) labels, overwriting values specified in axistype option. If NULL, the values specified by axistype option are used. Default is NULL.

palcex

Font size magnification for paxislabels. If NULL, the font size is fixed at text()'s default. Default NULL

....

Miscellaneous arguments to be given for plot.default().

Values
No value is returned.

Examples


# Data must be given as the data frame, where the first cases show maximum.maxmin <-data.frame(

total=c(5,1),

phys=c(15,3),

psycho=c(3,0),

social=c(5,1),

env=c(5,1))

# data for radarchart function version 1 series, minimum value must be omitted from above.

RNGkind("Mersenne-Twister")

set.seed(123)

dat <-data.frame(

total=runif(3,1,5),

phys=rnorm(3,10,2),

psycho=c(0.5,NA,3),

social=runif(3,1,5),

env=c(5,2.5,4))

dat <-rbind(maxmin,dat)

op <-par(mar=c(1,2,2,1),mfrow=c(2,2))

radarchart(dat, axistype=1, seg=5, plty=1, vlabels=c("Total\nQOL","Physical\naspects","Phychological\naspects","Social\naspects","Environmental\naspects"),title="(axis=1, 5 segments, with specified vlabels)", vlcex=0.5)

radarchart(dat, axistype=2, pcol=topo.colors(3), plty=1, pdensity=c(5,10,30),  pangle=c(10,45,120), pfcol=topo.colors(3),title="(topo.colors, fill, axis=2)")

radarchart(dat, axistype=3, pty=32, plty=1, axislabcol="grey", na.itp=FALSE,title="(no points, axis=3, na.itp=FALSE)")

radarchart(dat, axistype=1, plwd=1:5, pcol=1, centerzero=TRUE,  seg=4, caxislabels=c("worst","","","","best"),title="(use lty and lwd but b/w, axis=1,\n centerzero=TRUE, with centerlabels)")

par(op)



Author(s)
Minato Nakazawa minato-nakazawa@umin.net http://minato.sip21c.org/

Documentation reproduced from package fmsb, version 0.5.2. License: GPL (>= 2)
```





---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn