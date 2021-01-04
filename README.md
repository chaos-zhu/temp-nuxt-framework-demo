# docker部署nuxt项目demo

## 构建

`docker build --build-arg cur_env=uat -t imageName:Tag .`

## 后台启动

`docker run -d -p 8080:3000  IMAGE-ID/CONTAINER-ID`

## 所有容器

`docker ps -a`

## 查看容器日志

`docker logs CONTAINER`

## 未解决的问题

> 构建后如何自动运行镜像，删除上一版本容器？
