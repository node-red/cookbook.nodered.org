---
layout: default
title: Handle query parameters passed to an HTTP endpoint
slug:
  - label: http
    url: /#http-endpoints
  - query parameters
---

### Problem

You want to access the query parameters passed to an HTTP endpoint, such as:

    http://example.com/hello-query?name=Nick

### Solution

Use the `msg.req.query` property of the message sent by the <code class="node">HTTP In</code>
node to access the parameters.

#### Example

![](/images/http/handle-query-parameters.png)

{% raw %}
~~~json
[{"id":"b34dd1af.4cb23","type":"template","z":"3045204d.cfbae","name":"page","field":"payload","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"<html>\n    <head></head>\n    <body>\n        <h1>Hello {{req.query.name}}!</h1>\n    </body>\n</html>","x":290,"y":180,"wires":[["b828f6a6.47d708"]]},{"id":"1052941d.efad6c","type":"http in","z":"3045204d.cfbae","name":"","url":"/hello-query","method":"get","swaggerDoc":"","x":120,"y":180,"wires":[["b34dd1af.4cb23"]]},{"id":"b828f6a6.47d708","type":"http response","z":"3045204d.cfbae","name":"","x":430,"y":180,"wires":[]}]
~~~
{: .flow}
{% endraw %}

~~~text
[~]$ curl http://localhost:1880/hello-query?name=Nick
<html>
    <head></head>
    <body>
        <h1>Hello Nick!</h1>
    </body>
</html>
~~~
{: .shell}

### Discussion

The `msg.req.query` property is an object of key/value pairs for each query parameter.

In the above example, a request to `/hello-query?name=Nick&colour=blue` results in the property
containing:

~~~json
{
    "name": "Nick",
    "colour": "blue"
}
~~~

If there are multiple query parameters with the same name, they will be provided
as an array. For example, `/hello-query?colour=blue&colour=red`:

~~~json
{
    "colour": ["blue","red"]
}
~~~
