---
title: Hexo：如何解决 FATAL Cannot read property 'code' of undefined
date: 2017-03-25 12:02:43
categories:  
- 技术
- Hexo建站
tags: [Error, Hexo, FATAL, code undefined]
---

---


突然，运行 hexo g -d 出现了 ERROR，

``` bash
FATAL Cannot read property 'code' of undefined
```

出现上述Error着实让人头疼，不管新建post.md还是其他更改，均无法完成 hexo g -d （即生成和推送）。

尝试了很多更改，终于奏效了一个，在此备忘并分享，步骤如下：

<!-- more -->

打开**Hexo根目录下的 package.json 文件**，

将其内容更改如下：

``` bash
{
  "name": "hexo-site",
  "version": "0.0.0",
  "private": true,
  "hexo": {
    "version": ""   # 此处右边的引号内原本有个 3.2.0，删除即可，不要填新的内容，重新运行后系统会自动填充这个引号内的数据。
  },
  "dependencies": {
    "hexo": "^3.2.0",
    "hexo-deployer-git": "^0.2.0",
    "hexo-deployer-heroku": "^0.1.1",
    "hexo-deployer-openshift": "^0.1.1",
    "hexo-deployer-rsync": "^0.1.2",
    "hexo-generator-archive": "^0.1.4",
    "hexo-generator-category": "^0.1.3",
    "hexo-generator-feed": "^1.2.0",
    "hexo-generator-index": "^0.2.0",
    "hexo-generator-search": "^1.0.4",
    "hexo-generator-sitemap": "^1.1.2",
    "hexo-generator-tag": "^0.2.0",
    "hexo-renderer-ejs": "^0.2.0",
    "hexo-renderer-marked": "^0.2.11",
    "hexo-renderer-stylus": "^0.2.3",
    "hexo-server": "^0.2.0",
    "hexo-wordcount": "^2.0.1",
    "hexo-toc": "^1.0.8",
    "hexo-url-image": "^0.1.0",
    "hexo-encrypt": "^0.2.0",
    "hexo-blog-encrypt": "1.1.*"    # 最后一行文本需要注意，此处末尾原本有个多余的 逗号，已删除
  }
}
```

以上更改完成后，即可恢复 hexo g -d 正常运行啦。

不排除有其他疑难杂症和相应解决方案，一事一议，先就写到这里为止啦。







---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn