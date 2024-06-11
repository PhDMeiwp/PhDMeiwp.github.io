---
title: 如何用U盘安装Win7系统
date: 2017-09-06 19:52:44
categories: 
- 技术
- 电脑技术
tags: [电脑技术,U盘装系统]
---

---


> 总体分为两步，第一步：用UltraISO 制作U盘系统盘。第二步：用此U盘系统盘安装Win7系统。

# 第一步：用UltraISO 制作U盘系统盘 #

http://www.upantool.com/jiaocheng/disk/3692.html

<!-- more -->

**要求：**主板支持USB启动。U盘、移动硬盘容量大于ISO文件的大小。

**软件：**<font color=blue>[UltraISO点击可下载](http://www.baidu.com/s?ie=utf-8&f=3&rsv_bp=1&rsv_idx=1&tn=baidu&wd=ultraiso%E4%B8%8B%E8%BD%BD&oq=ultraiso%25E4%25B8%258B%25E8%25BD%25BD&rsv_pq=cc947746000269da&rsv_t=19eaIQ9KHqEa9A4pG2R5LjqY9kiYB6Guo2r0Sw1uYxqm7eEdte6Z%2BCeXa08&rqlang=cn&rsv_enter=0&prefixsug=ultraiso%25E4%25B8%258B%25E8%25BD%25BD&rsp=0) </font>

**步骤：**1、启动UltraISO。单击菜单栏上的文件－打开。打开所需的系统ISO文件。

![1.jpg](https://i.loli.net/2017/09/06/59afd5394cae0.jpg)

2、在左上角应该看到“可启动”字样。否则就不能用U盘、移动硬盘引导计算机启动。

![2.jpg](https://i.loli.net/2017/09/06/59afd539839ff.jpg)

3、将U盘、移动硬盘插入计算机。

4、单击菜单栏上的启动—写入硬盘映像。 选择需要写入的U盘，移动硬盘。写入模式选择USB－HDD+。
   然后单击“写入”。

   注意：此操作将格式化U盘、移动硬盘。请做好数据备份！

![3.jpg](https://i.loli.net/2017/09/06/59afd539959a5.jpg)

5、等待写入完成。

![4.jpg](https://i.loli.net/2017/09/06/59afd53996b29.jpg)

6、重新启动计算机。会有类似于 F12-Boot Menu 的字样。按下选择启动设备的对应键，选择U盘启动。

---

# 第二步：用此U盘系统盘安装Win7系统 #

https://www.zhihu.com/question/23042197

1\.查询自己电脑进入<font color=blue>[BIOS的快捷键](http://www.udashi.com/jc/2.html)，</font>将U盘设为第一启动设备。

（注：组装机根据主板找到快捷键，品牌机和笔记本根据品牌找到快捷键，可能有些品牌的台式机与笔记本快捷键不一样。）


2\.把制作好的U盘插入需要安装系统的电脑USB插口。

> 重启电脑后，按下BIOS的快捷键，进入 BIOS SETUP 界面，将“Hard Disk Boot Priority”的“First Boot Device”设置为U盘优先启动，比如“KingstonDataTraveler 2”，然后保存更改并再次重新启动电脑，即可进入U盘启动安装Win7系统。

http://www.udashi.com/jc/2.html

3\. 出现Windows 7安装界面，首先一次选择为中文（简体），选择好了点击下一步；

![11.png](https://i.loli.net/2017/09/06/59afdaf99872c.png)

4\. 点击安装

![12.png](https://i.loli.net/2017/09/06/59afdaf9b3e1a.png)

5\. 出现“安装程序正在启动...” 

![13.png](https://i.loli.net/2017/09/06/59afdaf9e3f61.png)

6\. 现在出现协议书，把“我接受许可条款”勾上；

![14.png](https://i.loli.net/2017/09/06/59afdaf94f604.png)

7\. 这里，我们选择“自定义（高级）”；

![15.jpg](https://i.loli.net/2017/09/06/59afdaf8a4e31.jpg)

8\. 这里选择第一个分区（之后想定义为系统盘C盘的分区），类型为系统，再点击下一步（在这之前我们可以<font color=red>格式化第一个分区，在“驱动器选项（高级）（A）”那里</font>）；

![16.jpg](https://i.loli.net/2017/09/06/59afdaf8a5acb.jpg)

硬盘分区的方法，一般C盘设为系统盘，D盘为软件安装盘，E盘为文件资料盘等。

9\. 正在安装的界面；这里需要一定的时间，过了一定的时间后；

![17.jpg](https://i.loli.net/2017/09/06/59afdaf8bbf88.jpg)

10\. 会提醒“安装程序正在启动服务”；

![18.jpg](https://i.loli.net/2017/09/06/59afdaf86f66f.jpg)

11\. 再提醒“重新启动您的计算机后安装过程将继续”，这里是自动运行；

![19.jpg](https://i.loli.net/2017/09/06/59afdaf859b8b.jpg)

12\. 等到电脑屏幕黑了，然后把U盘取出来，系统可能会自动重启多次；

13\. 然后出现“正在启动Windows”画面；

![20.jpg](https://i.loli.net/2017/09/06/59afdaf82ac3f.jpg)

14\.  到这个界面基本我们安装好了，这里输入你的PC名字，在点击下一步

![21.jpg](https://i.loli.net/2017/09/06/59afdfed55716.jpg)

15\. 跳过，不要输入密码，直接下一步；

![22.jpg](https://i.loli.net/2017/09/06/59afdfed94f73.jpg)

16\. 这里要输入秘钥，暂时不输入，直接点击下一步，到时用激活工具激活就可以了；

![23.jpg](https://i.loli.net/2017/09/06/59afdfed7216d.jpg)

17\. 这里我们选择“使用推荐设置”；

![24.png](https://i.loli.net/2017/09/06/59afdfedd9868.png)

18\. 调整时间和日期

![25.png](https://i.loli.net/2017/09/06/59afdfedcf1c9.png)

19\. 选择计算机网络，一般选择公共网络；

![26.jpg](https://i.loli.net/2017/09/06/59afdfedbe3d6.jpg)

20\. "Windows7旗舰版"正在启动；

![27.jpg](https://i.loli.net/2017/09/06/59afdfed73c0f.jpg)

21\. 然后就进入了Windows系统了，安装完成！

![28.jpg](https://i.loli.net/2017/09/06/59afdfed3a38f.jpg)


22\. 用激活工具激活Window系统，重启

下载地址：https://pan.baidu.com/s/1i5p3G49 

23\. 用<font color=blue>[驱动人生本地版](https://www.google.co.jp/search?q=%E9%A9%B1%E5%8A%A8%E4%BA%BA%E7%94%9F+%E6%9C%AC%E5%9C%B0%E7%89%88&oq=%E9%A9%B1%E5%8A%A8%E4%BA%BA%E7%94%9F+%E6%9C%AC%E5%9C%B0%E7%89%88&aqs=chrome..69i57j69i65.4898j0j4&sourceid=chrome&ie=UTF-8)，</font>完成所有重要驱动安装。







---

<span id="busuanzi_container_page_pv">
<已有 <span id="busuanzi_value_page_pv"></span> 次阅读>
</span>

---


由于本文作者水平有限，文中如有错误之处，欢迎大家批评指正！

① 本文仅代表作者个人观点，不代表任何其它立场，欢迎交流合作！

② 转载与分享请注明：本文源于 http://meiweiping.cn