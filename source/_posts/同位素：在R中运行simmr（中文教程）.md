---
title: 同位素：在R中运行simmr（中文教程）
categories:
  - 科研
  - 同位素
tags:
  - 同位素
  - simmr
  - R
date: 2019-10-09 13:41:57
---

{% asset_img simmrPlot.JPG simmrPlot.JPG %} 

simmr中文教程完整版链接：https://t.zsxq.com/iAEYNNZ  

## Stable Isotope Mixing Models in R with simmr
Andrew Parnell and Richard Inger
2016-01-19
## 函数包simmr 关键的更新
（相比于SIAR 函数包）
- 没有GUI 界面，需要在console 或script 窗口编程
- 使用ggplot2 绘图
- 使用JAGS 来运行模型（MCMC 方法）

## 软件安装
- 安装JAGS：http://mcmc-jags.sourceforge.net/ 点击“Downloads”的“files page”
的链接进入 https://sourceforge.net/projects/mcmc-jags/files/ ，然后“Download
Latest Version”下载并安装之。
- 安装simmr
### 安装开发版
    library(devtools)
    install_github('andrewcparnell/simmr', build_vignettes = TRUE)
#### 安装CRAN 版
    install.packages('simmr')

---
<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>
---

由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！
<br>① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！
<br>② 转载与分享请注明：本文源于 http://meiweiping.cn
