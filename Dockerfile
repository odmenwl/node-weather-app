FROM node:alpine
ENV SERVER_HOST=0.0.0.0
ENV SERVER_PORT=5000

WORKDIR /usr/src/app

COPY package.json ./
COPY yarn.lock ./

RUN yarn install

COPY . .

EXPOSE 5000

CMD yarn run build && yarn run start:prod
