---
title: BugBase软件及FAPROTAX软件推荐
categories:
  - 技术
  - 科研小工具
tags:
  - BugBase软件
  - FAPROTAX软件
  - 细菌功能预测
  - 细菌表型预测
date: 2019-09-12 15:28:31
---

{% asset_img FAPROTAX.jpg FAPROTAX.jpg %} 

> 根据16S预测微生物群落功能最全攻略：https://mp.weixin.qq.com/s/2PPH3trUQYOWwNrEOGu1WQ

> 如何用FAPROTAX预测微生物群落功能：https://mp.weixin.qq.com/s/eVjHdDhSq5JJZANHjiJhUA

> FAPROTAX官网链接：http://www.zoology.ubc.ca/louca/FAPROTAX/lib/php/index.php?section=Instructions

> FAPROTAX使用案例——NBT封面：水稻NRT1.1B基因调控根系微生物组参与氮利用： https://mp.weixin.qq.com/s/VBGHh-1PVSyvVn8fv85Vyg


## BugBase软件

**用于预测细菌七大表型。**

BugBase是Dan Knights课题组开发的用于对微生物组数据进行高水平表型（high-level phenotypes）分类的工具，目前相关文章正在整理之中，但该工具已开放，可免费使用（bugbase.cs.umn.edu/index.html）。
该工具可对微生物群落根据 **七类表型进行分类：革兰氏阳性（Gram Positive）、革兰氏阴性（Gram Negative）、生物膜形成（Biofilm Forming）、致病性（Pathogenic）、移动元件（Mobile Element Containing）、氧需求（Oxygen Utilizing，包括Aerobic、Anaerobic、facultatively anaerobic）及氧化胁迫耐受（Oxidative Stress Tolerant）**。
输入由Greengenes数据库分类后的OTU表格（BIOM格式），即可快速实现对上述表型的分类预测。
若同时输入Mapping文件还可以实现对分组变量的作图及统计比较分析。
目前有在线网页版（bugbase.cs.umn.edu/upload.html，数据<15M适用）和线下安装版（bugbase.cs.umn.edu/downloads.html，>15M适用）。

## FAPROTAX软件

**用于预测细菌约90种功能。**

FAPROTAX取词自Functional Annotation of Prokaryotic Taxa，**是Louca等人为解析微生物群落功能于2016年创建的基于原核微生物分类的功能注释数据库，文章发表在2016年的Science上（Louca et al. 2016）**。
FAPROTAX是基于目前对可培养菌的文献资料手动整理的原核功能注释数据库，其包含了收集自4600多个原核微生物的约90个功能分组（**如硝酸盐呼吸、产甲烷、发酵、植物病原等**）的7600多条功能注释信息。
作者编写了一套python脚本来运行预测，输入文件格式可以是SILVA或Greengenes数据库生成的OTU分类表或BIOM文件。
相关资料下载地址：http://www.zoology.ubc.ca/louca/FAPROTAX/lib/php/index.php?section=Home。



---
<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>
---

由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！
<br>① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！
<br>② 转载与分享请注明：本文源于 http://meiweiping.cn
