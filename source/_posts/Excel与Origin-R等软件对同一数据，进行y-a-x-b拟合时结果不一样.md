---
title: 'Excel与Origin,R等软件对同一数据，进行y=a*x^b拟合时结果不一样'
date: 2017-03-08 16:05:42
categories: 
- 技术
- 数据处理
tags: [Excel, Origin, R, matlab, 结果不一致]
---

---

<center>(本文于 2016-5-8 12:40 首发于 [“科学网”](http://blog.sciencenet.cn/blog-651374-975795.html))</center>



在网上有看到 y = a*x^b 等非线性拟合结果不同的相关讨论，然后用自己的数据进行了验证，得到如下结果：

<!-- more -->

<img src="http://image.sciencenet.cn/album/201605/08/12091720wrxpnex4z6r58p.png" width=70% align=center/>

**在 Excel 和 LibreOffice 上计算的结果相同**，见**上图 1**。

---

**在 Origin 和 R** 上计算结果相同，但**和 Excel 和 LibreOffice 结果不同**，**见下图 2**。

<img src="http://image.sciencenet.cn/album/201605/08/120917ho4oh1kbh4hx15uw.png" width=70% align=center/>


由上述相同数据非线性拟合 y = a*x^b 运行结果可知：即使 Excel 和 LibreOffice  拟合回归的 R^2 值大于 Origin和 R 的结果，

但是从<font color=red>拟合曲线来分析，明显下图 2 更准确，</font>

因为上图 1 中对于 SL 大于 16 的数据拟合偏离很大，不能反映原始数据部分重要信息。



不过，很高兴地告诉大家，对于数据 SL值范围跨越数量级不是很大的另外5组数据，均显示** Origin 和 R 计算的结果 R^2 值 大于 Excel 和 LibreOffice 的值。**



另外，补充一点，对于<font color=red>一般线性回归，如 y=a*x+b 的情况，各种软件计算结果都相同！</font>



至于<font color=red>为什么</font>会出现不同的结果，

对于y=a*x^b，可能是 Excel 计算过程中可能是先将 x^b作为一个整体，然后进行线性回归运算，而 Origin，matlab 和 R 中直接对原始数据进行<font color=red>多次迭代算法</font>后，得到最终<font color=red>非线性拟合结果</font>。



总之，对于诸如 **y=a*x^b** 等<font color=red>**非线性拟合**</font>，一定要看拟合曲线能否反映数据的真实信息，不可一味追求高 R^2 值，而损失原始数据的重要信息，<font color=red>**个人推荐使用 Origin 和 R 等**</font>采用内置迭代算法的软件进行拟合，求回归方程等。



*有兴趣的朋友可以对自己的数据进行不同方法验证，或者进一步研究不同软件算法的原理。*


---
相关引用:

**1.** [Excel、Origin、Datafit对于同一组数据，进行幂函数拟合时候结果不一样，为什么？](http://emuch.315955.com/html/201304/5710928.html)



---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn