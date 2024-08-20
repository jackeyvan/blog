# 博客后端框架

基于Dart团队的后端轻量框架shelf搭建，适用于Github的自建博客系统。


### 本地启动服务

- 在bin/main.dart文件，运行文件即可。

### shelf_router注解自动生成代码

- 更改路由名称后，需要自动生成代码。

      dart run build_runner build

### Dart服务部署

这里使用三方的Dart服务部署工具Globe，部署十分的简单。

- 将工具加载到本地

        dart pub global activate globe_cli

- 登录到工具后台

        globe login

- 部署

  部署到开发环境：`globe deploy`

  部署到生产环境：`globe deploy --prod`

