---
title: 不蒜子统计的 Bugs
date: 2017-04-07 20:05:20
categories:  
- 技术
- Hexo建站
tags: [不蒜子统计]
---

---

两行代码 搞定计数，“不蒜子统计” 在码农界的江湖地位不容小觑！

十分感谢原作者“不如”免费开放源代码给大家使用，我的博文阅读次数目前也是使用它。

<!-- more -->

http://ibruce.info/2015/04/04/busuanzi/

http://busuanzi.ibruce.info/

依次排查：

1\. 显示站点总访问量

要显示站点总访问量，复制以下代码添加到你需要显示的位置。有两种算法可选：

<font color=red>算法a：**pv的方式**，单个IP用户连续点击n篇文章，记录n次访问量。没有问题。</font>
<br>

``` bash
<span id="busuanzi_container_site_pv">
    本站总访问量<span id="busuanzi_value_site_pv"></span>次
</span>
```

<br>
<font color=red>算法b：**uv的方式**，单个IP用户连续点击n篇文章，只记录1次访客数。有点小问题。</font>



单个IP用户在打开某个人网页后，连续点击n篇文章，只记录1次访客数。

即，单个IP用户在打开某个人网页A后，连续点击a篇文章，只记录1次访客数，这里ok；

但是，**同一IP用户关闭**某个人网页A后，**重新再打开**次此网页A，不管再点击几篇文章，**会记录1+1次访客数**；

同样地，**此IP用户再关闭再打开，依次类推，会记录的访客数为 1+1+1+....**


``` bash
<span id="busuanzi_container_site_uv">
  本站访客数<span id="busuanzi_value_site_uv"></span>人次
</span>
```

---

2\. 显示单页面访问量

要显示每篇文章的访问量，复制以下代码添加到你需要显示的位置。

<font color=red>算法：**pv的方式**，单个用户点击1篇文章，本篇文章记录1次阅读量。没问题。</font>

不论是否相同IP用户，每刷新 +n 次，本篇文章记录 +n 次阅读量。

``` bash
<span id="busuanzi_container_page_pv">
  本文总阅读量<span id="busuanzi_value_page_pv"></span>次
</span>
```

---

**附录：扩展开发（自定义）**

不蒜子之所以称为极客的算子，正是因为不蒜子自身只提供标签+数字，至于显示的style和css动画效果，任你发挥。

busuanzi_value_site_pv 的作用是异步回填访问数，这个id一定要正确。

busuanzi_container_site_pv的作用是为防止计数服务访问出错或超时（3秒）的情况下，使整个标签自动隐藏显示，带来更好的体验。这个id可以省略。

因此，你也可以使用极简模式：

``` bash
本站总访问量<span id="busuanzi_value_site_pv"></span>次
本站访客数<span id="busuanzi_value_site_uv"></span>人次
本文总阅读量<span id="busuanzi_value_page_pv"></span>次
```

或者个性化一下：

``` bash
Total pageviews<span id="busuanzi_value_site_pv"></span> times.
您是xxx的第<span id="busuanzi_value_site_uv"></span>个小伙伴
<span id="busuanzi_value_page_pv"></span> Hits
```

> 以上代码均来自于 http://ibruce.info/2015/04/04/busuanzi/







---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn