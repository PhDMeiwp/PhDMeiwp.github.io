---
title: Hexo如何建立中英文双语博客
date: 2017-03-13 11:15:39
categories:  
- 技术
- Hexo建站
tags: [English version, Chinese version]
---



感谢[[陈年沉念]](https://chenyxmr.github.io/2016/08/04/hexo-bilingual/) 的博文分享。


具体操作请参阅[陈年沉念的博文](https://chenyxmr.github.io/2016/08/04/hexo-bilingual/) 。

本文只提出几点需要特别注意的事项。

<!-- more -->


**第一*, 有<font color=red>两个“点号”</font> 在<font color=red>"/public/en"</font> 的前面:

    
     修改/en/_config.yml，修改内容如下：

		language: en </br>
		root: /en/  </br>
		public_dir: ../public/en  </br>


**第二**, 也有<font color=red>两个“点号”</font> 在 <font color=red>"commonweal:"</font> 的前面:


      接下来在英文网站中添加中文入口。编辑/en/_config.yml，修改menu:中如下内容：

		commonweal: ../


顺便说一句, [[陈年沉念]](https://chenyxmr.github.io/2016/08/04/hexo-bilingual/)写的"/update.bat" 很方便且实用。

最后，我自己再补充一点，就是在完全Copy完Hexo网站跟目录的内容后，在新建的/en/文件夹下，node_modules文件夹里面的代码可能不能被完全复制粘贴，此时需要在/en/文件夹下运行以下代码方可顺利发布/en/到网络端：

先 鼠标右键 git bash here，然后运行

		npm install hexo --save
		npm install
		
		npm install hexo-generator-index --save
		npm install hexo-generator-archive --save
		npm install hexo-generator-category --save
		npm install hexo-generator-tag --save
		npm install hexo-server --save
		npm install hexo-deployer-git --save
		npm install hexo-deployer-heroku --save
		npm install hexo-deployer-rsync --save
		npm install hexo-deployer-openshift --save
		npm install hexo-renderer-marked@0.2 --save
		npm install hexo-renderer-stylus@0.2 --save
		npm install hexo-generator-feed@1 --save
		npm install hexo-generator-sitemap@1 --save

完成上述附加的必要操作后，就可以顺利推送双语或多语博客到网络端啦。

<img src="https://i.loli.net/2017/08/24/599e7ec5a3b4d.gif" align=center>


----

转载来源： https://chenyxmr.github.io/2016/08/04/hexo-bilingual/

前言
搭建个人博客时采用的hexo非常方便，但由于本人比较喜欢英语所以希望能搭建一个双语网站同步更新内容，hexo官方有提供国际化解决方案，具体参见链接https://hexo.io/zh-cn/docs/internationalization.html 。 但本人由于悟性比较低没有看明白这个插件应该怎么用，就索性自己用一个非常简单粗暴的方式实现了中英文双语网站。

首先，最终效果见本站。菜单栏中点击->English切换到英文网站，英文网站中点击->简体中文即切换回中文。当然每篇博文都需要自己翻译。

搭建教程
完整复制网站

首先，将网站根目录全部复制，然后在网站根目录下建立en/文件夹并将所复制的内容粘贴至此。此时en/文件夹下有一份完整的网站文件，也就是说这是一个独立的hexo博客。

en即为English的缩写，代表英文网站，当然也可以添加其它语言，文件夹名字随个人喜好。

更改英文网站配置

修改/en/_config.yml，修改内容如下：

language: en
root: /en/
public_dir: ../public/en

这里的public_dir代表最终生成静态文件的位置，由于最后要将英文网站静态网页跟中文静态网页放到同一根目录下，所以要进行修改。

添加语言切换入口

首先在中文网站中添加切换英文入口。语言切换入口对应网站的menu，编辑/_config.yml，修改menu:中如下内容：

commonweal: /en

这个键值对应所建立的英文网站文件夹的名称。

此处应该添加一个新的入口，但由于我的添加一直不正常所以直接将原有的公益菜单改成切换语言了~

再编辑/themes/next/languages/zh-Hans.yml，在menu:中修改如下字段：

commonweal: ->English

这个键值对应切换语言选项显示的内容。

接下来在英文网站中添加中文入口。编辑/en/_config.yml，修改menu:中如下内容：

commonweal: ../

再编辑/en/themes/next/languages/en.yml，在menu:中修改如下字段：

commonweal: ->简体中文

至此中英文站点即配置完成,如果英文网站需要更改细节直接更改en/下对应的文件就可以，和修改中文网站完全一样~

新建博文

每次在中文站点下新建博文并写好后，将博文复制到英文网站对应的目录下并修改成英文博文。



---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn