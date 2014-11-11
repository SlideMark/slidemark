 概要

markdown式的ppt在线编辑分享平台

## 主要功能

（第一阶段需要实现的部分）

### 用户注册

* 用户注册
* 用户登录
* facebook登录（option）
* 用户个人信息编辑（option）

### 浏览功能 

* ppt的一览
* 单个ppt浏览（重点）
* ppt的分类浏览

### 检索功能

* ppt标题关键字的检索

### 编辑功能

* 个人ppt增删改查，加上分类标签（重点）
* 在线编辑器（自动保存option）

### 分享功能

* ppt链接的二维码自动生成（重点）
* weixin，facebook，linkedin分享（重点）
* weixin公众号（option）

## 架构

* 域名: www.slidemark.net
* web server: apache ? nginx?
* ruby adapter: passenger ? unicorn ?
* language & platform: ruby on rails
* test: rspec
* DB: mysql
	- 单DB，无shard，无主从
* 文件存储: 暂定本地磁盘
	- 203.189.97.69
* cache: memcached
	- 203.189.97.69
* delopy: rsync ? capistrano ?
* CI: jenkins
* chat: hipchat
* source control: git + github + pull-req
* 开发方式:
	- 本地开发
	- 203.189.97.69的dev版本: dev.slidemark.net

## 工具/gem

* mysql2 db连接
* dalli memcached连接
* kaminari 分页
* cancan 访问控制
* whenever 定时任务
