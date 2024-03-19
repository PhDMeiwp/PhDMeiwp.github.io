---
title: hexo landscape中如何将导航栏设置为banner的底部
date: 2017-03-20 14:12:50
categories:  
- 技术
- Hexo建站
tags: [Hexo, landscape, 导航栏设置, banner底部]
---

---


Hexo-Landscape主题中默认的导航栏内容（包括“主页”，“归档”等）被设置于Banner的顶部，但是，为了让访客在浏览网页是能更快地找到 导航栏 ， 个人认为将其设置在 Banner底部 更加方便！

谷歌度娘都搜了一遍，并未发现有相关教程，因此，自己琢磨了一下，捣鼓出来了现在的效果，感觉还算可以，过程分享如下。

<!-- more -->

打开主题目录下的 hexo/theme/landscape/source/css/_partial/header.styl 文件，

找到如下默认设置：

``` bash
#header-inner 
  position: relative 
  overflow: hidden 
  
#header-title 
  text-align: center 
  height: logo-size 
  position: absolute 
  top: 50% 
  left: 0 
  margin-top: logo-size * -0.5 

#main-nav 
  float: left 
  margin-left: -15px 

.nav-icon 
  @extend $nav-link 
  font-family: font-icon 
  text-align: center 
  font-size: font-size 
  width: font-size 
  height: font-size 
  padding: 20px 3px 
  position: relative 
  cursor: pointer 
```

<br>
<font color=red>**将上述内容依次更改为：**</font>
<br>

``` bash
#header-inner
  position: absolute    #此处有更改
  top: 80%          #此处有添加，80% 即 导航栏位置的设定
  left: 0       #此处有添加
  overflow: hidden

#header-title
  text-align: center
  height: logo-size
  position: absolute
  top: 40%        #此处有更改
  left: 0
  margin-top: logo-size * -0.5


#main-nav
  float: left
  font-size: 18px    #此处有添加，更改导航栏字体的大小，默认font-size=14px
  margin-left: 30px

.nav-icon
  @extend $nav-link
  font-family: font-icon
  text-align: center
  font-size: 18px   #此处有更改，更改导航栏图标的大小，默认font-size=14px
  width: 18px    #此处有更改
  height: 18px   #此处有更改
  padding: 20px 15px
  position: relative
  cursor: pointer
```

以上更改结束，在Hexo根目录下运行 hexo g - d 即可查看效果。

当然，如果自己所使用的banner图片和导航栏文字不能很好吻合的话，请自行更改banner图片。

---

另外注意，
主题目录下的 hexo/theme/landscape/source/css/_variables.styl 文件中，将 “banner-height” 由默认的 300 px 改为 400 px 效果更佳。

``` bash 
// Header
logo-size = 40px
subtitle-size = 16px
banner-height = 300px    # 更改此处为 400 px
banner-url = "images/banner.jpg"
```

其他设置请勿轻易更改！ 

以上。






---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn