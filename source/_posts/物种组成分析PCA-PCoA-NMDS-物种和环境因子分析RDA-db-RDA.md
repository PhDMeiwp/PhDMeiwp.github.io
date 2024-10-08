---
title: '物种组成分析PCA,PCoA,NMDS,物种和环境因子分析RDA,db-RDA'
categories:
  - 技术
  - 数据处理
tags:
  - 主成分分析PCA
  - 主坐标分析PCoA
  - 冗余分析RDA
  - NMDS
date: 2019-09-11 09:09:48
---

做微生物多样性研究时经常听到PCA分析、PCoA分析，NMDS分析，CCA分析，RDA分析。它们对物种（或基因、功能）的分析具有重要作用，因而频频出现在16S测序及宏基因组测序中。
那么这些分析之前到底有什么区别吗？在什么情况下应该用什么分析呢？

以上分析本质上都属于排序分析（Ordination analysis）。排序(ordination)的过程就是在一个可视化的低维空间(通常是二维)重新排列这些样方,使得样方之间的距离最大程度地反映出平面散点图内样方之间的关系信息。一般主要利用PCA、PCoA或NMDS分析进行样本比较，反映样本间菌群结构的相似性和差异性，从而分析组间样本能否明显区分开；而RDA/CCA和db-RDA分析则多用来阐述环境因子对样本菌群结构变化的影响，不仅可以反映样本、物种和环境因子之间的相关性，而且可以找出对物种分布变化影响程度较大的环境因子。

常用的排序方法的比较如下：


{% asset_img TablePCAandRDA中文.JPG TablePCAandRDA中文.JPG %} 

{% asset_img TablePCAandRDA.JPG TablePCAandRDA.JPG %} 

----
## 1.物种组成分析：PCA，PCoA,NMDS

- PCA分析是基于原始的物种组成矩阵（Raw data-based）所做的排序分析
- PCoA分析则是基于由物种组成计算得到的距离矩阵（Distance-based）得出的

在PCoA分析中，计算“距离”矩阵的方法有很多种，如Euclidean, Bray-Curtis, and Jaccard，以及(un)weighted Unifrac (**利用各样品序列间的进化信息来计算样品间距离，其中weighted考虑物种的丰度，unweighted没有对物种丰度进行加权处理**)。

对数据进行分析时会惊奇的发现，PCoA和db-RDA分析选择不同的距离算法会产生不同或类似的结果，WHY？

我们以PCoA分析为例：

{% asset_img Distance-PCoA.JPG Distance-PCoA.JPG %} 

同一数据，euclidean，weighted_unifrac，binary_euclidean和unweighted_unifrac这4种距离进行分析结果不同，其中左图的 2种距离（euclidean，weighted_unifrac）区分效果不佳；反之，**右图 的 2种距离（binary_euclidean和unweighted_unifrac）可以将3组样本明显区分开来，且组内差异较小**。

究其原因，在于左图2种距离只考虑了样本中物种存在与否，而右图2种距离除此之外还考虑了“物种在各个样本中的丰度”分布。因此在只考虑样本中物种是否存在时能够将不同的样本组区分且组内差异较小。那么后续针对这种数据类型是选择只考虑物种有无的距离算法将获得更佳的聚类效果，反之亦然。

再看一个例子：

{% asset_img Distance-PCoA-2.JPG Distance-PCoA-2.JPG %} 

图上半部分的Euclidean, Bray-Curtis, and Jaccard。

图下半部分显示的(un)weighted Unifrac (利用各样品序列间的进化信息来计算样品间距离，其中**weighted考虑物种的丰度，unweighted没有对物种丰度进行加权处理**)。图下半部分（a）PCoA1维度将根内样品与根周边和土壤样品很好的分开；而PCoA2能够将不同土壤的样品很好的区分开来；(b)用pairwise-Bray-Curtis相似度对样品进行聚类。

## 2.物种和环境因子分析：RDA，db-RDA

（未完待续。。。）

## 3.PCA添加环境因子与RDA有何区别？
PCA分析也是可以添加环境因子的。那我做个带环境因子的PCA不就O啦，为啥还要进行RDA分析呢？

如下图所示：

{% asset_img PCAvsRDA.JPG PCAvsRDA.JPG %} 

使用同一数据分别进行PCA和RDA分析。**无论选择多少环境因子对PCA排序结果是“没有任何影响”；而RDA分析中选择不同的环境因子可“得到不同的排序结果”**。

出现这种情况的结果的原因是PCA分析作为非约束性排序，环境因子加入并不会影响样本间菌群差异获得的排序结果；而RDA分析是在所选择的环境因子的约束条件下进行的PCA分析，因此选择不同的环境因子组合会产生的不同的排序分析结果。

## 4.CCA和RDA比较

限制性排序常用的有CCA分析和RDA分析等。RDA基于线性模型，CCA则是基于单峰模型。

一般我们会选择CCA来做直接梯度分析。但是，如果CCA排序的效果不太好，就可以考虑换做用RDA分析。RDA或CCA选择原则：先用species-sample资料做DCA分析，看分析结果中
Lengths of gradient 的第一轴的大小，如果大于4.0，就应选CCA；如果在3.0-4.0之间，选RDA和CCA均可；如果小于3.0, RDA的结果要好于CCA。下图是CCA分析图，图中箭头代表不同的环境因子，射线越长表示该环境因子影响越大。环境因子之间的夹角为锐角时表示两个环境因子之间呈正相关关系，钝角时呈负相关关系。

{% asset_img CCA分析图.JPG CCA分析图.JPG %} 

## 5.数据告诉你该选择哪个分析方法

在R-vegan里面，可以用DCA分析来判别，R里面DCA为函数decorana():

		data(varespec)
		View(varespec)


{% asset_img varespec.JPG varespec.JPG %} 

varespec {vegan}	R Documentation
Vegetation and environment in lichen pastures
Description
The 'varespec' data frame has "24 rows and 44 columns". Columns are "estimated cover values" of "44 species". The variable names are formed from the scientific names, and are self explanatory for anybody familiar with the vegetation type.


		vare.dca <- decorana(varespec)
		vare.dca

{% asset_img decorana.JPG decorana.JPG %} 

这里的“Axis lengths ”和CANOCO里面DCA分析结果“Lengths of gradient”是一样的。如果DCA排序前4个轴中最大值超过4，选择单峰模型排序更合适。如果是小于3，则选择线性模型更好(Lepx & Smilauer 2003)。如果介于3-4之间，单峰模型和线性模型都可行。在本案例中，Axis lengths 最大值为2.8161，小于3，线性模型（PCA 和RDA）更好，单峰模型（CA和CCA）不好。

**在R里面，PCA和RDA都是同一个函数rda()来实现，如果括号内只用物种矩阵rda(X)，就表示PCA分析；如果同时有物种矩阵和环境矩阵即 rda(X,Y)，就表示是RDA分析**：

### 6.PCA 案例

		get.pca <- rda(varespec)  # # 将PCA的排序结果直接赋给命名为“get.pca”的对象
		get.pca

{% asset_img get.pca.JPG get.pca.JPG %} 

输出结果告诉我们**总的特征根（Inertia）为1826，这个值也是物种矩阵中各个物种的方差和 ，可以理解为物种分布的总变化量**。

PCA排序结果中**Eigenvalues for unconstrained axes 表示每个非约束排序轴所负荷的特征根的量，也可以表示每个轴所能解释方差变化的量**。例如，对于第一轴而言，983.0/1826=53.8% 便是第一轴对物种分布的解释量，其他轴的解释量以此类推。

也可以用    summary(get.pca)    直接获得更详细的排序结果分析。

排序的重要目的是排序图。标准的PCA排序图应该是用符号来表示物种（44 species）和样点（24 sites），可以直接用做图函数plot()生成排序图。但有些人更倾向于用箭头来表示物种，这时用函数bioplot()来生成。

		plot(get.pca)

{% asset_img plot.pca.png plot.pca.png %} 

		biplot(get.pca)

{% asset_img biplot.pca.png biplot.pca.png %} 

以上排序图可以看出除了**少数几个分布在外围物种（比如Pleuschr、Cladarbu、Cladrang、Cladstel）能分清之外**，很多物种重叠在一起，排序图效果不好。产生重叠的原因是物种分布差异大，某些分布不均匀的物种占据了大部分排序空间。此时可以对物种数据进行单位方差标准化（先中心化再标准化后均值为0，方差为1）。单位方差化可以通过参数scale来实现。重新做图，新的排序图比没有标准化之前效果好。

		get.pca2 <- rda(varespec, scale=T)  # scale=T表示对数据进行标准化再进行排序分析
		plot(get.pca2, scaling=3)

**如果排序图内关注物种之间的关系，可以选择scaling=1；如果是关注样方之间的关系，scaling=2； 如果是关注样方与物种之间的关系，可以选择scaling=3**。

{% asset_img plot.pca2.png plot.pca2.png %} 


		biplot(get.pca2, scaling=3)

{% asset_img biplot.pca2.png biplot.pca2.png %} 

### 7.RDA 案例

（未完待续。。。）
{% asset_img plot.rda.JPG plot.rda.JPG %} 


## 8.参考资料

PCA、PCoA、NMDS、RDA和CCA比较： http://interact.i-sanger.com/article/view/talk_id/45.html
PCA、PCoA、NMDS、CCA、RDA傻傻分不清楚 http://www.dxy.cn/bbs/topic/32534684
排序分析PCA、PCoA、CA、NMDS、RDA、CCA等区别与联系 https://www.omicsclass.com/article/148
decorana function （From vegan v2.4-2 by Jari Oksanen） https://www.rdocumentation.org/packages/vegan/versions/2.4-2/topics/decorana
赖江山, 米湘成. 基于Vegan 软件包的生态学数据排序分析. 中国生物多样性保护与研究进展Ⅸ— 第九届全国生物多样性保护与持续利用研讨会论文集

---
<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>
---

由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！
<br>① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！
<br>② 转载与分享请注明：本文源于 http://meiweiping.cn
