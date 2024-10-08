---
title: '拟合模型比较之AIC, AICc, BIC'
categories:
  - 技术
  - R 语言
tags:
  - 模型拟合
  - 赤池指数
  - AIC
  - BIC
date: 2022-02-20 16:49:40
---

## 〇、准则

The smaller the AIC, AICc or BIC, the better the model.
AIC值越小，拟合模型越好。
AICc，BIC同样适用。

------

## 一、简介

AIC信息准则即Akaike information criterion，又称赤池信息量。
AICc是针对小样本数据集的AIC，即小样本校正后的AIC。
BIC为贝叶斯信息量。

------

## 二、计算公式

AIC，AICc，BIC的计算方法/公式如下图。

{% asset_img AIC计算公式.png  AIC计算公式.png  %} 

- stats函数包中的AIC函数，提供AIC和BIC的计算方法。

------

{% asset_img AICc计算公式.png  AICc计算公式.png  %} 

- AICcmodavg函数包中的AICc函数，提供AIC，AICc等的计算公式，见上图。

------

## 三、分析
对于同一个数据集，即x数据相同，y数据相同，dataframe(x,y)数据集相同。
那么，根据上述AIC，AICc的计算公式，

**相同点：**
AIC和AICc计算公式的左半部分都是相等的，即 -2\*logLik(fitmodel)，

**不同之处在于:**
AIC计算公式右半部分是 2\*npar，
而AICc计算公式的右半部分是 2\*npar\*(n/(n-npar-1))

注意:
n为数据的样本数，比如x，y分别包含20个数字，则n=20;
npar为参数的数量，y也是1个参数，所以对于y=ax+b，则npar=3，即y,a,b；对于y=alog(bx+c)，则npar=4。

------

## 四、发现

**发现一：**
AICc数值一直比AIC要大，样本数越小，则AICc比AIC越大得多；样本数越大，则AICc越接近于AIC的值。

**发现二：**
数据样本数n，必须大于拟合方程的参数npar+1，否则AICc值为InF，AIC值不受此影响。
比如，拟合方程y=aln(bx+c)，则npar+1=5，要求数据样本数>5，至少为6个样本，
否则AICc计算公式的右边分母为0，则AICc结果为InF。

**发现三：**
从计算公式可以看出，对于同一个数据集，
当npar相等的情况下，不同模型之间AICc的差值=不同模型之间AIC的差值，所以比较AIC也是可以的，不一定要非得比较AICc。举例如下：
y=ax+b,y=aexp(bx),y=alog(bx),y=aln(bx)，这四个模型AIC的差值，和AICc的差值是一样的。

特此备忘，作为学习AICc计算公式的纪录。

------

## 五、相关R函数包

basicTrendline函数包的[最新版Github链接](https://github.com/PhDMeiwp/basicTrendline) ，和[官网版CRAN链接](https://cran.r-project.org/web/packages/basicTrendline/index.html) 。

**因为最近我写的R函数包"basicTrendline"的version 2.0.6版本，特别增加了AICc的结果.**

先下载最新版本的R包，代码如下：
   install.packages("devtools")
   devtools::install_github("PhDMeiwp/basicTrendline@master", force = TRUE)

直接输入如下代码即可输出AIC, AICc, BIC的结果
   library(basicTrendline)
   trendline_summary(x,y,model="exp2P")

{% asset_img summary.png  summary.png  %} 

----
<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>
----

<p style="color:darkred"> 由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！转载与分享请注明：本文源于 http://meiweiping.cn </p>
