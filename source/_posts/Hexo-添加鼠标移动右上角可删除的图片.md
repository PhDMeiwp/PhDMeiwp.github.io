---
title: Hexo 添加鼠标移动右上角可删除的图片
date: 2017-11-07 18:09:22
categories:  
- 技术
- Hexo建站
tags: 
  - Hexo
  - 右上角可删除的图片
---

---

闲话少叙，直接上图（效果可在[我的网站](http://phdmeiwp.github.io)页面右侧查看）：

![添加鼠标移动右上角可删除的图片.JPG](https://i.loli.net/2017/11/07/5a0178e361ae2.jpg)

<font color=red>鼠标移动至图片上时，即显示 删除 图标；鼠标离开图片时，删除图标消失； 刷新网页 或 鼠标再次移动至图片上时，删除图标 重新出现。 点击 删除 图标 × ，即可删除图片显示。</font>


<!-- more -->


代码：

打开文件夹里的 E:~\Hexo\themes\landscape\layout\_partial\footer.ejs 文件，在footer.ejs的内容最后面添加一下内容，保存即可。

注意：代码中的链接网址请更改为自己的想要的链接网址。

``` bash
<!--   add QQ online image etc. with "close button" -->
	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head>  
  
<style type="text/css">  
  .btnbox{  
  z-index:999;  
  position:fixed;  
  right:0px;  
  top: 340px;  
}  
</style>  
  
<script src="jquery.min.js" type="text/javascript"></script>  
<script type="text/javascript">  
  function show(thisObj)  
  {  
    $(thisObj).children("div").css("display","block");  
  }  
  
  function hide(thisObj)  
  {  
    $(thisObj).children("div").css("display","none");  
  }  
  
  function aa(obj){  
        $(obj).parent().parent().remove();  
  }  
</script>  
  
</head>  
<body>  
    <div id="content">     
       <div  onmouseover="show(this)" onmouseout="hide(this)"   style=" position:fixed; right:0px; top: 350px; ">  
	   
<a href="http://wpa.qq.com/msgrd?v=3&uin=2638800763&site=qq&menu=yes" title="点击图标与我qq交谈"><img border="0" src="https://i.loli.net/2017/11/07/5a0178310370f.png" width=20px height=20px ></a>
<br><a href="http://blog.sciencenet.cn/u/meiweipingg" title="科学网" target="_blank"><img src="http://i4.buimg.com/567571/0044520727e81248.png" width=20px height=20px ></a>   
<br><a href="http://www.facebook.com/meiweipingg" title="Facebook" target="_blank"><img src="http://i1.piimg.com/567571/9e2302528fbac519.png" width=20px height=20px ></a> 
<br><a href="http://orcid.org/0000-0001-6400-9862" title="ORCiD" target="_blank"><img src="http://i1.piimg.com/567571/a218cba2d269aca5.png" width=20px height=20px ></a>   
<br><a href="https://www.researchgate.net/profile/Weiping_Mei" title="ResearchGate" target="_blank"><img src="http://i1.piimg.com/567571/553d0e51933c8e4a.png" width=20px height=20px ></a>   
<br><a href="https://github.com/PhDMeiwp" title="Github" target="_blank"><img src="http://i1.piimg.com/567571/eb56cb6e640f5fcd.png" width=20px height=20px ></a>   
            
         <div class="btnbox" style="width:10px; height:10px;" >  
          <input type="button" value="×"  onclick="aa(this)"/>  
         </div>  
       </div>  
    </div>  
</body>  
</html>  
```


部分说明如下：

``` bash
<style type="text/css">  
  .btnbox{  
  z-index:999;  
  position:fixed;  
  right:0px;  
  top: 340px;  
}  
</style>
```

上面这段代码设置的是 “删除按钮” 的位置，比如   top: 340px; 。

``` bash
<div class="btnbox" style="width:10px; height:10px;" > 
 
<input type="button" value="×"  onclick="aa(this)"/> 
 
</div>
```
上面这段代码设置的是 “删除按钮”的显示方式，主要代码是 value="×"，即删除键是以符号 x 来表示的，点击 x 即可删除图片。




参考文献：[鼠标移动到图片出现按钮,点击删除图片](http://blog.csdn.net/kouwoo/article/details/43563155)



---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn