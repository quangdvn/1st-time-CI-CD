# Build phase
FROM node:alpine AS builder

WORKDIR /usr/app

COPY ./package.json ./

RUN yarn 

COPY ./ ./

RUN yarn build

# Run phase
FROM nginx

EXPOSE 80

COPY --from=builder /usr/app/build /usr/share/nginx/html


