FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN yarn run build

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html