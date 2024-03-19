---
title: Hexo：如何解决本地更新文件后无法在个人网站中显示
date: 2017-03-25 13:14:55
categories:  
- 技术
- Hexo建站
tags: [Hexo, 本地文件, 不能同步, 个人网站]
---

---



Hexo中，比如在本地新建了文件后，或者在本地更改了配置文件代码后，

在Hexo 根目录下运行 hexo g -d 后，

在**本地**Hexo/public文件和Hexo/.deploy_git文件中都可以（或已经）生成了相应的更新文件，

**无法同步更新到个人网站，或者说推送到网络端失败，**

怎么办？解决方案一例：

<!-- more -->

打开**Hexo 根目录下的 _config.yml文件**，最下方的 **Deploy**站点部署到github配置代码更改为Hexo原始**代码**形式，如下：

``` bash
deploy:
  type: git    #冒号后面空一格再写内容 git，下同
  repository: https://github.com/ryan1111anchang/ryan1111anchang.github.io.git
  branch: master
```  

（上述repository代码网址参考 https://my.oschina.net/ryaneLee/blog/638440）

更改好保存后，Hexo 根目录下运行 hexo g -d 

即可成功推送本地内容到个人网站啦。








---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn