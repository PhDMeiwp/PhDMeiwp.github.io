---
title: Hexo 实现多终端同步
date: 2017-04-24 21:04:22
categories:  
- 技术
- Hexo建站
tags:
---

---


<center><font color=red>在原本的A电脑上，</font></center>

**首先，原电脑上搭建hexo博客**并进行页面优化，可参考 [进阶之Hexo的landscape主题的README文件](http://phdmeiwp.github.io/%E8%BF%9B%E9%98%B6%E4%B9%8BHexo%E7%9A%84landscape%E4%B8%BB%E9%A2%98%E7%9A%84README%E6%96%87%E4%BB%B6/)

<!-- more -->

**其次，也很重要：在Github远程创建 hexo branch**，并将新的**hexo** branch **设置成 Default branch**，替代原本的默认分支: master branch，操作步骤可参考 [使用git进行版本控制，实现不同终端同步](https://righere.github.io/2016/10/10/install-hexo/)。

同时，就是将原电脑hexo博客的所有源文件（而不是只有master文件）上传到hexo branch。

> 注意这里有个巨大的坑！！！如果你用的是第三方的主题theme，是使用git clone下来的话，要把主题文件夹下面把.git文件夹删除掉，不然主题无法push到远程仓库，导致你发布的博客是一片空白


初始化本地仓库： git init


添加本地所有文件到仓库：git add -A


添加commit：git commit -m "blog源文件"


添加本地仓库分支hexo：git branch hexo


添加远程仓库：git remote add origin git@github.com:yourname/yourname.github.io.git


将本地仓库的源文件分支hexo强制推送到远程仓库hexo分支：git push origin hexo -f

上传完成之后，我们就拥有了两个远程的分支：master和hexo，其中master是部署成博客的分支；hexo是我们可以clone到其他电脑或其他系统的hexo源文件的分支，而且我们已经将它设置成默认仓库。


---


<center><font color=red>在新的B电脑上，</font></center>


<font color=blue>1\. 安装Node.js</font>

在 Windows 环境下安装 Node.js 非常简单，仅须到[官网下载](https:--nodejs.org/en/download/)安装文件并执行即可完成安装。

**Mac 系统用户操作同上。**

<font color=blue>2\. 安装 Git</font>
windows系统用户下载 msysgit 并完成安装。

**Mac 系统用户则下载 Xcode 并完成安装。**


<font color=blue>3\. clone远程仓库hexo分支</font>

在B电脑新建 Blog文件夹（文件夹名字自己定），在此文件夹执行 Clone安装步骤如下：

``` bash
git clone -b hexo git@github.com:yourname/yourname.github.io.git
```

**Mac 系统用户个人推荐直接下载 [Github Desktop](https://desktop.github.com/)，然后打开本地Mac电脑的Github Desktop软件并登录个人账号，里面有相应下拉菜单栏即可完成 clone 步骤。**

<font color=blue>4\. 安装npm</font>

进入本地的Hexo博客根目录——【yourname.github.io.git文件夹】，执行hexo安装： npm install

**Mac 系统用户操作同上。**

> <font color=blue>补充：安装 SSH </font>
在博客根目录下，运行git bash，安装和原来SSH同一电子邮箱的SSH，并添加SSH到个人Github中去。可参考配置SSH:https://www.cnblogs.com/ayseeing/p/3572582.html 或 https://my.oschina.net/ryaneLee/blog/638440

----

## Debug时间到！

- 安装完npm之后，在博客根目录下运行 git bash，然后运行 hexo g 如果【报错1】如下：

``` bash
     Cannot read property 'toString' of undefined
```

参考解决方案：则直接删除相应的npm文件——即【node_modules文件夹】中的【hexo-encrypt】文件夹，至少我的本次尝试是有效的，也算一个解决方法吧^_^。

- 安装完npm之后，在博客根目录下运行 git bash，然后运行 hexo g 如果【报错2】如下：

``` bash
     bash: hexo: command not found
```

参考解决方案 https://my.oschina.net/ryaneLee/blog/638440 ：在“电脑桌面”右键鼠标，点击Git Bash Here，输入下列npm命令即可安装

``` bash
npm install hexo-cli -g
npm install hexo-deployer-git --save
```

第一句是安装hexo，第二句是安装hexo部署到git page的deployer，两个都需要安装。

再次运行 hexo g 就没有上述报错了。

**Mac 系统用户操作同上。**

<font color=blue>5\. 本地写 new post</font>

在source->_posts文件夹下hexo n "New post name" 新建md文件，并编辑好保存后，注意直接按第6步的顺序操作，重要。

**Mac 系统用户操作同上。**

<font color=blue>6\. 发布new post</font>

这一步有必要单列出来。一定要按照先后顺序完成每一步，否则 hexo d 推送会报错。

``` bash

// 先删除本地博客根目录下的 【.git 文件夹】，然后运行下面的代码

git init

git add -A

git commit -m "Blog source files"

git branch hexo

git remote add origin git@github.com:yourusername/yourusername.github.io.git

git push origin hexo -f

hexo g

hexo d
```

## Debug时间又到了！

【报错】hexo部署到github时，即运行 hexo d 时，提示typeError [ERR_INVALID_ARG_TYPE]: The “mode“ argument must be integer.
【参考解决方案】是node版本过高导致的（我用的是v16.11.0），将node版本换为v12.12.0版本后，部署就成功了！下载node-v12.12.0-x64.msi文件进行安装，网址 https://nodejs.org/download/release/v12.12.0/

**Mac 系统用户操作同上。**


---


<center><font color=red>平时同步管理</font></center>

每次想写博客时，先执行：git pull进行同步更新。发布完文章后同样按照上面的 发布博客后同步 同步到远程仓库。

<center>[平时常用命令整理](http://eryouhao.github.io/2016/06/25/hello-hexo/)</center>

``` bash
// 先删除本地博客根目录下的 【.git 文件夹】，然后运行下面的代码

git init

git add -A

git commit -m "Blog source files"

git branch hexo

git remote add origin git@github.com:yourusername/yourusername.github.io.git

git pull origin hexo -f

hexo n "新建文章"


// 先删除本地博客根目录下的 【.git 文件夹】，然后运行下面的代码

git init

git add -A

git commit -m "Blog source files"

git branch hexo

git remote add origin git@github.com:yourusername/yourusername.github.io.git

git push origin hexo -f

hexo g 

hexo d 
```

**时间匆忙，写的有很多纰漏，待后续更新。**



---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn