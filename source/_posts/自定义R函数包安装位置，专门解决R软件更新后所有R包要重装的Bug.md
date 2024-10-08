---
title: 自定义R函数包安装位置，专门解决R软件更新后所有R包要重装的Bug
categories:
  - 技术
  - R 语言
tags:
  - R包
  - Rprofile
  - 安装
date: 2021-12-05 18:48:56
---

## 第一步：查看R包默认的安装位置

接下来打开Rstudio软件，在console中输入：

		.libPaths() 
		#比如 D:/Program Files/R/R-4.1.1/library

## 第二步：新建 .Rprofile文件

		file.edit("~/.Rprofile")  
		#注意始终用 半角字符 输入；Rprofile前有个点.号
		#这个文件默认存放在 C:/Users/你的Windows用户名/Documents
		
## 第三步：编辑 .Rprofile文件（更改R包安装位置）

然后在Rstudio窗口自动新生成的 .Rprofile文件中输入：

		.libPaths(c("新路径", "旧路径"))
		# 注意要用 c()进行定义
		#比如自定义"新路径"为 "D:/RuserPackages"，"旧路径"为默认安装位置D:/Program Files/R/R-4.1.1/library
		#新路径用来安装用户新下载的R包，旧路径用于保存R软件自带的R包
		
		即
		.libPaths(c("D:/RuserPackages", "D:/Program Files/R/R-4.1.1/library"))

{% asset_img Rprofile.PNG Rprofile.PNG %} 


## 第四步：关键，建立相应RuserPackages文件夹

**要在新路径的位置 → 新建相应名称的文件夹！否则新路径无效。**
即，在电脑D盘新建 名为 RuserPackages 的文件夹！

## 第五步：重启Rstudio，生效

重启Rstudio后，试试安装新R包，就会自动安装到新路径D:/RuserPackages文件夹。

## 第六步：升级R软件至新版本后的操作

升级R软件至新版本后，需要重新完成第1~5步，
其中第4步文件夹已经存在，新路径名字不变，则可直接使用D:/RuserPackages文件夹里以前安装过的R包，不需要再重新安装了。


## 参考文献

 [永久更改R包的安装目录 #R语言](https://blog.csdn.net/sinat_21011081/article/details/115435298?spm=1001.2101.3001.6661.1&utm_medium=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-1.no_search_link&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-1.no_search_link)
 [R语言修改下载安装包install.package的默认存储位置](https://blog.csdn.net/sinat_35187039/article/details/80239668?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-0.fixedcolumn&spm=1001.2101.3001.4242.1)

## 附录1

		getwd()
		setwd()

以上两个函数是设置当前的工作位置（与R包安装路径无关！），
比如你要处理的数据都在 E:/data文件夹，那么你就可以设置Rstudio的当前工作位置：
 
		setwd("E:/data") #方便调用数据，和查找新生成的文件或图片

## 附录2

R函数包安装的**临时文件保存路径**一般默认如下，无需修改，会自动删除。

The downloaded binary packages are in
	C:\Users\admin\AppData\Local\Temp\Rtmpq804fH\downloaded_packages

R函数包的**永久安装路径**为你设定的新路径 和 系统默认的旧路径，比如

输入代码 .libPaths() 
结果为 "D:/RuserPackages"  和  "D:/Program Files/R/R-4.1.1/library"	
		
----
<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>
----

<p style="color:darkred"> 由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！转载与分享请注明：本文源于 http://meiweiping.cn </p>
