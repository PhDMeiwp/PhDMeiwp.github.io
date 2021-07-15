---
title: Hexo Landscape 如何更改上一篇下一篇链接的字体颜色
date: 2017-03-11 18:46:16
categories:  
- 技术
- Hexo建站
tags: [Hexo, 字体, 颜色, 上一篇下一篇 ]
---

---


先看效果图：

更改前文字和链接都是灰色的，很难看清楚： 

<!-- more -->

<img src="http://p1.bqimg.com/567571/83987dbe4767800c.png">

<font color=blue>更改后文字和链接改为蓝色的</font>，一目了然：<img src="http://p1.bpimg.com/567571/f8824c9adaa1ff40.png">

方法：

打开主题（\landscape\\\\）文件夹内的nav.ejs 文件，路径如下

E:\~\Blog\Hexo\themes\landscape\layout\_partial\post\nav.ejs

将初始代码：

      <% if (post.prev || post.next){ %>
      <nav id="article-nav">
        <% if (post.prev){ %>
          <a href="<%- url_for(post.prev.path) %>" id="article-nav-newer" class="article-nav-link-wrap">
            <strong class="article-nav-caption"><%= __('newer') %></strong>
            <div class="article-nav-title">
              <% if (post.prev.title){ %>
                <%= post.prev.title %>
              <% } else { %>
                (no title)
              <% } %>
            </div>
          </a>
        <% } %>
        <% if (post.next){ %>
          <a href="<%- url_for(post.next.path) %>" id="article-nav-older" class="article-nav-link-wrap">
            <strong class="article-nav-caption"><%= __('older') %></strong>
            <div class="article-nav-title"><%= post.next.title %></div>
          </a>
         <% } %>
      </nav>
      <% } %>

**更改为（添加了4处 font color=blue 和 /font 的内容，并顺便加了个中文的“上一篇”，“下一篇”）：**

      <% if (post.prev || post.next){ %>
      <nav id="article-nav">
        <% if (post.prev){ %>
          <a href="<%- url_for(post.prev.path) %>" id="article-nav-newer" class="article-nav-link-wrap">
            <strong class="article-nav-caption"><font color=blue><%= __('下一篇 newer') %></font></strong>
            <div class="article-nav-title">
              <% if (post.prev.title){ %>
                <font color=blue><%= post.prev.title %></font>
              <% } else { %>
                (no title)
              <% } %>
            </div>
          </a>
        <% } %>
        <% if (post.next){ %>
          <a href="<%- url_for(post.next.path) %>" id="article-nav-older" class="article-nav-link-wrap">
            <strong class="article-nav-caption"><font color=blue><%= __('上一篇 older') %></font></strong>
            <div class="article-nav-title"><font color=blue><%= post.next.title %></font></div>
          </a>
         <% } %>
      </nav>
      <% } %>


更改完代码，在根目录E:\~Blog\Hexo下运行：

        $ hexo g
		$ hexo s

在本地网址 http://localhost:4000/ 查看效果，没有问题的话，就再运行：

        $ hexo g -d

推送到网页博客，就Ok了。以上。







---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn