---
layout: default
title: Post raw data to a flow
slug:
  - label: http
    url: /#http-endpoints
  - post data
---

### Problem

You want to post raw text data to a flow.

### Solution

Use the <code class="node">HTTP In</code> node to listen for POST requests that
have their `Content-Type` set to `text/plain` and access the posted data as `msg.payload`.

#### Example

![](/images/http/post-raw-data-to-a-flow.png)

{% raw %}
~~~json
[{"id":"3e1c5107.c1e3ae","type":"http in","z":"3045204d.cfbae","name":"","url":"/hello-raw","method":"post","swaggerDoc":"","x":120,"y":920,"wires":[["cf679478.309868"]]},{"id":"cf679478.309868","type":"template","z":"3045204d.cfbae","name":"page","field":"payload","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"<html>\n    <head></head>\n    <body>\n        <h1>Hello {{ payload }}!</h1>\n    </body>\n</html>","x":290,"y":920,"wires":[["f3c1a3f0.0c3e6"]]},{"id":"f3c1a3f0.0c3e6","type":"http response","z":"3045204d.cfbae","name":"","x":430,"y":920,"wires":[]}]
~~~
{: .flow}
{% endraw %}

~~~text
[~]$ curl -X POST -d 'Nick' -H "Content-type: text/plain" http://localhost:1880/hello-raw
<html>
    <head></head>
    <body>
        <h1>Hello Nick!</h1>
    </body>
</html>
~~~
{: .shell}

### Discussion

When the <code class="node">HTTP In</code> node receives a request with the `Content-Type`
header set to `text/plain` it makes the body available as `msg.payload`:

~~~javascript
var name = msg.payload;
~~~
