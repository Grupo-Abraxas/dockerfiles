from node:8.15.0-alpine

COPY . /app

WORKDIR /app

ENV PORT 3000

RUN yarn install

ENTRYPOINT ["node", "index.js"]