from node:current-alpine

COPY . /app

WORKDIR /app

ENV PORT 3000

RUN yarn install

ENTRYPOINT ["node", "index.js"]
