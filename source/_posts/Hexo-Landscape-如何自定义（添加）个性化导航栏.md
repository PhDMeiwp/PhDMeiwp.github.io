---
title: Hexo Landscape 如何自定义（添加）个性化导航栏
date: 2017-03-09 16:07:25
categories:  
- 技术
- Hexo建站
tags: [Git bash, 导航栏, 自定义, Home, Archives]
---

---



目的：帮助和我一样的小白菜们，在 Hexo Landscape主题网站中添加自己想要的导航栏（Home 和 Archives 以外的自定义项）。

换句话说就是：

我已经在我的Hexo博客中发表了名为 <font color=darkgreen>“联系方式” 的 post.md 文章</font>，然后我想在<font color=red>导航栏添加 “Contact”项</font>，点击导航栏直接打开Contact文章。

<!-- more -->

<img src="http://7xrwkh.com1.z0.glb.clouddn.com/github-jxw.jpg" align=center/>


---
**根目录**：名为**Hexo**的文件夹

**主题目录**：名为**Landscape**的文件夹，我的路径为 E:\~\Blog\Hexo\themes\landscape

为了方便区分，全文例子中将博文命名为中文 "联系方式.md"，将导航栏项命名为英文 "Contact"
 
效果见网站 [meiweiping.cn](http://meiweiping.cn)

---
*Hexo搭建静态博客见：[小白独立搭建博客--Github Pages和Hexo简明教程](https://my.oschina.net/ryaneLee/blog/638440)*

<cneter><font color=red>Step 1: 写文章，并推送到自己的 （username.github.io）网站</font></center>


在 <font color=darkgreen>E:\~\Blog\Hexo\source\_posts</font> 的文件夹中，鼠标右键 “Git Bash”运行

    $ Hexo n "联系方式"

在E:\~\Blog\Hexo\source\_posts 的文件夹中自动生成 "联系方式.md" 的文件，用 Markdown等软件编辑此.md文章的内容，完成后，再在此文件夹中，鼠标右键 “Git Bash”运行

     $ Hexo g -d

至此，可以在您的个人网站 username.github.io 网页查看这篇"联系方式.md"的新文章了 ^_^

但我们的关注点应该在这：上述步骤完成后，会在 E:~\Blog\Hexo\public\中自动生成一个名为“联系方式”的文件夹（路径为 <font color=darkgreen>E:~\Blog\Hexo\public\联系方式</font>）

至此，已经完成了一半...

---
(接下来就是关键步骤了)

<cneter><font color=red>Step 2: 设置“Contact导航栏”，并关联到 上述 “联系方式”文章</font></center>

打开 主题目录下 E:\~\Blog\Hexo\themes\landscape\_config.yml 文件，默认内容为：

     menu:
        Home: /
        Archives: /archives

我将上述内容添加修改为：

     menu:
        首页Home: /
        归档Archives: /archives
        Contact: /联系方式       #注意冒号后面都必须有一个空格！

在 E:\~\Blog\Hexo\的文件夹中，鼠标右键 “Git Bash”运行

     $ Hexo g -d

好啦，在您的个人网站 username.github.io 中就可以查看到<font color=red>“Contact导航栏”</font>啦，点击，即可链接到“联系方式”的文章啦，OK，全部结束。

如果您没有在网站立即查看到效果的话，可能是网页更新延迟的缘故，等一会儿或者用手机登陆查看会更新快一些。



---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn