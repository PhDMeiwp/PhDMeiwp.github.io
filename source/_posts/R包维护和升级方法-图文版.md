---
title: R包维护和升级方法-图文版
categories:
  - 技术
  - R 语言
tags:
  - R包
  - R包升级
  - basicTrendline
date: 2020-11-25 09:13:49
---

# R包维护和升级方法（以basicTrendline包为例）
2020-11-24

R: Version 4.0.3
RStudio: Version 1.3.1093
 
{% asset_img basicTrendline.png %} 

## 第一步：Clone原始R包
** 从GitHub克隆当前版本R包（version2.0.3）**

- 进入并确定GitHub链接网址 https://github.com/PhDMeiwp/basicTrendline 
- 登录Github个人账号（为了后续Git Bash操作），
- 在电脑本地新建文件夹并命名（比如“Update2020”），打开该文件夹，
- 鼠标右键，“Git Bash Here”
 
{% asset_img gitbash.png %} 
 
- 输入如下代码，克隆R包，完成后如下图
		git clone https://github.com/PhDMeiwp/basicTrendline.git
 
{% asset_img gitclone.png %} 
 
- 然后在“Update2020”文件夹里会自动生成一个“basicTrendline”文件夹，打开该文件夹，查看里面内容，如下图：
 
{% asset_img update2020.png %}  

-----

## 第二步：删除不必要文件
- 删除上图“basicTrendline”文件夹中“docs”文件夹和“README.md”文件，因为向CRAN官网提交R包不需要这两个文件，只有GitHub里用到了二者。

-----

## 第三步：修改/新增R包中的相应文件
- 用RStudio软件打开“basicTrendline.Rproj”，修改“R”文件夹、“DESCRIPTION”、及“NEWS”中的内容。
  
{% asset_img Rproj.png %} 

- 在RStudio的“Files”中打开DESCRIPTION文件并修改/新增内容，见下图：
- （本次直接将basicTrendline函数包从version2.0.3更新至version2.0.5版本）
  
{% asset_img description.png %} 

- 在RStudio的“Files”中打开NEWS文件并修改/新增内容（有些R包没有这个文件，请自行忽略）
  
{% asset_img news.png %} 

- 在RStudio的“Files”中打开“R”文件夹中“\*\*\*.R”文件并修改/新增内容。
   
{% asset_img files.png %} 
 
- 本次主要更新是由于RStudio内置stats函数包中nls函数更新了内容，要求所有使用nls函数中非线性回归SelfStart参数的R包都需要更新（其实只要在使用SelfStart的function代码最后必须添加个省略号“...”即可！）
 
- 将SSexp2P.R，SSexp3P.R，SSpower2P.R，SSpower3P.R文件中SelfStart的function中均添加“...”即可。然后对trendline.R进行微调，完成。
 
{% asset_img SSexp2P.png %} 

-----

## 第四步：生成新R包并Check
- 载入“devtools”函数包进行后续操作，代码依次如下：
		library(devtools)   #没有这个R包的话请先自行install
		# load_all()    #加载所有.R文件
		document()    #依据**.R文件中的注释自动生成对应的**.Rd文件（在man文件夹）
		build()    #生成basicTrendline_2.0.5.tar.gz文件到电脑本地
 
 
{% asset_img build.png %}  
 
- 生成的.tar.gz压缩包文件在“Update2020”文件夹中，
  
{% asset_img tar.gz.png %} 

- 点击“RStudio”之“Build”之“Check”，检查R包是否有报错，确保检查结果“0 errors | 0 warnings | 0 notes” 方可顺利上传并通过CRAN官网的检查。
  
{% asset_img check.jpg %} 

-----

## 第五步：submit更新后的_2.0.5.tar.gz文件到CRAN官网
- 登录https://cran.r-project.org/submit.html 网站，按要求一步一步提交.tar.gz文件。
- 注意，最后一步必须进行emial里的链接网址确认后，才算提交完成。
  
{% asset_img submit.png %} 

-----

## 第六步：上传更新后的R包到GitHub
- 在“Update2020”之“basicTrendline”文件夹中重新添加“docs”文件夹和README.md文件。
- 修改/新增“docs”文件夹里的“images”和“README.md”文件里的介绍内容。

- （再次确认已登录个人Github账号），在“basicTrendline”文件夹中鼠标右键“Git Bash Here”，输入以下代码: 
- 途中会弹出对话框要求输入Github的用户名和密码，之后即可完成上传R包到Github。
		git init
		git remote add origin git@github.com:PhDMeiwp/basicTrendline.git
		git add .
		git commit –m “version 2.0.5”
		git push origin master –f

- 上传完成后，在Github网站再确认一下是否上传成功，如下图。
 
{% asset_img github.png %} 

-----

以上。

--------

## 附注
- “basicTrendline”函数包是用来添加拟合曲线（含置信区间）的R包，目前version2.0.5版本内置拟合曲线包含7种（line2P, line3P, log2P, exp2P, exp3P, power2P, power3P）。
- “basicTrendline”函数包使用方法请直接移步至  https://github.com/PhDMeiwp/basicTrendline 即可查看完整Examples。

- 如果您愿意的话，欢迎在您的学术论文中引用“basicTrendline”包，引用格式如下：
Mei W, Yu G, Lai J, Rao Q, Umezawa Y (2018) basicTrendline: Add Trendline and Confidence Interval of Basic Regression Models to Plot. R package version 2.0.5. http://CRAN.R-project.org/package=basicTrendline
 
{% asset_img citation.png %} 

**祝君：论文多多，基金多多；工作顺利，生活美满。**


---
<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>
---

<p style="color:darkred"> 由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！转载与分享请注明：本文源于 http://meiweiping.cn </p>
