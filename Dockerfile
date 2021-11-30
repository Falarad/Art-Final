FROM node:12.14 as build

WORKDIR /usr/local/app/Art-Final

COPY ./ /usr/local/app/

RUN npm install

RUN npm run build



FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=build /app/dist/angular-nginx-docker .

ENTRYPOINT ["nginx", "-g", "daemon off;"]

EXPOSE 80
