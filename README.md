# thymelte

## 项目简介
这是一个基于Spring Boot+AdminLTE+Thymeleaf的管理端项目，目的是简便管理端的开发。
## 功能列表
- 登录页面：
1. 4种登录方式，用户名+密码，手机号+密码，邮箱+密码，app扫码；
2. 验证码；
- 管理页面：使用Thymeleaf将AdminLTE页面拆分成多个组件，降低耦合；
- 日志保存到文件并按日归档；
- Druid监控功能。访问[http://localhost:8090/druid/index.html](http://localhost:8090/druid/index.html)，用户名druid，密码12345678。

## 截图
![账号密码登录](screenshots/2018-04-22_030148.png)

![扫码登录](screenshots/2018-04-22_030158.png)

![主页面](screenshots/2018-04-22_030226.png)

## 使用流程
1. 建表  
请参照`oauthserver`模块的说明文档，执行建表语句。  
`oauthserver`项目地址：
- [gitee](https://gitee.com/jeesun/oauthserver)
- [github](https://github.com/jeesun/oauthserver)