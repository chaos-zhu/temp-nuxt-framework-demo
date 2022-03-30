
# Docker环境声明，不存在则从dockerHub拉取
FROM node:12.18.4
# author
MAINTAINER chaoszhu
# 配置容器的系统环境变量: default_value默认为 '', 可在构建时指定 --build-arg cur_env=dev
# 构建时可传递
ARG cur_env=default_value
ENV CUR_ENV=$cur_env
# 或者直接写死
ENV NODE_ENV production
ENV HOST 0.0.0.0

# 该阶段容器运行时 CMD 命令会基于该目录
WORKDIR /app

# 复制package.json到镜像根目录
COPY package.json /app
# 锁定依赖
COPY package-lock.json /app

# 设置taobao源
RUN npm config set registry https://registry.npm.taobao.org

# 安装依赖
RUN npm install

# 复制项目目录所有文件到工作目录
COPY . /app

# 打包
RUN npm run build

# 镜像暴露的端口（同nuxt.config.js配置的端口，默认3000）
EXPOSE 3000

# docker run 才跑的命令
CMD ["npm", "start"]
