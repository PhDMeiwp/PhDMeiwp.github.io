---
title: Run ANCOVA correctly in R software
date: 2017-03-09 09:50:38
categories: 
- 技术
- R 语言
tags: [R 语言, ANCOVA, type I, type III]
---

---

<center>(本文于 2016-5-8 09:53  首发于 [“科学网”](http://blog.sciencenet.cn/blog-651374-975758.html))</center>



Briefly, covariance analysis (ANCOVA) is expressed in the R language as y ~ x +/\* y0, where the variable is y, the covariate is y0, the independent variable is x. Then, go ahead code test.

<!-- more -->

``` bash

data.of.Wada2013.practice <- read.csv("~data of Wada2013 practice.csv")

View(data.of.Wada2013.practice)

eco <- data.of.Wada2013.practice 

eco

```

   site  d13C  d15N

1.     1 -28.40  4.05

2.     1 -26.90  6.70

3.     1 -25.90  7.30

4.     1 -25.85  7.85

5.     1 -25.60  9.90

6.     1 -26.35  10.30

7.     1 -26.25  10.70

8.     1 -26.55  12.20

9.     1 -26.60  12.65

10.      1 -26.50  13.25

11.      1 -26.40  13.70

12.      1 -24.90  14.10

13.      2 -24.00   9.02

14.      2 -23.50  11.80

15.      2 -22.71 15.78

16.      2 -22.10 15.10

17.      2 -20.50 14.00

18.      2 -19.75 17.30

19.      2 -20.35 17.95

20.      3 -23.80  3.95

21.      3 -23.50  4.80

22.      3 -23.80  5.20

23.      3 -23.70  6.10

24.      3 -22.80  6.95

25.      3 -21.95  7.10


## Step1: ANCOVA with InterAction.
	 
``` bash

	 attach(eco)

     sitef <- factor(eco$site)

     mod.IA<-aov(d15N~d13C*sitef,data=eco,  contrasts=list(sitef=contr.sum))

     # N.B., aov() function, "contr.sum" for factor "sitef"(not  numerical "site")

     summary(mod.IA)      # this summary is wroooong, it's for type I , not type III, don't do this!

     library(car)

     Anova(mod.IA,type=3)       # this is riiiiight. Anova() function, not anova.

     # Anova Table (Type III tests)
```

Response: d15N

Sum Sq       Df           F value      Pr(>F) 

(Intercept)  70.098        1            13.0456   0.001858 **

<font color=red>d13C</font>           43.563       1             8.1073    <font color=red>0.010302 *</font>

sitef            3.341         2           0.3109      0.736451  

<font color=red>d13C:sitef</font>   1.771        2             0.1648     <font color=red>0.849262</font>

Residuals   102.093      19                    


Signif. codes:  0 *** ,0.001 ** ,0.01 * ,0.05 . ,0.1 ,  1



<font color=blue> **covariate d13C** is <font color=red>**significantly**</font> differ with d15N ( p = 0.001858),

 and **interation of  d13C:sitef** is <font color=red>**not** significantly</font> differ ( p = 0.849262 ),</font>

---

>   <font color=red>Then, we can proceed ANCOVA next.</font>

---

## Step2: then ANCOVA　NonInterAction, for equal slope, type III.

``` bash

	 mod.NIA<-aov(d15N~d13C+sitef,data=eco,contrasts = list(sitef=contr.sum))

     Anova(mod.NIA, type=3)

``` 

Anova Table (Type III tests)

Response: d15N

Sum Sq     Df      F value      Pr(>F)  

(Intercept)   117.10       1        23.677     8.232e-05 ***

d13C              74.32       1         15.027     0.0008727 ***

<font color=red>sitef</font>               258.75     2         26.158     <font color=red>1.989e-06 ***</font>

Residuals      103.86     21                      

Signif. codes:  0 ***, 0.001 **, 0.01 *, 0.05 ., 0.1 ,  1

p value of 8.232e-05 *** means intercept is significantly not equal to 0.

   
``` bash

     summary.lm(mod.NIA)

``` 

Call:

aov(formula = d15N ~ d13C + sitef, data = eco, contrasts = list(sitef = contr.sum))

Residuals:

   Min        1Q          Median       3Q          Max

-3.6695    -1.5658      0.1179     1.1474    3.5577 

Coefficients:

Estimate        Std. Error     t value       Pr(>|t|)

(Intercept)   49.51511         0.1760       4.866       8.23e-05 ***

d13C            1.6545              0.4268        3.876      0.000873 ***

sitef1           4.3049             1.2335        3.490       0.002183 **

sitef2            1.0468             1.0774        0.972       0.342273

Signif. codes:  0 ***, 0.001 **, 0.01 *, 0.05 ., 0.1 ,  1

Residual standard error: 2.224 on 21 degrees of freedom

Multiple R-squared:  0.7556,    Adjusted R-squared:  0.7207

F-statistic: 21.65 on 3 and 21 DF,  p-value: 1.252e-06

<font color=darkred>Based on above, we could get the equation with equal slope and common intercept of 3 sites which suitable with Wada_2013 as: <font color=red>d15N = 1.6545[±0.4268]\*d13C + 49.51511[±0.1760 ] + [ecosystem specific sites constant] ( p = 0.000873).</font></font>



## Step3: then  ANCOVA NonInterAction with treatment contrasts, or type I.

     
``` bash
	 mod.NIA.tc <- aov(d15N~d13C+sitef, data=eco, contrasts = list(sitef = contr.treatment))

     summary.lm(mod.<font color=red>NIA</font>.tc)          #this step is riiiight,for graphics with type I is what we need.

``` 

Call:

aov(formula = d15N ~ d13C + sitef, data = eco, contrasts = list(sitef = contr.treatment))

Residuals:

  Min          1Q          Median      3Q           Max

-3.6695     -1.5658     0.1179      1.1474    3.5577 

Coefficients:

Estimate     Std. Error      t value       Pr(>|t|)    

(Intercept)         53.8200         11.2645       4.778      0.000101 ***

d13C                  1.6545           0.4268         3.876      0.000873 ***

sitef2                  -3.2581          2.1947        -1.485     0.152529    

sitef3                 -9.6567           1.7256        -5.596     1.49e-05 ***


Signif. codes:  0 ***, 0.001 **, 0.01 *, 0.05 ., 0.1 ,  1

Residual standard error: 2.224 on 21 degrees of freedom

Multiple R-squared:  0.7556,    Adjusted R-squared:  0.7207

F-statistic: 21.65 on 3 and 21 DF,  p-value: 1.252e-06

<font color=darkred>Based on above, we could get the equation for  3 sites respectively with equal slope and specific intercepts which suitable with Wada_2013 as:

site1: d15N = 1.6545\*d13C + 53.8200 ;

site2: d15N = 1.6545\*d13C + 53.8200 - 3.2581 ;

site1: d15N = 1.6545\*d13C + 53.8200 - 9.6567 . </font>


## Step4: Graphics.

``` bash

     dat1<-subset(eco,sitef == "1")                  

     dat2<-subset(eco,sitef == "2")

     dat3<-subset(eco,sitef=="3")

     reg1<-lm(d15N~d13C,data=dat1)

     reg2<-lm(d15N~d13C,data=dat2)

     reg3<-lm(d15N~d13C,data=dat3)

     plot(d15N~d13C,type="n")         # type="n" means plot with axes,without any plots.

     points(dat1$d13C,dat1$d15N,pch=1)

     points(dat2$d13C,dat2$d15N,pch=2)

     points(dat3$d13C,dat3$d15N,pch=3)

     abline(reg1,lty=1)

     abline(reg2,lty=2)

     abline(reg3,lty=3)

     legend("topleft",c("L.Baikal","L.Biwa","Mongolian grassland"),lty=c(1,2,3),pch=c(1,2,3))

``` 

<font color=darkred>Above procedures output a <font color=red>graph</font> with unequal slopes which we also need.</font>

<img src="http://image.sciencenet.cn/album/201605/08/093647kxpv96lwvm5xh6kz.jpg" width=90% align=center/>


``` bash

	 summod.NIA.tc <- summary.lm(mod.NIA.tc)        # type I

     coeffs.NIA.tc<-coef(summod.NIA.tc)

     coeffs.NIA.tc

``` 

Estimate           Std. Error         t value            Pr(>|t|)

(Intercept)      53.820034         11.2645326    4.777831       1.014464e-04

d13C              1.654461           0.4268016      3.876416        8.726695e-04

sitef2             -3.258098          2.1947260     -1.484512       1.525294e-01

sitef3             -9.656707          1.7255811      -5.596206      1.488283e-05


``` bash

	 I1 <- coeffs.NIA.tc[1,1]

     I2 <- coeffs.NIA.tc[3,1]+I1

     I3 <- coeffs.NIA.tc[4,1]+I1

     solpeAll <- coeffs.NIA.tc[2,1]

     plot(d15N~d13C,type="n")

     points(dat1$d13C,dat1$d15N,pch=1)

     points(dat2$d13C,dat2$d15N,pch=2)

     points(dat3$d13C,dat3$d15N,pch=3)

     abline(I1,slopeAll,lty=1)

     abline(I2,slopeAll,lty=2)

     abline(I3,slopeAll,lty=3)

``` 

<font color=darkred>Aboveall,we could clearly understand **why** we can **not** use summary.lm(mod.**NIA**) for graphics.</font>


``` bash
     
	 legend("topleft",c("L.Baikal","L.Biwa","Mongolian grassland"),lty=c(1,2,3),pch=c(1,2,3))
	 
``` 

<img src="http://image.sciencenet.cn/album/201605/08/0948374dyyxbtyy5jxb5t5.jpg" width=90% align=center/>

OMG, so long so tired. Anyway, we have correctly achieved what we need, that's enough ^_^



---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn