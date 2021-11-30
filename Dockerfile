FROM node:12.14 as build

WORKDIR /usr/local/app/Art-Final

COPY ./ /usr/local/app/

RUN npm install

RUN npm run build



FROM nginx:latest

COPY /usr/local/app/dist/artFinal/ /usr/share/nginx/html

VOLUME /usr/local/app/dist/assets /usr/share/nginx/html/assets

EXPOSE 80
