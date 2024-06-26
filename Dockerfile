# syntax=docker/dockerfile:1

FROM node:14 as base

WORKDIR /app
COPY ["package.json", "package-lock.json*", "./"]

FROM base as test
RUN npm ci
COPY . .
RUN npm test

FROM base as prod
RUN npm ci --production
COPY . .
CMD ["node", "server.js"]