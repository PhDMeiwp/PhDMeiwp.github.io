---
title: Hexo landscape 添加腾讯公益404帮助寻找失踪儿童页面
date: 2017-03-20 18:21:50
categories:  
- 技术
- Hexo建站
tags: [Hexo, 404错误, 腾讯公益404页面, 寻找失踪儿童]
---

---



有时候，当我们打开自己博客，不小心在url中输入了错误的路径时，会出现默认的404页面，如下图：

<img src="http://oakland.github.io/2016/05/04/hexo-%E5%A6%82%E4%BD%95%E5%88%9B%E5%BB%BA404%E9%A1%B5%E9%9D%A2/GitHubPages404.png" width=60% align=center>

---

**爱心人士认为，404页面也是有十分重要作用的！**

比如，<font color=red>将自己页面404错误页面设置为有爱的“腾讯公益404页面”</font>，“一起帮助寻找失踪儿童，让宝贝回家”。

<!-- more -->

设置方法为：

在 Hexo根目录下的 source文件夹里面新建一个 404.html 的文件，内容如下：

``` bash
<html>
    <head>
         <meta charset="UTF-8" />
         <title>404</title>                                                                                                                                        
    </head>
    <body>
         <script type="text/javascript" src="http://www.qq.com/404/search_children.js" charset="utf-8" homePageUrl="http://您的主页网址.com" homePageName="回到我的主页"></script>
	</body>
</html>
```

然后在Hexo根目录下运行 hexo g -d 就完成了。（注意，hexo g 然后 hexo s 的话，在本地 http://localhost:4000/404/ 里面是查看不到效果的，必须 hexo g -d 推送之后才有用）

效果的话，可以在自己的一级域名后面随便输入一个内容，比如：http://您的主页网址.com/123456  ， 即会打开 腾讯404 公益页面。

<img src="http://mat1.gtimg.com/www/404/banner_02_20150320.jpg" width=60% align=center>


上面的图片，就是我们的爱心。更多参考：http://www.qq.com/404/




---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn