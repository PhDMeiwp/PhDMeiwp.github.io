---
title: sair方法及R操作入门——稳定同位素之食物来源比例分析
date: 2017-03-14 20:16:34
categories: 
- 科研
- 同位素
tags: [同位素, sair, R, 饵料贡献比]
---

---

<center>(本文于2016-10-5 20:29 首发于 [“科学网”](http://blog.sciencenet.cn/blog-651374-1006886.html))</center>



在稳定同位素领域，20世纪70 80 年代开始，利用碳氮稳定同位素来研究食物网结构成为有力的技术手段，以弥补传统的胃含物方法中较难分析的空胃率较高的生物的缺陷。

<br>

在食物网研究中，主要包括食物来源和营养级的分析。其中，食物来源分析中严格来讲，1种同位素只能对应2种食物来源的分析，n种同位素相对应n+1种食物来源的分析。

<!-- more -->

<br>
**问题是，**例如有5种食物来源，只用碳、氮2种同位素进行食物来源分析就很困难，20世纪后半叶，普遍采用的方法是**Isosource软件**进行计算。但是这种方法：①只使用**饵料生物同位素**的平均值，**未考虑标准差的影响**；②只使用固定**浓缩系数（TEF）值**（e.g., 碳氮同位素分别使用1‰ 和3.4‰），也**未考虑其标准差**的影响等（Parnell AC, Inger R, Bearhop S, et al.,2010）。

<br>

{% asset_img 1.jpg img1 %}

<br>
本文简要介绍**基于贝叶斯算法的最新方法: siar（stable isotope analysis in R）在R软件上的操作过程**。


# step1：推荐按照下图内容格式（包括标题栏）编辑数据，然后导入 #

{% asset_img 2.jpg img2 %}

</center>

<br>

<center>**补充R语言基础知识：**<br>

上述图片中的 蓝色字体内容均为R代码，并非csv文件里面的内容。<font color=red>上述图片包括3个独立的.csv文件，分别为sources.csv，corrections.csv和consumers.csv文件</font>。而**不是**都输入在一个.csv文件里。

①上述图片最左一列（1~3,1~19）为excel或csv软件的侧栏编号，请勿写入excel或csv文件的第一列。即，<font color=red>本例中：csv文件的第一列标题为Source或Group</font>。

<br>
②R语言软件自身缺点所致，在**csv文件数据等所有内容**最好<font color=red>不要用宋体等中文字体，建议同意采用新罗马字体，否则容易识别出错或乱码</font>。

<br>
③ 写好的csv文件在保存时，请<font color=red>务必选择 CSV（MS-DOS）或苹果电脑选择 CSV（Macintosh）后缀保存</font>，而**不要选择其他的CSV后缀保存**。</center>


``` bash
     library(siar)
     graphics.off()
     sources<-read.csv("~/sources.csv",header=TRUE)
     consumers<-read.csv("~/consumers.csv",header=TRUE)
     corrections<-read.csv("~/corrections.csv",header=TRUE)
     concs<-0
```
	 



# step2: 作图如下#

{% asset_img 3.jpg img3 %}

</center></font>

``` bash
model1<-siarmcmcdirichletv4(consumers,sources,corrections,concs)
siarplotdata(model1,iso=c(2,1),leg = 1)     
# error bar is twice SD!!!leg=1 是指图标和分布图在同一个图层上，leg=2则表示在两个图层，leg=0 表示不画图标。
```


>R中直接输出图之后，将图片copy to clipboard asMetafile 到 ppt中，然后选择该图片并点击ppt工具栏中的“取消组合”，可以对图例等内容进行自由编辑。

<table><tr><td bgcolor=yellow><font color=red>**补充内容之 如何计算各饵料贡献率的标准偏差（Sd值）等参数？**</font></td></tr></table>

<font color=red> 上述模型“model1”建立之后，其实所有贡献率结果已经出来了，我们需要先看一下结果里面到底暗藏了什么玄机，在R软件中输入代码如下</font>

``` bash
head(model1$output)
```

<font color=red>得到结果如下图(此处图略)</font>



<font color=red>此时，我们就已经知道model1$output各列代表什么内容了，**接下来代码十分重要，务必仔细观察理解并应用**！！！</font>

``` bash
summary(model1$output[,1])  
sd(model1$output[,1])  
#上述两步即可得到我们想要的 src1对应consumer1的贡献率的各个参数（mean，sd等）数据了，同样地，

summary(model1$output[,2])  
sd(model1$output[,2])   #  src 2 对应 consumer 1

summary(model1$output[,3])  
sd(model1$output[,3])  # src 3 对应 consumer 1

#----

summary(model1$output[,6])  
sd(model1$output[,6])  
#以上为 src1 对应 consumer2 的贡献率的各个参数（mean，sd等）数据
#注意① 请参照 head（model1$ooutput中的表头内容，相应地更改上述代码中括号内[,#]的数字）
#注意② 和①相同，src 种类不同，上述中括号内的数字会发生变化，请注意！

summary(model1$output[,7])  
sd(model1$output[,7])  # src 2 对应 consumer 2

summary(model1$output[,8])  
sd(model1$output[,8])  # src 3 对应 consumer 2

#---
summary(model1$output[,11])  
sd(model1$output[,11])  # src 1 对应 consumer 3

summary(model1$output[,12])  
sd(model1$output[,12])  # src 2 对应 consumer 3

summary(model1$output[,13])  
sd(model1$output[,13])  # src 3 对应 consumer 3

# etc...




```

<font color=red> model1$output 数据集中的 “SD1G1，SD2G1” 等其他参数 表达的意思是什么，请大家自主解决这个问题，我就不一一答复了！</font>


 	 
----


# step3：作饵料来源所占捕食者食物中的比例的分布图 #

{% asset_img 4.jpg img4 %}

``` bash
siarhistograms(model1)     
# 然后在R中输入 1:4, Selection:2，即为上图，其中4表示group4,2表示将所有饵料生物占比在同一张图中表示；同理，<br>
siarhistograms(model1)     
# 然后在R中输入 1:1, Selection:2，即为group1的食物来源占比分布图；以此类推。
```
	 
----


# step4：分布图形式2，以捕食者的group为变量 #

{% asset_img 5.jpg img5 %}

``` bash
siarproportionbygroupplot(model1,grp=4)     
# 代码中的grp=4表示group4；以此类推。
```

<font color=darkgreen>上述代码运行后，会让你填一些数字后按回车，第一步说明 <font color=red>1:1</font> for Group1,第二步说明<font color=red>Selection:2</font> for all source proportion together on one graph.</font>




<table><tr><td bgcolor=darkred><font color=white><center> 新增内容 2017/03/26 updated<br><br> 自定义箱线图之利用SIAR计算不同饵料来源对消费者的贡献比例 </center></font></td></tr></table>

上述 Step4 我们已经绘制了所有饵料对消费者（以group4为例）的贡献率箱线图，SIAR的默认设置中

siarproportionbygroupplot()函数只绘制<font color=red>贡献率的50%，75%和95%这三个范围， 

想要自定义不同的的范围</font>，只需要将上述Step4中的代码

``` bash
siarproportionbygroupplot(model1,grp=4)     
# 代码中的grp=4表示group4；以此类推。
```

<font color=red>**更改为如下代码：**</font>

``` bash
siarproportionbygroupplot(model1,grp=4,probs = c(95,75,50,25,5))     
# 代码中的grp=4表示group4；以此类推。
```

<font color=red>**即可。**</font>


<font color=red>附上SIAR工具包原作者AndrewL Jackson对siarproportionbygroupplot()函数的源代码请仔细参考</font> https://github.com/AndrewLJackson/siar/blob/master/R/siarproportionbygroupplot.R



---

# step5：分布图形式3，以饵料生物src的种类为变量 #


{% asset_img 6.jpg img6 %}

代码为：


> siarproportionbysourceplot(model,grp=2)   

然后在R中按回车键几个显示上图。代码中的grp=2表示饵料生物src2，以此类推。



---


#step6：导出数据化的结果，见下图左半部分#

{% asset_img 7.jpg img7 %}


代码如下：

``` bash
siarhdrs(model1)    
#src1G1表示第1种饵料生物对group1的捕食者食物来源的贡献比例结果，包括占比的平均值和95%置信区间等。以此类推。
```


   **以上。**

---

---

# siar Q & A #

#Q[1]# 
梅老师，您好：
看了你关于SIAR求饵料贡献率的代码，有几个问题想问一下，能不能麻烦您帮我解决一下呢？

1.您所给的数据能具体解释一下是怎么来的吗？是几种饵料呢？（我是初学者，对数据的编辑整理还不是很明白，麻烦您知道一下呢）**如果饵料只测了一次而没有标准差该怎么办呢？那个corrections代表什么意思呢？**

2.如果我们要测贡献率，那那个直方图该怎么解释呢？
万分感谢~

A: 您好

1\. 饵料最好5种，本文例子中为3种：src 1，src2，src3<br>
2\. 饵料对应捕食者数目，某一种捕食者比如一种鲫鱼，它也应该有很多个平行样本才有意义，实际情况中这个平行可以是多个采样点<br>
3\. corrections表示src对应consumer的同位素的浓缩系数<br>
4\. 饵料贡献率直接使用#step6中的数据即可。#step2下面的图中，src的数据是已经加上浓缩系数校正后的值，consumer为原始值。<br>

#Q[2]#

梅老师，您好：
感谢您百忙之中抽空解答我的问题，您说corrections表示src对应consumer的同位素的浓缩系数，我看到您所给的值是一样的，15N是3.54,13C是1.63，能否请问一下您**这个浓缩系数值是怎么取值的吗？对应的浓缩系数里面的Sd标准差又是如何得到的呢？**

A：<br>
1\. 本文只是举例而已，并非实际数值。<br>
2\. 不同捕食者对应相同饵料实际情况下浓缩系数肯定不完全相同。<br>
3\. 同种捕食者同种饵料，在环境条件不同的情况下浓缩系数也不完全相同，抑或同种捕食者在不同生长时期的实验室饲养情况下浓缩系数也会有差异，就会有sd值了。<br>
4\. 以上为已有各个实验参数的理想条件下的sair分析，但是，比如未知特定捕食者对应的饵料的浓缩系数的情况下，用其它已知的相近的捕食者的浓缩系数代替，或者用其它综述论文的浓缩系数平均值代替也一定程度上认为是无可厚非的。<br>

#Q[3]#

梅老师，您好，又要麻烦您啦，我想问一下那个<font color=red>消费者在统计数据时是否需要加上分馏值呢？还是直接用所测数据呢？</font>

A：<br>
捕食者和饵料的同位素值都是直接使用原始值，不需要加上分馏值，因为分馏值是直接在corrections参数中设置。

#Q[4]#<br>
另外，想<font color=red>请问一下cons<-o表示什么含义呢？</font>

A:<br>
concs表示饵料碳氮元素含量（不是同位素值哦！） ，可以使用饵料碳氮元素含量（或百分比）得到加权校正的 SIAR 模型。

当某个饵料的某元素（如氮元素）含量（百分比）显著.....低于或高于其他饵料时，e.g., 两饵料N含量为 12%，而第3个饵料N含量为 1%，推荐使用浓度加权；

当各饵料的碳氮元素含量没有显著变化时则不需要使用浓度加权，即conc<- 0.

一般情况conc默认设置为0。具体情况具体分析。

更多内容请参考 Donald L. Phillips · Paul L. Koch. Incorporating concentration dependence in stable isotope mixing models. Oecologia (2002) 130:114–125.

#Q[5]#zhao0415:

尊敬的梅老师：
       您好！按照您的说明准备了数据，格式如        
      |sources    |    Mean15N    |   sd15N     |   Mean13C     |   sd13C<br>
1     |   src1    |   6.488984    |   1.4594632 |   -11.17023   |     1.2149562<br>
2     |   src2    |   4.43216     |   2.2680709 |   -30.87984   |    0.6413182<br>
3     |   src3    |   11.192613   |   1.1124385 |   -11.1709    |     1.9593306<br>

**采用命令：sources<-read.csv("C:/siar/re2.csv",header=TRUE)却报错：**

Error in make.names(col.names, unique = TRUE) : 多字节字符串1有错
此外: Warning message:
In read.table(file = file, header = header, sep = sep, quote = quote,  :
  incomplete final line found by readTableHeader on 'C:/siar/re2.csv'
**请问是什么原因呢？**谢谢您！

A：
您好，Sd等字母大小写改成和例子完全一样之后再试试看吧

A:  数据等csv所有内容输入格式请用新罗马字体，不要用中文宋体等；另外，文件保存格式为.CSV[MS-DOS]或.CSV[Macintosh],不要保存成其他csv后缀格式。


#Q[6]# 您好。想咨询您在做稳定同位素食性分析时，在R中运行siar包时候，
<font color=red>如果consumer数据分组只有一组时，siarplotdata出来的图横坐标的值并不是N15的同位素值，而是group。</font>
只要分组大于一，图像就会再次正常。想问老师有没有遇到这样的情况，这是不是安装包的bug？怎么解决这样的问题。

A：您好。当consumers数据的Group只有一组时（即只有一种消费者），在运行sair之前，<font color=green>直接将 consumers.csv文件里的"Group"这一列删除掉</font>，即可在siarplotdata时导出正常的图了（e.g., x轴为d13CPI，y轴为d15NPI，见下图）！

![consumer只有一种消费者时siarplotdata.png](https://i.loli.net/2017/10/22/59ec158c77a7b.png)



---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn