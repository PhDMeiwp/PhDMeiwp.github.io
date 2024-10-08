---
title: R中y=a*exp(b*x)+c的selfStart函数
date: 2017-11-26 14:09:21
categories: 
- 技术
- R 语言
tags: [非线性回归, R 语言]
toc: true
---

---

R中y=a*exp(b*x)+c的selfStart函数

Weiping Mei < meiweipingg@gmail.com >



<!-- more -->


    # selfStart method for
    # y = a *exp(b*x)+ c

    expModel<-function(predictor,a,b,c){a*exp(b*predictor)+c}  #定义对应模型的函数。
  
  	expModelInit <- function(mCall,LHS, data)
  	{
    xy <- sortedXyData(mCall[["predictor"]],LHS, data)
    y=xy[,"y"]
    x=xy[,"x"]
    adjy=y-min(y)+1
    xadjy=data.frame(x,adjy)
    
    lmFit <- lm(log(adjy) ~ x)
    coefs <- coef(lmFit)
    get.b <- coefs[2]   #slope
  
    nlsFit<-nls(adjy~cbind(1+exp(b*x),exp(b*x)),
                start = list(b=get.b),data = xadjy,algorithm = "plinear",
                nls.control(maxiter = 5000000,minFactor = 10^(-10)))
    
    coef<-coef(nlsFit)
    b<-coef[1]
    c<-coef[2]+min(y)-1
    a<-coef[3]+coef[2]

    value <- c(a,b,c)
    names(value) <- mCall[c("a","b","c")]
    value
    }
  
    SSexp3P<-selfStart(expModel,expModelInit,c("a","b","c"))
  
    # getInitial(y~SSexp3P(x,a,b,c),data = z)
 

您能在R中通过github安装 “fitting”函数包，其中的"SSexp3P"的函数即可得到 "y=a\*exp(b\*x)+c"回归的各个参数的值（迭代结果）:


	x<-1:5
	y<-c(2,14,16,18,19)
	z<-data.frame(x,y)

	fitexp3Pss<-nls(y~SSexp3P(x,a,b,c),data=z)
	fitsum <- summary(fitexp3Pss)   # 输出各参数最终结果
	fitsum


---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn