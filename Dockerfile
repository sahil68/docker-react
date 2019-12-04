#BUILD PHASE

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


#RUN PHASE

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

#NO need to start NGINX, as the base image will automatically start the ngix server. 