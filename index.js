import express from 'express'

const PORT = process.env.port || 3000

const app = express();

app.get('/', (req, res) => {
    res.json({
        message: 'Hello from a container',
        service: "Hello-node",
        pod: process.env.POD_NAME || 'unknown',
        time: new Date().toISOString()
    })
})


app.get('/readyz', (req, res) => {
    res.status(200).send('ready')
})

app.get('/healthz', (req, res) => {
    res.status(200).send('ok')
})

app.listen(PORT, () => {
    console.log('Example App Is listing at ' + PORT)
})