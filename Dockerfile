FROM node:9.6.1 as builder
RUN mkdir /usr/srv/app
WORKDIR /usr/srv/app
ENV PATH /usr/srv/app/node_modules/.bin:$PATH
COPY . /usr/srv/app
RUN npm install
RUN npm run build:prod

# production environment
FROM nginx:1.13.9-alpine
RUN rm -rf /etc/nginx/conf.d
RUN mkdir -p /etc/nginx/conf.d
COPY ./default.conf /etc/nginx/conf.d/
COPY --from=builder /usr/srv/app/dist/caprover-angular-app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
