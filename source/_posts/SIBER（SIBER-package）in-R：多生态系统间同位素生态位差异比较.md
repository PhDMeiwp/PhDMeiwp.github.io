---
title: SIBER（SIBER package）in R：多生态系统间同位素生态位差异比较 
date: 2017-03-15 13:32:08
categories: 
- 科研
- 同位素
tags: [SIBER, R, 多生态系统, 同位素]
---

---

<center>(本文于 2016-5-30 22:50 首发于 [“科学网”](http://blog.sciencenet.cn/blog-651374-981332.html))</center>

<font color=red>**2018/02/01 updated**</font>


**SIBER (in SIBER package)是用来比较“两个生态系统之间”的同位素差异（overlap percentage）。**

<!-- more -->

各原始数据在csv中的输入格式参考下图（相关说明参考[这里](http://phdmeiwp.github.io/sair%E6%96%B9%E6%B3%95%E5%8F%8AR%E6%93%8D%E4%BD%9C%E5%85%A5%E9%97%A8%E2%80%94%E2%80%94%E7%A8%B3%E5%AE%9A%E5%90%8C%E4%BD%8D%E7%B4%A0%E4%B9%8B%E9%A3%9F%E7%89%A9%E6%9D%A5%E6%BA%90%E6%AF%94%E4%BE%8B%E5%88%86%E6%9E%90/)）：

{% asset_img mydata-SIBERinSIBER.csv.JPG mydata-SIBERinSIBER.csv.JPG %}


---

**step1. 调入数据. Setting up our R session for this demonstration**

``` bash
rm(list=ls())
graphics.off()
library(SIBER)
mydata <- read.csv("C:/~/Desktop/mydata-SIBERinSIBER.csv",, header=T)
siber.example <- createSiberObject(mydata)
#Plotting the raw data
```

---

**step2.初绘散点分布图. Plotting the raw data**

Create lists of plotting arguments to be passed onwards to each of the three plotting functions.

``` bash
community.hulls.args <- list(col = 1, lty = 1, lwd = 1)

group.ellipses.args  <- list(n = 100, p.interval = 0.95, lty = 1, lwd = 2)

group.hull.args      <- list(lty = 2, col = "grey20")

par(mfrow=c(1,1))

plotSiberObject(siber.example,

ax.pad = 2,

hulls = F, community.hulls.args,

ellipses = T, group.ellipses.args,

group.hulls = T, group.hull.args,

bty = "L",

iso.order = c(1,2),

xlab = expression({delta}^13*C~'\u2030'),

ylab = expression({delta}^15*N~'\u2030')

)
```

---

**step3.统计与绘图. Summary statistics and custom graphic additions**

``` bash
par(mfrow=c(1,1))
community.hulls.args <- list(col = 1, lty = 1, lwd = 1)
group.ellipses.args  <- list(n = 100, p.interval = 0.95, lty = 1, lwd = 2)
group.hull.args      <- list(lty = 2, col = "grey20")

# this time we will make the points a bit smaller by
# cex = 0.5

plotSiberObject(siber.example,
ax.pad = 2,
hulls = F, community.hulls.args,
ellipses = F, group.ellipses.args,
group.hulls = F, group.hull.args,
bty = "L",
iso.order = c(1,2),
xlab=expression({delta}^13*C~'\u2030'),
ylab=expression({delta}^15*N~'\u2030'),
cex = 0.5
)
```

<font color=red>Calculate sumamry statistics for each group: TA, SEA and SEAc</font>

``` bash
group.ML <- groupMetricsML(siber.example)
print(group.ML)
```

You can add more ellipses by directly calling plot.group.ellipses()

Add an additional p.interval % prediction ellilpse.

``` bash
plotGroupEllipses(siber.example, n = 100, p.interval = 0.95,
lty = 1, lwd = 2)
```

Or you can add the XX% confidence interval around the bivariate means by specifying ci.mean = T along with whatever p.interval you want.

``` bash
plotGroupEllipses(siber.example, n = 100, p.interval = 0.95, ci.mean = T, lty = 1, lwd = 2)
```

A second plot provides information more suitable to comparing the two communities based on the community-level Layman metrics. 

This time we will make the points a bit smaller by cex = 0.5

``` bash
plotSiberObject(siber.example,
ax.pad = 2,
hulls = T, community.hulls.args,
ellipses = F, group.ellipses.args,
group.hulls = F, group.hull.args,
bty = "L",
iso.order = c(1,2),
xlab=expression({delta}^13*C~'\u2030'),
ylab=expression({delta}^15*N~'\u2030'),
cex = 0.5
)
```

Or you can add the XX% confidence interval around the bivariate means by specifying ci.mean = T along with whatever p.interval you want.

``` bash
plotGroupEllipses(siber.example, n = 100, p.interval = 0.95, ci.mean = T, lty = 1, lwd = 2)
```

<font color=red>Calculate the various Layman metrics on each of the communities.</font>

``` bash
community.ML <- communityMetricsML(siber.example)
print(community.ML)
```

---

**step4.贝叶斯模型拟合. Fitting the Bayesian models to the data**

``` bash
# options for running jags

parms <- list()
parms$n.iter <- 2 * 10^4   # number of iterations to run the model for
parms$n.burnin <- 1 * 10^3 # discard the first set of values
parms$n.thin <- 10     # thin the posterior by this many
parms$n.chains <- 2        # run this many chains

# define the priors

priors <- list()
priors$R <- 1 * diag(2)
priors$k <- 2
priors$tau.mu <- 1.0E-3

# fit the ellipses which uses an Inverse Wishart prior
# on the covariance matrix Sigma, and a vague normal prior on the
# means. Fitting is via the JAGS method.

ellipses.posterior <- siberMVN(siber.example, parms, priors)
```

---

**step5.Groups 间的标准椭圆面积的比较.Comparing among groups using the Standard Ellipse Area**

``` bash
# The posterior estimates of the ellipses for each group can be used to
# calculate the SEA.B for each group.

SEA.B <- siberEllipses(ellipses.posterior)
siberDensityPlot(SEA.B, xticklabels = colnames(group.ML),
xlab = c("Community | Group"),
ylab = expression("Standard Ellipse Area " ('\u2030' ^2) ),
bty = "L",
las = 1,
main = "SIBER ellipses on each group"
)

# Add red x's for the ML estimated SEA-c
points(1:ncol(SEA.B), group.ML[3,], col="red", pch = "x", lwd = 2)

# Calculate some credible intervals

cr.p <- c(0.95, 0.99) # vector of quantiles

# call to hdrcde:hdr using lapply()

SEA.B.credibles <- lapply(
as.data.frame(SEA.B),
function(x,...){tmp<-hdrcde::hdr(x)$hdr},
prob = cr.p)

# do similar to get the modes, taking care to pick up multimodal posterior distributions if present

SEA.B.modes <- lapply(
as.data.frame(SEA.B),
function(x,...){tmp<-hdrcde::hdr(x)$mode},
prob = cr.p, all.modes=T)
```

---

**step6.基于Layman矩阵的全生态系统之间的比较.Comparison of entire communities using the Layman metrics**

``` bash
# extract the posterior means

mu.post <- extractPosteriorMeans(siber.example, ellipses.posterior)

# calculate the corresponding distribution of layman metrics

layman.B <- bayesianLayman(mu.post)

# Visualise the first community

siberDensityPlot(layman.B[[1]], xticklabels = colnames(layman.B[[1]]),
bty="L", ylim = c(0,20))

# add the ML estimates (if you want). Extract the correct means
# from the appropriate array held within the overall array of means.

comm1.layman.ml <- laymanMetrics(siber.example$ML.mu[[1]][1,1,],
siber.example$ML.mu[[1]][1,2,]
)

points(1:6, comm1.layman.ml$metrics, col = "red", pch = "x", lwd = 2)

# Visualise the second community


siberDensityPlot(layman.B[[2]], xticklabels = colnames(layman.B[[2]]),
bty="L", ylim = c(0,20))


# Alternatively, pull out TA from both and aggregate them into a
# single matrix using cbind() and plot them together on one graph.
```

---

---

<center>**Q & A**</center>

1\. 在 SIBER package 中运行 SIBER 程序时, 数据集必须包括 4 列内容： iso1,iso2,group,community.

2\. https://cran.r-project.org/web/packages/SIBER/vignettes/Introduction-to-SIBER.html



---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn