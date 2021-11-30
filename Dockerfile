FROM node:12.14 as build

WORKDIR /usr/local/app/Art-Final

COPY ./ /usr/local/app/

RUN npm install

RUN npm run build

COPY ./src/assets /usr/local/app/assets

FROM nginx:latest

COPY --from=build /usr/local/app/dist/artFinal /usr/share/nginx/html

EXPOSE 80
