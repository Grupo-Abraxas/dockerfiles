const express = require('express')
const expressPlayground = require('graphql-playground-middleware-express').default

const app = express()

const API_HOST = process.env.API_HOST
const PORT = process.env.PORT

app.get('/', expressPlayground({ endpoint: API_HOST }))

app.listen(PORT)
