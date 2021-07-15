---
title: SIBER (SIAR package) in R：物种生态位重复度计算
date: 2017-03-15 11:44:01
categories: 
- 科研
- 同位素
tags: [SIBER, R, SIAR, 重复度, 同位素]
---

---

<center>(本文于 2016-5-27 00:10 首发于 [“科学网”](http://blog.sciencenet.cn/blog-651374-979988.html))</center>

<font color=red>**2018/02/01 updated**</font>

<font color=red>**2017/10/05 updated**</font>

<font color=red>**2017/3/24 updated**</font>

<font color=red>温馨提示：请确保您的 R软件（及R相关软件）安装的系统盘（e.g., C盘），这点十分重要！ </font>


**SIBER: Stable Isotope Bayesian Ellipses in R**

“SIBER” (SIAR package)这个SIAR套件的SIBER分析，主要是用来比较一个生态系统内不同种群之间的同位素生态位竞争的具体百分比值，等等。

<!-- more -->

Fits bivariate ellipses to stable isotope data using Bayesian inference with the aim being to describe and compare their isotopic niche.

各原始数据在csv中的输入格式参考下图（相关说明参考[这里](http://phdmeiwp.github.io/sair%E6%96%B9%E6%B3%95%E5%8F%8AR%E6%93%8D%E4%BD%9C%E5%85%A5%E9%97%A8%E2%80%94%E2%80%94%E7%A8%B3%E5%AE%9A%E5%90%8C%E4%BD%8D%E7%B4%A0%E4%B9%8B%E9%A3%9F%E7%89%A9%E6%9D%A5%E6%BA%90%E6%AF%94%E4%BE%8B%E5%88%86%E6%9E%90/)）：

{% asset_img mydata-SIBERinSIAR.csv.JPG mydata-SIBERinSIAR.csv.JPG %}




	rm(list=ls())
	setwd("E:/")
	graphics.off()
	# 我的数据集包含 3 列: group,x,y.
	# x, y 表示 d13C 和 d15N 的值.
	mydata<-read.csv("C:/~/Desktop/mydata-SIBERinSIAR.csv",header=TRUE)



调入 siar工具包，设置各参数，并绘制椭圆


	library(siar) 
	attach(mydata)
	# now loop through the data and calculate the ellipses.
	ngroups<-length(unique(group))

	#split the isotope data based on group.
	spx<-split(x,group)
	spy<-split(y,group)

	#create some empty vectors for recording our metrics.
	SEA<-numeric(ngroups)
	SEAc<-numeric(ngroups)
	TA<-numeric(ngroups)

	# plot the raw data.
	# dev.new() #maybe no need show the plot in a new window.
	plot(x,y,col=group,type="p")
	legend("topright",legend=as.character(paste("Group",unique(group))),pch=19,col=1:length(unique(group)))


-------

Now loop over each group and plot the **small sample size corrected ellipse** and the **convex hull** for each.

	for(j in unique(group)){

	#fit a standard ellipse to the data.
	SE<-standard.ellipse(spx[[j]],spy[[j]],steps=1)

	#extract the estimated SEA and SEAc from this object.
	SEA[j]<-SE$SEA
	SEAc[j]<-SE$SEAc

	#plot the stand ellipse with d.f.=2(i.e.SEAc).
	#these are plotted here as thick solid lines.
	lines(SE$xSEAc,SE$ySEAc,col=j,lty=1,lwd=3)   ###

	#also,for comparison we can fit and plot the convex hull.
	#the convex hull is plotted as dotted thin lines.
	# calculate the convex hull for the jth group's isotope values.
	# held in the objects created using split()called spx and spy.
	CH<-convexhull(spx[[j]],spy[[j]])

	#extract the area of the convex hull from this object.
	TA[j]<-CH$TA


	#plot the convex hull
	lines(CH$xcoords,CH$ycoords,lwd=1,lty=3)     ###
	}

------

**输出各面积数据（包括SEA，SEAc，TA）**
print the area metrics to screen for comparison.


	#NB if you are working with real data rather than simulated then you wont be able to calculate the population SEA(pop.SEA).

	#if you do this enough times or for enough groups you will easily see the bias in SEA as an estimate of pop.SEA as compared to SEAc which is unbiased.

	#both measures are equally variable.


	print(cbind(SEA,SEAc,TA))

------

So for we have fitted the standard ellipses based on frequentist methods and calculated the relevant metrics(SEA and SEAc).

Now we turn our attention to producing a Bayesian estimate of the standard ellipse and its area SEA.B.

	reps<-10^4  #循环计算次数.

	# Generate the Bayesian estimates for the SEA for each group using the utility function siber.ellipses.

	SEA.B<-siber.ellipses(x,y,group,R=reps)  
	summary(SEA.B)    #N.B. SEA.B数据集包含  10^4 行的内容.

----

plot out some of the data and results.

``` bash
#plot the credible intervals for the estimated ellipse areas now,stored in the matrix SEA.B

#dev.new()

siardensityplot(SEA.B,xlab="Group",ylab="Area(permil^2)",main="Different estimates of Standard Ellipse Area(SEA)")

#and now overlay the other matrics on the same plot for comparison.

points(1:ngroups,SEAc,pch=15,col="red")

legend("topright",c("SEAc"),pch=c(15,17),col=c("red","blue"))
```

----

**比较各椭圆（生态位）面积的显著性差异**
Compare two ellipses for significant differences in SEA.

To test whether Group 1 SEA is smaller than Group 2...

You need to calculate the Proportion of G1 ellipses that are less than G2.

``` bash
Pg1.lt.g2<-sum(SEA.B[,1]<SEA.B[,2])/nrow(SEA.B)

#in this case,all the posterior ellipses for G1 are less than G2 so we can conclude that G1 is smaller than G2 with p approx=0,and certainly p<0.0001.

#and for G1<G3

Pg1.lt.g3<-sum(SEA.B[,1]<SEA.B[,3])/nrow(SEA.B)

# etc...
```

-----

计算椭圆（生态位）之间的重复面积和重复百分比
To calculate the overlap between two ellipses you can use the following code

``` bash 
# NB: the degree of overlap is sensitive to the size of ellipse you choose to draw around each group of data. However, regardless of the choice of ellipse, the extent of overlap will range from 0 to 1, with values closer to 1 representing more overlap. So, at worst it is a semi-quantitative

# measure regardless of extent of the ellipse, but the finer detials and magnitudes of the effect size will be sensitive to this choice.

# Additional coding will be required if you wish to calculate the overlap between ellipses other than those described by SEA or SEAc.

# Fit a standard ellipse to the data, NB, I use a small step size to make sure i get more "round" ellipses, as this method is computatonal and based on the discretisation of the ellipse boundaries.

# The overlap between the SEAc for groups 1 and 3 is given by:

overlap.G1.G3<-overlap(spx[[1]],spy[[1]],spx[[3]],spy[[3]],steps=1)

overlap.G1.G3    #一定注意：这个overlap值只是重复面积的值，不是百分比。

# One can calculate the overlap between two (or more) ellipses. In the first instance, this overlap is simply the area, #in units of per mil squared, contained by the shape that lies within the overlapping region.
# This overlapis most easily calculated by using the SEAc of each ellipse.
```

One might then wish to calculate the proportion overlap; athough one then runs into a choice as to what the demoninator will be in the equation. You could for instance calculate

the proportion of A that overlaps with B,

the proporiton of B that overlaps with A,

or the proportion of A and B that overlap with each other.

<font color=red>**以下内容才是椭圆（生态位）重复百分比**</font>


``` bash 
overlap.G2.G3$overlap/overlap.G2.G3$area1

overlap.G2.G3$overlap/overlap.G2.G3$area2

overlap.G2.G3$overlap/ (overlap.G2.G3$area1+overlap.G2.G3$area2)
```

-----

计算各凸包面积（convex hulls area）的重复度方法
You can also cacluate the **overlap between two of the convex hulls**, or indeed any polygon using the code that underlies the overlap() function.

``` bash
# fit a hull to the Group 1 data

hullG1 <- convexhull(spx[[1]],spy[[1]])

# create a list object of the unique xy coordinates of the hull, the first and last entries are coincident for plotting, so ignore the first...

# hence the code to subset [2:length(hullG1$xcoords)]

h1 <- list( x = hullG1$xcoords[2:length(hullG1$xcoords)] , y = hullG1$ycoords[2:length(hullG1$xcoords)] )    ###


# Do the same for the Group 3 data

hullG3 <- convexhull(spx[[3]],spy[[3]])

h3 <- list( x = hullG3$xcoords[2:length(hullG3$xcoords)] , y = hullG3$ycoords[2:length(hullG3$xcoords)] )
```

And calculate the overlap using the function in spatstat package.

``` bash 
hull.overlap.G1.G3 <- overlap.xypolygon(h1,h3)
```


---

---

<center>**Q & A**</center>

For this case from siar package, data only need 3 columns as iso1,iso2,group.

参考： https://gist.github.com/PhDMeiwp/c0877f47401dc7640754b8a81d2b978f

更多资料请查阅： https://github.com/AndrewLJackson/SIAR-examples-and-queries/blob/master/learning-resources/siber-comparing-populations.Rmd  


---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn