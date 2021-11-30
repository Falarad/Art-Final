FROM node:12.14 as build

WORKDIR /usr/local/app

COPY ./ /usr/local/app/

RUN npm install

RUN npm run build

COPY /usr/local/app/Art-Final/src/artFinal/assets /usr/local/app/artFinal/assets

FROM nginx:latest

COPY --from=build /usr/local/app/dist/artFinal /usr/share/nginx/html

EXPOSE 80
