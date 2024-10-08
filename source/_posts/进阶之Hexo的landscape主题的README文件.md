---
title: 进阶之Hexo的landscape主题的README文件
date: 2017-03-13 10:27:26
categories: 
- 技术
- Hexo建站
tags: [README, landscape主题, Hexo]
---

---



<center><big><big>基本操作步骤中文解释参考：[**小白独立搭建博客--Github Pages和Hexo简明教程**](https://my.oschina.net/ryaneLee/blog/638440)</big></big></center>

landscape主题作者的[README.md文件链接](https://github.com/hexojs/hexo-theme-landscape/blob/master/README.md)

Jimxu的博文：hexo的landscape-plus主题添加[不蒜子访客及访问量统计插件](http://jimxu.me/2016/07/06/landscape-plus%E4%B8%BB%E9%A2%98%E5%AE%89%E8%A3%85%E4%B8%8D%E8%92%9C%E5%AD%90%E8%AE%BF%E9%97%AE%E9%87%8F%E7%BB%9F%E8%AE%A1%E6%8F%92%E4%BB%B6/)

M-x Chris-An-Emacser的博文：[为Hexo添加Disqus最近评论支持——以Landscape类主题为例](https://chriszheng.science/2015/09/13/Hexo-add-recent-comment/)

SummerWinds的博文：[主题修改 之 返回顶部按扭](http://blog.meredith.net.cn/2015-02-13/Theme-Modified-Gotop/)，已确认适用于Hexo Landscape主题,但原文少了gotop.js的代码，特此补充如下。

<!-- more -->

☆------

gotop.js
``` bash
(function($){

	//Got to top
    // When to show the scroll link
    // higher number = scroll link appears further down the page    
    var upperLimit = 100; 
        
    // Our scroll link element
    var scrollElem = $(".icon-gotop");
    
    // Scroll to top speed
    var scrollSpeed = 500;

    // Show and hide the scroll to top link based on scroll position    
	scrollElem.hide();
    $(window).scroll(function () {             
        var scrollTop = $(document).scrollTop();        
        if ( scrollTop > upperLimit ) {
            $(scrollElem).stop().fadeTo(300, 1);  // fade back in            
        }else{        
            $(scrollElem).stop().fadeTo(300, 0);  // fade out
        }
    });

    // Scroll to top animation on click
    $(scrollElem).click(function(){ 
        $('html, body').animate({scrollTop:0}, scrollSpeed); return false; 
    });

})(jQuery);

```

-------☆

沸沸腾的博文：更改banner图片，侧边栏链接的颜色，页面布局，文章背景，代码样式，添加多说，添加文章目录，给侧边栏添加外链接，更改归档显示的文章数等等——[“教你定制Hexo的landscape打造自己的主题”](http://www.jianshu.com/p/b96fd206571a)

<font color=red>定制代码样式:这个必须单拿出来写</font>

代码的高亮样式在present/source/css/_partial/highlight.styl中

``` bash
$code-block
  background: highlight-background
  /*margin: 0 article-padding * -1*/
  margin: auto // 默认的顶边对齐是怎么回事？改个居中,#此处即可更改原本代码框与边框的距离不再为零，十分有必要修改，不然实在很难看
  padding: 15px article-padding
  border-style: solid
  border-color: color-border
  border-width: 0px 0
  border-radius: 5px // 加个圆角~ 可不更改
  overflow: auto
  color: highlight-foreground
  line-height: font-size * line-height

$line-numbers
  color: #666
  font-size: 0.85em // 行号大小

...

.highlight
    @extend $code-block
    pre
      border: none
      margin: 0
      padding: 0
    table
      margin: 0
      width: auto
      font-size: 14px // 设置代码字体
      letter-spacing: 1px // 设置字间距，要不太挤了
```

---

xiu's Blog：[Hexo next主题加入字数统计 WordCount](http://ixiusama.com/2016/02/14/Hexo%E6%96%87%E7%AB%A0%E8%AE%A1%E6%95%B0%E6%8F%92%E4%BB%B6WordCount/)

在Hexo <font color=red>Landscape主题下添加字数统计</font>和 xiu's Blog略有不同。Landscape中操作如下：

在Hexo根目录下运行

``` bash
npm i --save hoxo-wordcount
```

修改 theme 模板文件，在 E:\~\Hexo\themes\landscape\layout\_partial\article.ejs 文件中，<footer class="article-footer">之后，</footer>之前的区域内加入：

``` bash
<span class="post-count">字数统计：<%= wordcount(post.content) %>  字 </span>
```
即可统计单篇文章的字数。

☆☆☆

 <span class="post-count">中文版博客总字数统计：<b><%= totalcount(site) %></b></span>

上面这句是统计中文版博客总字数的，可以放到

E:\~\Hexo\themes\landscape\layout\_partial\footer.ejs 或

E:\~\Hexo\themes\landscape\layout\_widget\about_me.ejs 等等其他位置里。


---

<font color=red>**本文作者：导航栏logo字体的设置，即更改个人网站title和subtitle字体的颜色：**</font>

找到如下路径的header.styl文件，

> E:\~\Blog\Hexo-cn\themes\landscape\source\css\_partial\header.styl

将原始代码：

     $logo-text
      text-decoration: none
      color: #fff    #白色字体
      font-weight: 300
      text-shadow: 0 1px 4px rgba(0, 0, 0, 0.3)
	  
改为如下代码即可，颜色为css代码——可参考 http://flatuicolors.com/ 网站：

     $logo-text
      text-decoration: none
      color: #3498db    #蓝色字体
      font-weight: 300
      text-shadow: 0 1px 4px rgba(0, 0, 0, 0.3)

----

<font color=red>**本文作者：重要网址分享**</font>


1. 在线ico图标制作网站：http://www.bitbug.net/   （直接选本地图片，即可生成.ico文件，比如用于替换hexo-landscape主题自带的 /favicon.ico）

2. 在线二维码生成网站：http://www.liantu.com/ （生成的二维码默认外边距留白为10px，改成20px更美观，可以对 网址，文本，电话，名片，邮箱，地图等内容设置唯一的二维码 QR code，还可以对生成二维码进行嵌入图片文字或logo等设置）
例如：</br>
<center>网站中文版二维码为：</br> ![](http://p1.bqimg.com/567571/fa7b482ddc6cb519.png)

网站English version二维码为:</br> ![](http://p1.bpimg.com/567571/0cbb2e138eb957cc.png)</center>





---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn