---
title: Hello World
date: 2024-11-10 18:32:00
author: abba01001
categories: 杂七杂八
tags:
  - 构建
  - Git
  - Hexo
  - Cos
---
<div style="text-align: center; font-size: 40px; font-weight: bold;">
  Hello World!
</div>
## 前言



忙活了两天，终于把丢失的博客给搭好了，并构建了一键自动化推送博客的工具，实力也是肉眼可见的变强了。哈哈哈哈哈哈
早在一年前，就已经有搭博客的想法了，当时兴冲冲的买了一个域名，想着搭个博客记录下自己平时学习的，可搭完没多久，就放弃了。。。

哈哈哈哈哈哈哈哈哈，真是三天打鱼两天晒网。

这次也是下定决心，开始好好记录自己的博客，忙活了两天，刚开始还忘记了这个博客要怎么用来着。

下面总结一下这两天搭博客的旅程。

## 搭建博客之旅

### 1.构建本地博客

网上下载安装Node、Git(Git安装自行百度，安装好之后需要配好环境，不然初始化不了博客)

cmd输入命令进行安装hexo

```node
npm install hexo
```



![](https://abab01001-1318826377.cos.ap-guangzhou.myqcloud.com/BlogData/Image/202411101817724.png)

初始化博客

![](https://abab01001-1318826377.cos.ap-guangzhou.myqcloud.com/BlogData/Image/202411101817734.png)

博客目录结构

![](https://abab01001-1318826377.cos.ap-guangzhou.myqcloud.com/BlogData/Image/202411101817638.png)

安装博客所需模块

```
在博客目录下cmd执行npm install
```

部署到本地

```
在博客目录下cmd执行hexo server
```

然后在浏览器输入http://localhost:4000/打开刚刚搭建的博客网站。至此就完成了一个博客的搭建

![](https://abab01001-1318826377.cos.ap-guangzhou.myqcloud.com/BlogData/Image/202411101817497.png)

### 2.将博客部署到GitHub

在github里创建一个=========用户名.github.io的仓库
![](https://abab01001-1318826377.cos.ap-guangzhou.myqcloud.com/BlogData/Image/202411112120698.png)

然后再刚刚初始化的博客目录下执行

```hexo
hexo g
```



![](C:\Users\Administrator\Pictures\BlogImage\202411112125101.png)

生成public文件夹，public文件夹里的就时静态网站文件。


有空记录下===

### 3.将博客网站部署到服务器

### 4.简化操作推送博客网站

有空记录下===

### 5.写博客工具

### 6.构建腾讯云Cos图床

### 7.给博客网站换皮肤

## 总结

今天先写到这了，有时间在补上去~

fighting!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
