#build phase

FROM node:19-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build


# /app/build 



### RUN phase

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
