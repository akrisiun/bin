// npm i os express applicationinsights

const express = require('express')
const process = require('process')

const app = express()
const os = require('os');
const port = process.env.PORT || 3000;

// console.log(JSON.stringify(process.env));
console.log("APPINSIGHTS_INSTRUMENTATIONKEY", process.env.APPINSIGHTS_INSTRUMENTATIONKEY);

const AppInsights = require('applicationinsights');

AppInsights.setup(process.env.APPINSIGHTS_INSTRUMENTATIONKEY)
.setAutoDependencyCorrelation(true)
.setAutoCollectRequests(true)
.setAutoCollectPerformance(true, true)
.setAutoCollectExceptions(true)
.setAutoCollectDependencies(true)
.setAutoCollectConsole(true)
.setUseDiskRetryCaching(true)
.setSendLiveMetrics(false)
.setDistributedTracingMode(AppInsights.DistributedTracingModes.AI)
.start();

const AppInsightsClient = AppInsights.defaultClient;

app.get('/trace', (req, res) => {

    const clientIP = req.headers['x-forwarded-for'] || req.headers['host'];
    const msg = `trace route ${os.hostname()} ${clientIP} ${new Date()}`;

    // console.log("headers", req.headers);
    console.log(msg);

    AppInsightsClient.trackPageView({ name: req.hostname });
    AppInsightsClient.trackTrace({ message: msg})
    AppInsightsClient.flush();

    res.send(`${msg}`)
})

app.get('/', function (req, res) {

    const clientIP = req.headers['x-forwarded-for'] || req.headers['host'];
    const msg = `root route ${os.hostname()} ${clientIP} ${new Date()}`

    console.log(msg)
    res.send(msg)
})

app.listen(port, function () {
    console.log(`Hello world app listening on port ${port} ! ${os.hostname()}`)
})
