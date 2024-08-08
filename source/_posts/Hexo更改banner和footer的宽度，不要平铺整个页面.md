---
title: Hexo更改banner和footer的宽度，不要平铺整个页面
date: 2017-04-18 12:15:21
categories:  
- 技术
- Hexo建站
tags: [banner设置, footer设置,]
---

---

有人喜欢将导航栏banner宽度铺满整个页面，有人喜欢设置导航栏banner宽度与正文和小插件宽度之和相等。

Hexo Landscape主题自带的banner即为上述第一种情况，不需要做修改。

<!-- more -->

本文目的在于要实现第二种情况的banner，网上大概搜索了相关关键词没有查到方案，就自己试了很久，功夫不负有心人，试出了现在的效果，见[我的主页](http://phdmeiwp.github.io)。

包括以下操作：

- 更改 themes\landscape\layout\layout.ejs 的内容
- 微调 \themes\landscape\source\css\_partial\header.styl 的内容


---

**layout.ejs 的内容更改为：**

``` bash
<%- partial('_partial/head') %>
<body>
  <div id="container">
    <div id="wrap">

      <div class="outer">
      <%- partial('_partial/header', null, {cache: !config.relative_link}) %>	  
	  
        <!-- 修改section "main"-->

		<section id="main"><%- body %>
		</section>
		
		
       <!-- 下面的内容需注意每个<div>和</div>的位置和内容-->

        <% if (theme.sidebar && theme.sidebar !== 'bottom'){ %>
          <%- partial('_partial/sidebar', null, {cache: !config.relative_link}) %>
        <% } %>
      </div>
	  
	  <div class="outer">
      <%- partial('_partial/footer', null, {cache: !config.relative_link}) %>

	    </div> 
		</div> 
    <%- partial('_partial/mobile-nav', null, {cache: !config.relative_link}) %>
    <%- partial('_partial/after-footer') %>

  </div>
</body>
</html>
```

<br>
由于上述更改完成后，(banner的宽度) > (正文+小插件的宽度之和)，因为多了正文左侧和小插件右侧的gutter-width的宽度，因此，为了达到完全等宽的效果，需将

**header.styl 的内容微调了的代码**展示如下：

（由于左右两侧gutter-width的默认宽度为 20 px，所以下列 left：的距离均由原本的 0 更改为 10px）

``` bash
#header
  height: banner-height
  position: relative
  border-bottom: none
  &:before, &:after
    content: ""
    position: absolute
    left: 0
    right: 0
    height: 0
  &:before
    top: 0
    background: #fff
  &:after
    bottom: 0
    background: #fff

#header-outer
  height: 100%
  position: relative

#header-inner
  position: absolute
  bottom: 0
  left: 10 px
  overflow: hidden

#banner
  position: absolute
  top: 0
  left: 10 px
  width: (column-width + gutter-width) * columns 
  height: 100%
  background: url(banner-url) center #000
  background-size: 100% 100%;
  z-index: -1

#header-title
  text-align: center
  height: logo-size
  position: absolute
  top: 30%
  left: 10 px
  margin-top: logo-size * -0.5
```


**以上！**






---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn