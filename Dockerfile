# Docker环境声明，不存在则从dockerHub拉取
FROM node:12.18.4
# author
MAINTAINER chaoszhu
# 环境配置
ENV NODE_ENV=production
ENV HOST 0.0.0.0
# 创建app目录(镜像打包)
RUN mkdir -p /app
# 复制目录所有文件到docker
COPY . /app
# cd到/app
WORKDIR /app
# 镜像暴露的端口
EXPOSE 3000

# 国内环境下构建请把下面注释打开
# RUN npm config set registry https://registry.npm.taobao.org
# 安装依赖
RUN npm install
# 打包
RUN npm run build
# run
CMD ["npm", "start"]