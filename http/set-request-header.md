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
[{"id":"92272f91.20a43","type":"inject","z":"c9a81b70.8abed8","name":"","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"x":120,"y":760,"wires":[["af92df2f.3032e"]]},{"id":"64da113d.24a75","type":"http request","z":"c9a81b70.8abed8","name":"post to FRED","method":"POST","ret":"txt","url":"http://mike.fred.sensetecnic.com/api/test","tls":"","x":520,"y":760,"wires":[["31ab53be.5111dc"]]},{"id":"af92df2f.3032e","type":"function","z":"c9a81b70.8abed8","name":"set payload and headers","func":"msg.payload = \"data to post\";\nmsg.headers = {};\nmsg.headers['X-Auth-User'] = 'mike';\nmsg.headers['X-Auth-Key'] = 'fred-key';\n\nreturn msg;","outputs":1,"noerr":0,"x":310,"y":760,"wires":[["64da113d.24a75"]]},{"id":"31ab53be.5111dc","type":"debug","z":"c9a81b70.8abed8","name":"","active":true,"console":"false","complete":"false","x":690,"y":760,"wires":[]}]
~~~
{: .flow}
{% endraw %}

In this example we set the `X-Auth-User` and `X-Auth-Key` request headers to call a
private HTTP input node on the FRED Node-RED cloud service.

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
