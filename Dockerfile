FROM node:12.14 as build

WORKDIR /usr/local/app/Art-Final

COPY ./ /usr/local/app/

RUN npm install

RUN npm run build



FROM nginx:latest

COPY ./dist/ /usr/share/nginx/html

COPY ./dist/assets /usr/share/nginx/html/assets

EXPOSE 80
