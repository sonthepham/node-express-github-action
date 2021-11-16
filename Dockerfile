FROM node:14-alpine AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY src src
COPY babel.config.js ./
RUN npm run build

FROM node:14-alpine
WORKDIR /usr/src/app
RUN chown node:node .
USER node
COPY package*.json ./
RUN npm ci
COPY --from=builder /usr/src/app/dist/ dist/
EXPOSE 8080 8888
ENTRYPOINT ["npm", "run"]
CMD ["serve"]
