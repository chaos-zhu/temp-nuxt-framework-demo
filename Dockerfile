# 环境声明，不存在则从dockerHub拉取
FROM node:12.18.4
MAINTAINER chaoszhu
# default_value默认为 '', 可在构建时指定 --build-arg cur_env=dev
ARG cur_env=default_value
ENV CUR_ENV=$cur_env
ENV NODE_ENV=production
ENV HOST 0.0.0.0
RUN mkdir /app
COPY package.json /app
WORKDIR /app
RUN npm install
# copy当前构建上下文目录下所有文件到镜像/app文件夹下
COPY . /app
# 镜像暴露的端口，同nuxt.config.js中配置的
EXPOSE 3000
RUN npm run build
CMD ["npm", "start"]