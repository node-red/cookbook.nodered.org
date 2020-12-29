---
layout: default
title: Set a request header
slug:
  - label: http
    url: /#http-requests
  - set header
---

### Problem

You need to send an HTTP request with specific request headers.

### Solution

Set the `msg.headers` field to the field value pairs of the request headers you would like to include in the
message sent to the <code class="node">HTTP request</code> node.

#### Example

![](/images/http/set-request-header.png)

{% raw %}
~~~json
[{"id":"cb1dfcde.fd153","type":"function","z":"124f654c.7a7c6b","name":"set payload and headers","func":"msg.payload = \"data to post\";\nmsg.headers = {};\nmsg.headers['X-Auth-User'] = 'mike';\nmsg.headers['X-Auth-Key'] = 'fred-key';\n\nreturn msg;","outputs":1,"noerr":0,"initialize":"","finalize":"","x":275,"y":600,"wires":[["e44209e7.752698"]]},{"id":"dcf34aab.218928","type":"inject","z":"124f654c.7a7c6b","name":"","repeat":"","crontab":"","once":false,"topic":"","payload":"","payloadType":"date","x":85,"y":600,"wires":[["cb1dfcde.fd153"]]},{"id":"e44209e7.752698","type":"http request","z":"124f654c.7a7c6b","name":"post to HttpBin","method":"POST","ret":"obj","paytoqs":"ignore","url":"https://httpbin.org/post","tls":"","persist":false,"proxy":"","authType":"","x":485,"y":600,"wires":[["ee306582.f0dde8"]]},{"id":"ee306582.f0dde8","type":"debug","z":"124f654c.7a7c6b","name":"","active":true,"console":"false","complete":"false","x":655,"y":600,"wires":[]}]
~~~
{: .flow}
{% endraw %}

In this example we set the `X-Auth-User` and `X-Auth-Key` request headers to call public HttpBin post test service.

The code in the <code class="node">Function</code> node below adds these additional message
fields by adding a `msg.headers` object, and setting the header field/values in this object as shown.

{% raw %}
~~~text
msg.payload = "data to post";
msg.headers = {};
msg.headers['X-Auth-User'] = 'mike';
msg.headers['X-Auth-Key'] = 'fred-key';
return msg;
~~~
{: .javascript}
{% endraw %}

These can be seen by expanding the debug object headers twistie - as the test service echos back the request.
