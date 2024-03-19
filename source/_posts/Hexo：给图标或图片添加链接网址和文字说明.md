---
title: Hexo：给图标或图片添加链接网址和文字说明
date: 2017-03-25 14:45:29
categories:  
- 技术
- Hexo建站
tags: [Hexo, 图片, 链接, 文字说明]
---

---
	

这估计是程序员最不屑的技能，但对于非程序员的我来说，还是Mark一下代码以后备用吧。

**目的：**

访客鼠标移动至我的图片时，如果不能直接明白图片的意思的话，需要自动显示文字说明就方便多了，

另外，鼠标点击我的图片，即可弹出相应链接的网站，更方便了。

<!-- more -->

**方法：**

“图片，链接，文字说明”三效合一的**效果图**见下图。

<img src="https://ooo.0o0.ooo/2017/03/25/58d60a91a9a8d.png" align=center/>

当鼠标移动至此红色图标时，会自动显示这是“科学网”三个字的说明，

点击此图标后即可打开我的科学网网站。

代码如下：

``` bash
<center><a href="http://blog.sciencenet.cn/u/meiweipingg" title="科学网" target="_blank"><img src="http://i4.buimg.com/567571/0044520727e81248.png" width=15% height=15% ></a>
```

可以将此代码插入到 主题配置的_config.yml下的比如说about_me文件， 或者 header.ejs等等区域里面，均可生效。










---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn