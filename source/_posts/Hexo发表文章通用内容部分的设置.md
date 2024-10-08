---
title: Hexo发表文章通用内容部分的设置
date: 2017-03-11 10:45:11
categories:  
- 技术
- Hexo建站
tags: [通用代码, post, worning icon, FontAwesome字体]
---

---


如果每篇post.md文章内容都包含<font color=red>同一部分内容</font>的话，比如在文首添加阅读量的<font color=red>通用代码：</font>


     <span id="busuanzi_container_page_pv">
     <table><tr><td bgcolor=darkred><font color=white><center>  本文总阅读量 <span id="busuanzi_value_page_pv"></span> 次</center></font></td></tr></table>
     </span>
     ---

可以将<font color=red>这部分内容代码</font>直接copy-paste到 E:~\Blog\Hexo\scaffolds\post.md文件里面，则每次运行

<!-- more -->

     $ Hexo n “post title A”
	 
时，新生成的 post title A.md里面就都会包含<font color=red>那同一部分内容</font>了！虽然也有点麻烦哈。。。






---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn