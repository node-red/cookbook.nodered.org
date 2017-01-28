---
layout: default
title: Get a parsed JSON response
---

### Problem

You want to get response in JSON object format.

### Solution

Use the <code class="node">JSON</code> node to parse a JSON string to a javascript object.

#### Example

![](/images/http/http-flow-015.png)

{% raw %}
~~~json
[{"id":"ab909d92.672c4","type":"inject","z":"4b00f413.ccfdcc","name":"","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"x":140,"y":320,"wires":[["23e0887a.d08028"]]},{"id":"23e0887a.d08028","type":"http request","z":"4b00f413.ccfdcc","name":"","method":"GET","ret":"txt","url":"http://httpbin.org/ip","tls":"","x":290,"y":320,"wires":[["d996d75d.46faf8","35a4e1e6.32917e"]]},{"id":"bb5fdd7a.cdcdb","type":"debug","z":"4b00f413.ccfdcc","name":"","active":true,"console":"false","complete":"payload","x":590,"y":320,"wires":[]},{"id":"d996d75d.46faf8","type":"json","z":"4b00f413.ccfdcc","name":"","x":450,"y":320,"wires":[["bb5fdd7a.cdcdb"]]},{"id":"35a4e1e6.32917e","type":"debug","z":"4b00f413.ccfdcc","name":"","active":true,"console":"false","complete":"payload","x":450,"y":280,"wires":[]}]
~~~
{: .flow}
{% endraw %}

The <code class="node">Inject</code> node triggers the <code class="node">HTTP request</code> node to send a GET request to

{% raw %}
~~~text
http://httpbin.org/ip
~~~
{% endraw %}

and return your IP address as {"origin":XXX.XXX.XXX.XXX} in string format. The <code class="node">JSON</code> easily converts the JSON string output to a JSON object output. The two <code class="node">debug</code> is there to show you how the output message type is changed.

As you can see, the output from the <code class="node">HTTP request</code> node is string:

![](/images/http/http-flow-016.png)

And the output after the <code class="node">JSON</node> node is in object format.

![](/images/http/http-flow-017.png)

#### Discussion

The <code class="node">JSON</node> node is a simple but useful tool to quickly convert JSON string format to object. Once it is converted to object output, you may use other core nodes like the <code class="node">change</node> node to manipulate the JSON object elements.
