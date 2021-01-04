# Docker环境声明，不存在则从dockerHub拉取
FROM node:12.18.4
# author
MAINTAINER chaoszhu
# 环境配置
# default_value默认为 ''
ARG cur_env=default_value
ENV CUR_ENV=$cur_env
ENV NODE_ENV=production
ENV HOST 0.0.0.0

# 创建app目录(镜像打包)
RUN mkdir /app
# 复制目录package.json到docker
COPY ./package.json /app
# 安装依赖
RUN npm install
# cd到/app
WORKDIR /app
# 复制目录所有文件到docker
COPY . /app

# 镜像暴露的端口
EXPOSE 3000

# 国内环境下构建请把下面注释打开
# RUN npm config set registry https://registry.npm.taobao.org
# 打包
RUN npm run build
# run
CMD ["npm", "start"]

# 构建
# docker build --build-arg cur_env=uat -t temp-nuxt-demo:1.2 .

# 启动命令
# docker run -d -p 8080:3000 --build-arg cur_env=uat  temp-nuxt-demo:1.0

# 运行的镜像
# docker ps -a
# 日志
# docker logs CONTAINER【运行中镜像的日志】