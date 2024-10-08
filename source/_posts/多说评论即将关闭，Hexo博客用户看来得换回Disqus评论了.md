---
title: 多说评论即将关闭，Hexo博客用户看来得换回Disqus评论了
date: 2017-03-26 10:47:07
categories:  
- 技术
- Hexo建站
tags: [多说评论, Disqus评论, Hexo]
---

---




<center>**重要通知: <font color=red>多说评论即将关闭</font>**</center>

<center>多说网 发表于 2017年3月21日</center>

因公司业务调整，非常遗憾的向大家宣布多说项目即将关闭。 我们将于<font color=red>**2017年6月1日正式关停服务**</font>，在此之前您可以通过后台的数据导出功能导出自己站点的评论数据。 对此给您造成的不便，我们<font color=red>深表歉意</font>，感谢您的一路相伴。

<!-- more -->

来源：http://dev.duoshuo.com/threads/58d1169ae293b89a20c57241

<img src="http://i1.piimg.com/567571/acd597d228553825.jpg" width=40% align=center> 

---------

刚捣鼓出给自己的 Hexo 静态博客（meiweiping.cn）添加了 多说评论，让大家方便用熟悉的qq，微信，微博等方式登录后留言交流，

没想到这还没几天就遇上这 多说评论 即将关闭的通知，罢了，赶紧把 多说评论又换成了 国际通用的  Disqus 评论。

 

<center>**Disqus评论恢复方法为：**</center>

 

**第一步：**

打开 E:\~\Hexo\themes\landscape\layout\_partial\article.ejs 文件，把多说评论 的所有代码删除，然后在此.ejs文件的最后位置添加Disqus评论的以下代码：


``` bash
<% if (!index && post.comments && config.disqus_shortname){ %>
  <section id="comments">
    <div id="disqus_thread">
      <noscript>Please enable JavaScript to view the <a href="//disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    </div>
  </section>
<% } %>
<% }%>
```

代码插入保存完成后，

 

**第二步：**

回到主题目录E:\~\Hexo\themes\landscape\，打开其 \_config.yml 文件，在最后位置添加自己的 disqus_shortname，代码如下

``` bash
# duoshuo_shortname: your duoshuo_shortname #这个多说评论的shortname已经不需要了。

disqus_shortname: your own disqus_shortname 
```

自己的 disqus_shortname 直接去官网 https://disqus.com 申请一个就可以了。










---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn