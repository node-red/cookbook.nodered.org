---
layout: default
title: Access HTTP request headers
slug:
  - label: http
    url: /#http-endpoints
  - headers
---

### Problem

You want to access the HTTP headers sent in a request.

### Solution

Use the `msg.req.headers` property of the message sent by the <code class="node">HTTP In</code>
node to access the headers.

#### Example

![](/images/http/access-http-request-headers.png){:width="800px"}

{% raw %}
~~~json
[{"id":"c1460268.3eba","type":"http in","z":"3045204d.cfbae","name":"","url":"/hello-headers","method":"get","swaggerDoc":"","x":130,"y":380,"wires":[["24199456.dbe66c"]]},{"id":"24199456.dbe66c","type":"template","z":"3045204d.cfbae","name":"page","field":"payload","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"<html>\n    <head></head>\n    <body>\n        <h1>User agent: {{req.headers.user-agent}}</h1>\n    </body>\n</html>","x":310,"y":380,"wires":[["b3531892.4cace8"]]},{"id":"b3531892.4cace8","type":"http response","z":"3045204d.cfbae","name":"","x":450,"y":380,"wires":[]}]
~~~
{: .flow}
{% endraw %}

~~~text
[~]$ curl http://localhost:1880/hello-headers
<html>
    <head></head>
    <body>
        <h1>User agent: curl&#x2F;7.49.1</h1>
    </body>
</html>
~~~
{: .shell}

### Discussion

The `msg.req.headers` property is an object of key/value pairs for each request header.
The header names are all lower-cased regardless of how they appear in the request.
