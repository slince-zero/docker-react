FROM node:14-alpine as builder

WORKDIR /app

COPY .npmrc .
COPY package.json .

RUN npm install
COPY . .

RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html