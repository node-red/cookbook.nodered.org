---
layout: default
title: Get binary response
slug:
  - label: http
    url: /#http-requests
  - binary
---

### Problem

You want to get a binary HTTP response from an HTTP request.

### Solution

The <code class="node">HTTP Request</code> node will return a the body of a response in the `msg.payload` as a string by default.
Change the `Return` configuration of this node to `a binary buffer` to return the response as a binary buffer in the `msg.payload`.

#### Example

![](/images/http/get-binary-response.png){:width="556px"}

{% raw %}
~~~json
[{"id":"871ee927.0d69c8","type":"inject","z":"c9a81b70.8abed8","name":"","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"x":240,"y":660,"wires":[["8ea4e52a.03d678"]]},{"id":"8ea4e52a.03d678","type":"http request","z":"c9a81b70.8abed8","name":"binary http request","method":"GET","ret":"bin","url":"http://localhost:1880/binary","tls":"","x":410,"y":660,"wires":[["70309d0c.4dc504"]]},{"id":"70309d0c.4dc504","type":"debug","z":"c9a81b70.8abed8","name":"","active":true,"console":"false","complete":"false","x":590,"y":660,"wires":[]}]
~~~
{: .flow}
{% endraw %}

We have modified the flow from the [Set the URL of a Request URL recipe](set-request-url.html) by changing the
<code class="node">HTTP Request</code> node `Return` configuration to `a binary buffer`.  The <code class="node">Debug</code> node
will display the payload as a binary buffer such as:

{% raw %}
~~~text
[ 80, 75, 3, 4, 20, 0, 6, 0, 8, 0 … ]
~~~
{% endraw %}
