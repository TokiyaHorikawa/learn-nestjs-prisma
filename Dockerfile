# ローカルと合わせておく
FROM node:16.4.1-alpine

# 任意のtime zone設定にする
ENV TZ=Asia/Tokyo
RUN apk --no-cache add tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /app

COPY package.json .
COPY yarn.lock .

# RUN npm ci

EXPOSE 3000

ENTRYPOINT [ "npm", "run", "start:dev" ]
