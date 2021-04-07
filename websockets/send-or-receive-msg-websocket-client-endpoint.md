---
layout: default
title: Send and receive messages to websocket client endpoint
---

### Problem

You want to send and receive messages using the websocket client endpoint, which means, you need to send data with some static
content, such as a string, to a websocket server and you, want to also receive the data from the webseocket server.

### Solution

Use the <code class="node">WEBSOCKET In</code> node to connect to a [public websocket server](https://www.websocket.org/echo.html){: new_window} and send the data to it , an <code class="node">Inject</code> node to include the static content, and a
<code class="node">WEBSOCKET out</code> node to connect to the [public websocket server](https://www.websocket.org/echo.html){: new_window} and receive the data from it.

#### Example

![](/images/websockets/websockets-flow-001.png)

{% raw %}
~~~json
[{"id":"2ee67bcf.e9ec74","type":"websocket out","z":"9330addb.1f80a8","name":"WS Echo Server","server":"","client":"ddf9ced0.198cd8","x":359.5,"y":142,"wires":[]},{"id":"4ad89394.6cb89c","type":"inject","z":"9330addb.1f80a8","name":"Say Hello","topic":"","payload":"Hello websockets","payloadType":"str","repeat":"","crontab":"","once":false,"x":150.5,"y":117,"wires":[["2ee67bcf.e9ec74"]]},{"id":"ddf9ced0.198cd8","type":"websocket-client","z":"","path":"ws://echo.websocket.org","wholemsg":"false"}]
[{"id":"73d7301b.92abc","type":"debug","z":"9330addb.1f80a8","name":"debug","active":true,"console":"false","complete":"payload","x":324.5,"y":251,"wires":[]},{"id":"92491c57.ff3888","type":"websocket in","z":"9330addb.1f80a8","name":"WS Echo Server","server":"","client":"ddf9ced0.198cd8","x":150.5,"y":217,"wires":[["73d7301b.92abc"]]},{"id":"ddf9ced0.198cd8","type":"websocket-client","z":"","path":"ws://echo.websocket.org","wholemsg":"false"}]
~~~
{: .flow}
{% endraw %}

The <code class="node">Inject</code> node generates a string that is to be sent to the public websocket server.

The output in the debug panel will look as follows:

{% raw %}
~~~text
"Hello websockets"
~~~
{% endraw %}

### Discussion

The <code class="node">WEBSOCKET In</code> and <code class="node">WEBSOCKET Out</code>
pair of nodes can be used for TCP based communication between the server and the client.

The <code class="node">WEBSOCKET In</code> and <code class="node">WEBSOCKET Out</code> nodes can be used in a server mode when they are configured to `Listen on` and can be used as a client when they are configured to `Connect to` a websocket server.

You can configure the <code class="node">WEBSOCKET In</code> and <code class="node">WEBSOCKET Out</code> nodes to send or receive only the payload by selecting the `Send/Receive payload` option. You can also send the entire message object as a JSON string by selecting `Send/Receive entire message`.
