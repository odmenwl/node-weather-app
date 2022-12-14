FROM node:alpine
ENV APP_PORT=0.0.0.
ENV APP_HOST=5000

WORKDIR /usr/src/app

COPY package.json ./
COPY yarn.lock ./

RUN yarn install

COPY . .

EXPOSE 5000

CMD yarn run start
