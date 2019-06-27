---
layout: default
title: Serve JSON content
slug:
  - label: http
    url: /#http-endpoints
  - serve json
---

### Problem

You want to respond to an HTTP request with JSON data.

### Solution

Set the `content-type` of the response to `application/json` using the `msg.headers`
object.

#### Example

![](/images/http/serve-json-content.png)

{% raw %}
~~~json
[{"id":"c8107088.37ef9","type":"http in","z":"3045204d.cfbae","name":"","url":"/hello-json","method":"get","swaggerDoc":"","x":120,"y":620,"wires":[["4e8237da.b17dc8"]]},{"id":"4e8237da.b17dc8","type":"template","z":"3045204d.cfbae","name":"page","field":"payload","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"{ \"Hello\": \"World\" }","x":290,"y":620,"wires":[["65401623.9abfe8"]]},{"id":"65401623.9abfe8","type":"change","z":"3045204d.cfbae","name":"Set Headers","rules":[{"t":"set","p":"headers","pt":"msg","to":"{}","tot":"json"},{"t":"set","p":"headers.content-type","pt":"msg","to":"application/json","tot":"str"}],"action":"","property":"","from":"","to":"","reg":false,"x":450,"y":620,"wires":[["f7d3e35a.082c2"]]},{"id":"f7d3e35a.082c2","type":"http response","z":"3045204d.cfbae","name":"","x":610,"y":620,"wires":[]}]
~~~
{: .flow}
{% endraw %}

~~~text
[~]$ curl -i http://localhost:1880/hello-json
HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 20
ETag: W/"14-jgfjeX8FTECC4q5nXp6n5g"
Date: Sat, 26 Nov 2016 23:07:50 GMT
Connection: keep-alive

{ "Hello": "World" }
~~~
{: .shell}

### Discussion

The HTTP headers returned in the response can be set using the `msg.headers`
property. It should be an object of key/value pairs for each header.

To return well-formed JSON, the `Content-Type` header should be set to
`application/json` so the receiver knows to handle it as JSON data.
