---
title: '[转载]物种Alpha多样性指数简介及R语言实现'
categories:
  - 科研
  - 基础概念
tags:
  - Alpha多样性
  - Chao 1指数
  - Simpson指数
  - Shannon指数
  - R语言
date: 2019-09-12 13:44:16
---

## 写在前面

多样性指数是指物种多样性测定，主要有三个空间尺度：α多样性，β多样性，γ多样性。每个空间尺度的环境不同测定的数据也不相同。

- α多样性，主要关注局域均匀生境下的物种数目，因此也被称为生境内的多样性（within-habitat diversity）。


- β多样性，指沿环境梯度不同生境群落之间物种组成的的相异性或物种沿环境梯度的更替速率也被称为生境间的多样性（between-habitat diversity），控制β多样性的主要生态因子有土壤、地貌及干扰等。
不同群落或某环境梯度上不同点之间的共有种越少，β多样性越大。精确地测定β多样性具有重要的意义。
这是因为：①它可以指示生境被物种隔离的程度；
②β多样性的测定值可以用来比较不同地段的生境多样性；
③β多样性与α多样性一起构成了总体多样性或一定地段的生物异质性。


- γ多样性，描述区域或大陆尺度的多样性，是指区域或大陆尺度的物种数量，也被称为区域多样性（regional diversity）。控制γ多样性的生态过程主要为水热动态，气候和物种形成及演化的历史。


-----

本文来自刘尧科学网博客。
链接地址：http://blog.sciencenet.cn/blog-3406804-1179809.html 

本文简介群落多样性分析中的几种常用Alpha多样性指数概念。

# 一、最常用Alpha多样性指数

## 1. 物种丰富度（Richness）
物种丰富度指数（Species richness）为群落中丰度大于0的物种数之和，值越大表明群落中物种种类越丰富。下式中，**S，物种丰富度指数；n，个体数（丰度）大于0的物种类型总数**。

{% asset_img Richness.png Richness.png %} 

物种丰富度指数在计算中对所有存在的物种（无论优势物种或稀有物种）等权重看待，**只关注物种存在与否，与它们的相对丰度无关**。此外，丰富度指数**对抽样深度所造成的差异也是非常敏感的**。例如，在群落中观测500个个体和1000个个体时，基于1000个个体所观测到的物种类型数量通常会更多，这种差异主要体现在低丰度物种水平。

 

备注：在微生物16S/18S/ITS等测序分析中，常见observed species指数，即为物种丰富度指数。

 

## 2. 香农指数（Shannon）
香农指数（Shannon index）或称香农熵指数（Shannon entropy index）、**香农-威纳指数（Shannon-Wiener index）**，同时 **考虑了物种丰富度以及均匀度**（Shannon，1948a，b）。它由信息论（information theory）延伸而来，反映了我们能够预测在群落中随机选择的个体属于哪些物种的不确定性。如果群落仅由单一物种组成（种群），那么我们确信随机选择的个体必定为那个唯一的物种，此时不确定性就为零；否则，我们将无法得知随机被选择的个体究竟属于什么物种，并且不确定性也会随着群落物种种类数的增多而增加。但是，如果群落中存在一种或少数几种物种占据了优势地位（与其它物种相比，它们在丰度上具有明显的优势），那么不确定性就不会那么高，因为我们随机选择的个体很有可能就是这些优势物种。

Shannon指数（H）的计算公式如下。式中，**S，群落物种丰富度指数，即物种类型总数；pi，物种i的相对丰度；x，通常使用2、e等作为底数**。

{% asset_img shannon1.png shannon1.png %} 

当群落完全均匀，即 **群落中所有物种丰度完全一致时（即上式pi = 1/S），Shannon指数的值达到最大（Hmax）**。

{% asset_img shannon2.png shannon2.png %} 
 

备注：对于上式，H的绝对值与用于计算的对数底数x有关，不同软件默认的底数可能有所不同。例如，16S/18S/ITS 微生物群落研究常用工具qiime程序，计算Shannon指数（命令脚本alpha_diversity.py）的默认底数x = 2；**R的vegan包，计算Shannon指数（命令vegdist()）的默认底数x = e**。当然，这些软件或程序包中一般都提供了底数参数选项，是可以自定义修改的。

 

## 3. 辛普森指数（Simpson）
辛普森指数（Simpson index）同样 **考虑了物种丰富度以及均匀度**，但 **与Shannon指数相比，它更受均匀度的影响（Simpson，1949)**。经典Simpson指数代表了在群落中两个随机选择的个体属于同一物种的概率，当群落物种丰富度增加时，这种概率降低，即Simpson指数随着物种丰富度的增加而降低。由于经典Simpson指数与物种丰富度相反的趋势不直观，如今常用演变而来的 **Gini-Simpson指数表示Simpson指数，即用1减去经典Simpson指数数值后得到，此时Simpson指数随着丰富度的增加而增加（二者保持一致的趋势）**。

**经典Simpson指数（D）和Gini-Simpson指数（GS）**的公式如下。式中，**S，群落物种丰富度指数，即物种类型总数；pi，物种i的相对丰度**。

{% asset_img Simpson1.png Simpson1.png %} 

Simpson指数的取值范围0~1，单位是一个概率。**当群落物种丰富度较高时，Simpson指数的值主要受均匀度的影响**。

当群落完全均匀，即 **群落中所有物种丰度完全一致时（即上式pi = 1/S），Simpson指数可以直接由物种丰富度直接得到**。

{% asset_img Simpson2.png Simpson2.png %} 

{% asset_img Simpson3.png Simpson3.png %} 


特别注意：**通常情况下为保持物种丰度指数与Simpson指数的趋势一致，直接将“Gini-Simpson”定义为“Simpson”**，即绝大多数情况下，我们在 **文献中看到的Simpson指数或者软件直接给出的Simpson指数结果，其实是Gini-Simpson指数，而并非经典Simpson指数**。


## 4. Chao 1指数（Chao 1）
Chao1指数在生态学中作为 **度量"物种丰富度"的指标**，由Chao（1984）最早提出（为什么是“Chao1”而不直接使用“Chao”，因为他还提出过Chao2等概念），其值越高代表群落物种越丰富。

Chao1指数基于这样一种假设：当在群落中随机抽取个体时，若不断有新的物种被发现，则表明群落中尚存一些稀有物种还未被观测到；直到已经抽取到的所有物种均保证至少被抽到两次时，即未再出现新的物种被发现时，则可以认为该群落中的所有物种已经全部被观测到。据此可用于估算群落物种总数，且 **对稀有物种很敏感**。

Chao1指数经典公式如下。**S，群落物种丰富度指数；F1，仅包含1个个体的物种数；F2，仅包含2个个体的物种数**。


{% asset_img chao1.png chao1.png %} 

当群落中所有物种个体数均为1的情况出现时（此时F2为0，分母无意义），可用下述修正偏差的公式代替经典公式。

{% asset_img chao2.png chao2.png %} 
  

## 5. 均匀度（Evenness）
均匀度（Evenness）用于度量群落中相对物种丰富度。群落均匀度有多种表述方式，所代表的含义也略有区别，以Shannon均匀度和Simpson均匀度最为常见。

 

Shannon均匀度（Shannon’s evenness），又称Pielou均匀度（Pielou’s evenness），为群落实际的Shannon指数与具有相同物种丰富度的群落中能够获得的最大Shannon指数的比值。如果所有物种具有相同的相对丰度，则该值为1。

Shannon均匀度（J）的计算公式如下。其中，H，Shannon指数；Hmax，在物种丰富度相同的情况下，能够达到的最大Shannon指数（即当群落中所有物种丰度完全一致时）；S，群落物种丰富度指数；x，通常使用2、e等作为底数。

{% asset_img evenness1.png evenness1.png %} 
 

Simpson均匀度（Simpson’s evenness），又称equitability，表示为Simpson有效物种数（即Simpson多样性，可参见下文“有效物种数”）与物种丰富度指数的比值。


{% asset_img evenness2.png evenness2.png %} 

公式中Dens，Simpson有效物种数；S，群落物种丰富度指数。对于Dens，其与Simpson指数的转换关系如下（可参见下文“有效物种数”）。


{% asset_img evenness3.png evenness3.png %} 

其中，D，经典Simpson指数；GS，Gini-Simpson指数。因此，Simpson均匀度也可以表示为下述公式。


{% asset_img evenness4.png evenness4.png %} 


在完全均匀的群落中，即群落中所有物种的丰度完全一致时，Shannon和Gini-Simpson指数（即通常我们所认为的Simpson指数）与群落中的物种数量呈非线性增长，Gini-Simpson指数增长幅度更快。这种关系同样指出Gini-Simpson指数在低物种丰富度时的变化非常明显（见上文Simpson公式，对于完全均匀的群落，S = 2，GS = 0.5；S = 3，GS = 0.67；S = 4，GS = 0.75；... S = 10，GS = 0.9），当物种丰富度增加时，Gini-Simpson指数的趋势将变缓（同样对于完全均匀的群落，例如，S = 20，GS = 0.95；S = 100，GS = 0.99；增幅比渐趋降低）。


{% asset_img evenness5.png evenness5.png %} 

下图展示了群落物种丰富度、Shannon指数和Simpson指数对群落（非）均匀性和多样性的相互关系。


{% asset_img evenness6.png evenness6.png %} 

下图中的A、B、C分别代表3个群落，3个群落各自包含12种物种（即物种丰富度为12），其中群落A完全均匀，群落B中度不均匀，群落C高度不均匀。各群落中的各物种个体数量分布、Shannon指数以及Simpson指数统计如下所示。

{% asset_img evenness7.png evenness7.png %} 

 
----

# 二、其他Alpha多样性指数

## 6. 有效物种数（ENS）

Jost认为，**直接使用Shannon指数或Simpson指数代表多样性是错误的**，因为多样性应该以直观的物种单位来衡量，物种多样性应表示为群落中物种的有效数量。详见[Jost博士的阐述](http://loujost.com/Statistics%20and%20Physics/Diversity%20and%20Similarity/EffectiveNumberOfSpecies.htm)。通过引入Mac Arthur（1965）提出的有效物种数（effective number of species，ENS）概念以解决这个问题，所谓 **有效物种数，即指与给定数据集中物种丰度平均占比相等的均匀群落中的物种数量**。通过 **将Shannon指数和Simpson指数分别转化为Shannon有效物种数以及Simpson有效物种数以代表多样性**，即 **Shannon多样性（Shannon diversity）和Simpson多样性（Simpson's diversity）**。

有效物种数和3种多样性指数的关系如下（可参见）。式中ENS、Hens、Dens分别代表有效物种数、Shannon有效物种数（Shannon多样性）、Simpson有效物种数（Simpson多样性）；S，群落物种丰富度指数；H，Shannon指数，x常用2、e等；D，经典Simpson指数；GS，Gini-Simpson指数。

{% asset_img ENS1.png ENS1.png %} 

仅当群落完全均匀时，ENS = Hens= Dens；随着群落均匀度的降低，ENS > Hens > Dens。


更多类型“指数”和“多样性”的转化关系，可参见Jost（2006）的文章。

 

物种丰富度、Shannon有效物种数（Shannon多样性）和Simpson有效物种数（Simpson多样性）对（非）均匀性和多样性的相互关系如下所示。

{% asset_img ENS2.png ENS2.png %} 

 

## 7. 希尔数（Hill numbers）

Hill（1973）认识到 **物种丰富度、Shannon指数以及Simpson指数都是同一系列多样性指数成员**，并据此提出希尔数（Hill numbers）**量化多样性**。

下公式中的 **系数q即为希尔数**，其量化了计算多样性时对稀有物种的折扣程度：**对于q > 0，指数计算时对稀有物种打折扣；q = 0，所有物种等权重对待；对于q < 0，指数计算时对丰富物种打折扣，并关注稀有物种的数量（此时通常没有意义）**。

{% asset_img hill1.png hill1.png %} 


当q为特定数值时，可通过该公式获得Shannon多样性、Simpson多样性等。

q = 0时（常表示为N0）表示物种多样性指数。下式S，群落物种丰富度指数。

{% asset_img hill2.png hill2.png %} 

q = 1时（常表示为N1）表示Shannon多样性，即Shannon熵的有效物种数，其与Shannon指数的关系如下。H，Shannon指数；x常用2、e等。


{% asset_img hill3.png hill3.png %} 

q = 2时（常表示为N2）表示Simpson多样性，即Simpson指数的有效物种数，其与Simpson指数的关系如下。D，经典Simpson指数；GS，Gini-Simpson指数。


{% asset_img hill4.png hill4.png %} 

 
关于上述公式更详细的解释，可参见Jost（2006）的文章。


有效物种数和系数q的函数图，反映了q增加时稀有物种在群落多样性度量中的重要性的降低程度。同上所述，q = 0展示物种丰富度（正方形），q = 1展示Shannon多样性（圆形），q = 2展示Simpson多样性（三角形）。图中三种曲线分别代表了均匀度不同的3种群落，可知随着群落均匀度下降（不均匀度上升），有效物种数随着系数q的增加而下降的越趋剧烈。

{% asset_img hill5.png hill5.png %} 
 


## 8. ACE指数（ACE）
ACE指数在生态学中同样作为度量 **物种丰富度的指标**（Chao and Yang，1993）,其值越高代表群落物种越丰富。

在对某群落的研究中，我们获得了群落物种的观测数量，**其中某些物种所被观测到的个体数量仅为1、2等很低的数值，通常表明这些物种在群落所有物种数量中的所占比例很低。但是如此低丰度的物种很容易由测量误差产生，从而出现较大的波动**。**为了排除这种测量误差所产生的干扰，我们指定一个稳定的阈值用于区分稀有物种和丰富物种，例如以10个个体为划分界限，将观测个体数小于或等于10的物种定义为稀有物种，大于10的即为丰富物种**。与只观测到1、2等个体数量的物种相比，稀有物种的测量显得相对稳定。在群落物种测量中，根据丰富/稀有物种（根据指定阈值为界限）以及仅包含1个个体的物种，**计算ACE指数用于估算群落中尚未被观测到的物种数量。其值越大，代表该群落中真实物种种类越多**。

ACE指数公式如下。式中，Sabund，丰富（丰度阈值大于n）物种数；Srare，稀有（丰度阈值小于或等于n）物种数；F1，仅包含1个个体的物种数；γ2ace，稀有物种变异系数的估算值。

{% asset_img ace1.png ace1.png %} 

常用n = 10，作为划分丰富/稀有物种的丰度阈值，并且此时γ2ace、Nrare和Cace可分别由下面的公式计算得到。第二个公式中的Fi为包含i个个体的物种数。

{% asset_img ace2.png ace2.png %} 

{% asset_img ace3.png ace3.png %} 

## 9. goods_coverage
goods_coverage指数公式如下。**F1，群落中仅包含1个个体的物种数；N，群落物种总数**。


{% asset_img coverage1.png coverage1.png %} 

goods_coverage指数的 **取值范围0~1，单位是一个概率**。

goods_coverage常用在微生物16S/18S/ITS测序中，作为反映测序深度的指标。**其值越接近于1，说明测序深度越合理，测序深度已经基本覆盖到样品中所有的物种；反之，测序深度不高，许多物种仅被测到了一次，暗示着很多低丰度物种可能尚未被测序测到**。

 

## 10. 谱系多样性（Phylogenetic diversity）
谱系多样性（Phylogenetic diversity，PD）定义为在系统发育树上跨越给定的一组分类群所经过的所有系统发育分支的最小总长度（Faith，1992）。以下使用原作者文章中的一张图对谱系多样性作简要说明，对于更多详细内容，可参考原文章。

{% asset_img phylogenetic.png phylogenetic.png %} 


图示一个假定的系统发育树（Faith，1992），该进化树中共计10个分类群。连接其中4个分类群（这4个分类群分别命名为2、6、8、10，已标注在其分枝顶端）的路径由粗线表示，路径所经过的刻度线的数量为28，即4个分类群集合的PD为28。

 

**而在实际计算群落谱系多样性时，除了进化距离外，物种丰度数据也是必不可少的。并且可以预期，较大的PD值对应于更大的群落物种多样性**。

与上述几种类型的多样性指数相比，**谱系多样性则比较特殊。它同时考虑物种丰度以及进化距离，而上述几种类型的多样性指数是不关注进化距离的**。


谱系多样性常用在微观群落的研究中。如基于16S/18S/ITS测序的微生物群落分析，在这些分析中进化树基于代表物种的16S/18S/ITS构建。

 

## 11. 参考资料
Chao A. Nonparametric estimation of the number of classes in a population. Scandinavian Journal of Statistics, 1984, 11.

Chao A, Yang M C K. Stopping rules and estimation for recapture debugging with unequal failure rates. Biometrika, 1993, 80:193-201.

David Zeleny博士：Explained variation and Monte Carlo permutation test (constrained ordination)

Faith D P. Conservation evaluation and phylogenetic diversity. Biological Conservation, 1992, 61(1):1-10.

Hill M O. Diversity and evenness: a unifying notation and its consequences. Ecology, 1973, 54: 427-432.


**Jost L. Entropy and diversity. Oikos, 2006.**

**Lou Jost博士：http://loujost.com/Statistics%20and%20Physics/Diversity%20and%20Similarity/EffectiveNumberOfSpecies.htm**

Mac Arthur R H. Patterns of species diversity. Biol. Rev., 1965, 40:510-533.

scikit-bio文档：http://scikit-bio.org/docs/latest/generated/skbio.diversity.alpha.html

Shannon C E. A mathematical theory of communication. The Bell System Technical Journal, 1948a, 27:379-423.

Shannon C E. A mathematical theory of communication. The Bell System Technical Journal, 1948b, 27:623-656.

**Simpson E H. Measurement of Diversity. Nature, 1949, 163:688.**

## 后记（案例）

例如，甲群落中A、B两个种的个体数分别为99和1，而乙群落中A、B两个种的个体数均为50，按辛普森多样性指数（Simpson Index）计算，

甲群落的辛普森指数：D甲=1-（0.9801+0.001）=0.0198

乙群落的辛普森指数：D乙=1-（0.25+0.25）=0.5

**乙群落的多样性高于甲群落**。造成这两个群落多样性差异的 **主要原因是种的不均匀性，从丰富度来看，两个群落是一样的，但均匀度不同**。

（案例来源：https://baike.baidu.com/item/%E5%A4%9A%E6%A0%B7%E6%80%A7%E6%8C%87%E6%95%B0/5584139?fr=aladdin ）


以上！


---
<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>
---

由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！
<br>① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！
<br>② 转载与分享请注明：本文源于 http://meiweiping.cn
