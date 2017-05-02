FROM nginx:stable-alpine

RUN rm /etc/nginx/conf.d/*.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY unifi.conf /etc/nginx/conf.d

EXPOSE 80
