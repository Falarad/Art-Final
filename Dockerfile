FROM node:12.14 as build

WORKDIR /usr/local/app/Art-Final

COPY ./ /usr/local/app/

RUN npm install

RUN npm run build



FROM nginx:latest

COPY --from=build /usr/local/app/dist/artFinal/ /usr/share/nginx/html

COPY  ./src/assets/the_float__2-removebg-preview.png /usr/share/nginx/html/assets/
COPY  ./src/assets/'The American Reality.mp4' /usr/share/nginx/html/assets/
COPY  ./src/assets/'The American Dream.mp4' /usr/share/nginx/html/assets/
COPY  ./src/assets/'FIXED the float! with transparent bg.png' /usr/share/nginx/html/assets/

EXPOSE 80
