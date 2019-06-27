---
layout: default
title: Create an HTTP Endpoint
slug:
  - label: http
    url: /#http-endpoints
  - create endpoint
---

### Problem

You want to create an HTTP endpoint that responds to GET requests with some static
content, such as an HTML page or CSS stylesheet.

### Solution

Use the <code class="node">HTTP In</code> node to listen for requests, a
<code class="node">Template</code> node to include the static content, and an
<code class="node">HTTP Response</code> node to reply to the request.

#### Example

![](/images/http/create-an-http-endpoint.png)

{% raw %}
~~~json
[{"id":"59ff2a1.fa600d4","type":"http in","z":"3045204d.cfbae","name":"","url":"/hello","method":"get","swaggerDoc":"","x":100,"y":80,"wires":[["54c1e70d.ab3e18"]]},{"id":"54c1e70d.ab3e18","type":"template","z":"3045204d.cfbae","name":"page","field":"payload","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"<html>\n    <head></head>\n    <body>\n        <h1>Hello World!</h1>\n    </body>\n</html>","x":250,"y":80,"wires":[["266c286f.d993d8"]]},{"id":"266c286f.d993d8","type":"http response","z":"3045204d.cfbae","name":"","x":390,"y":80,"wires":[]}]
~~~
{: .flow}
{% endraw %}

~~~text
[~]$ curl http://localhost:1880/hello
<html>
    <head></head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
~~~
{: .shell}

### Discussion

The <code class="node">HTTP In</code> and <code class="node">HTTP Response</code>
pair of nodes are the starting point for all HTTP endpoints you create.

Any flow that starts with an <code class="node">HTTP In</code> node must have a
path to an <code class="node">HTTP Response</code> node otherwise requests will
eventually timeout.

The <code class="node">HTTP Response</code> node uses the `payload` property of
messages it receives as the body of the response. Other properties can be used to
further customize the response - they are covered in other recipes.

The <code class="node">Template</code> node provides a convenient way to embed
a body of content into a flow. It may be desirable to maintain such static content
outside of the flow.
