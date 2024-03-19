---
title: Hexo：如何解决categories显示分类文件404出错
date: 2017-03-25 12:47:37
categories:  
- 技术
- Hexo建站
tags: [category, 分类出错, hexo]
---

---



突然，不知哪里设置出错影响到了Hexo 的 分类功能 categories 也出错了，现象为：

 hexo/public/文件夹和 hexo/.deploy_git/文件夹内**不再自动生成 categories文件夹**，

同时，个人网站中点击 **“分类”无法弹出相应分类窗口**，而是出现404错误，

**怎么办？解决方案如下：**

<!-- more -->

其实就是将所有category文件代码改成Hexo Landscape主题的最原始的代码，即**category初始化思路，**


① 打开 E:\~\Hexo\themes\landscape\layout\category.ejs

更改内容为：
``` bash
<%- partial('_partial/archive', {pagination: config.category, index: true}) %>
```

② 打开 E:\~\Hexo\themes\landscape\layout\_widget\category.ejs

更改内容为：
``` bash
<% if (site.categories.length){ %>
  <div class="widget-wrap">
    <h3 class="widget-title"><%= __('categories') %></h3>
    <div class="widget">
      <%- list_categories({show_count: theme.show_count}) %>
    </div>
  </div>
<% } %>
```

③ 打开 E:\～\Hexo\themes\landscape\layout\_partial\post\category.ejs

更改内容为：
``` bash
<% if (post.categories && post.categories.length){ %>
  <div class="article-category">
    <%- list_categories(post.categories, {
      show_count: false,
      class: 'article-category',
      style: 'none',
      separator: '►'
    }) %>
  </div>
<% } %>
```

完成上述所有更改后，在Hexo 根目录下运行 

``` bash
hexo g -d 
```

即可解决“**Hexo categories分类功能无效或出错**”的问题。

以上。





---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn