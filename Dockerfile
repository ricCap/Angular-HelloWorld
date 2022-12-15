FROM node:16-alpine as builder
COPY . build
WORKDIR build
RUN npm ci && npm run build

FROM nginx:1.15
COPY --from=builder /build/dist/angular-hello-world /usr/share/nginx/html
COPY --from=builder /build/nginx.conf /etc/nginx/conf.d/default.conf
