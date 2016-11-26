---
layout: default
title: Handle url parameters in an HTTP endpoint
---

### Problem

You want to create a single HTTP endpoint that can handle requests where parts
of the path are set per-request.

For example, a single endpoint that can handle requests to both:

    http://example.com/hello-param/Nick
    http://example.com/hello-param/Dave


### Solution

Use named path parameters in your <code class="node">HTTP In</code> node's `path`
property and then access the specific value provided in a request using the
`req.params` property of the message.

![](/images/http/http-flow-003.png)

    [{"id":"ce53954b.31ac68","type":"http response","z":"3045204d.cfbae","name":"","x":490,"y":280,"wires":[]},{"id":"288a7c0.fd77584","type":"template","z":"3045204d.cfbae","name":"page","field":"payload","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"<html>\n    <head></head>\n    <body>\n        <h1>Hello {{req.params.name}}!</h1>\n    </body>\n</html>","x":350,"y":280,"wires":[["ce53954b.31ac68"]]},{"id":"7665c67d.899a38","type":"http in","z":"3045204d.cfbae","name":"","url":"/hello-param/:name","method":"get","swaggerDoc":"","x":150,"y":280,"wires":[["288a7c0.fd77584"]]}]

### Discussion

Named path parameters in the `path` property can be used to identify parts of the path
that can vary between requests.

The `msg.req.params` property is an object of key/value pairs for each path parameter.

In the above example, the node is configured with a path of `/hello-params/:name`,
so a request to `/hello-param/Nick` results in the message property containing:

    {
        name: "Nick"
    }
