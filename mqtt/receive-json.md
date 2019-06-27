---
layout: default
title: Receive a parsed JSON message
slug:
  - label: mqtt
    url: /#mqtt
  - subscribe json
---

### Problem

You want to receive a parsed JSON message from an MQTT broker.

### Solution

Use the <code class="node">MQTT Input</code> node and a <code class="node">JSON node</code> to receive a parsed JSON message.

#### Example

![](/images/mqtt/receive-json.png)

{% raw %}
~~~json
[{"id":"8024cb4.98c5238","type":"mqtt in","z":"eda2a949.74ea98","name":"","topic":"sensors/#","qos":"2","broker":"61de5090.0f5d9","x":260,"y":580,"wires":[["b5098b7f.2361d8"]]},{"id":"15d727dd.33e808","type":"debug","z":"eda2a949.74ea98","name":"","active":true,"console":"false","complete":"false","x":530,"y":580,"wires":[]},{"id":"2aed678c.3de738","type":"mqtt out","z":"eda2a949.74ea98","name":"","topic":"sensors/livingroom/temp","qos":"","retain":"false","broker":"61de5090.0f5d9","x":310,"y":520,"wires":[]},{"id":"3b613a69.a247c6","type":"inject","z":"eda2a949.74ea98","name":"temp json","topic":"","payload":"{\"sensor_id\":1234,\"temperature\":13}","payloadType":"json","repeat":"","crontab":"","once":false,"x":120,"y":520,"wires":[["2aed678c.3de738"]]},{"id":"b5098b7f.2361d8","type":"json","z":"eda2a949.74ea98","name":"","pretty":false,"x":390,"y":580,"wires":[["15d727dd.33e808"]]},{"id":"61de5090.0f5d9","type":"mqtt-broker","z":"","broker":"localhost","port":"1883","clientid":"","usetls":false,"compatmode":true,"keepalive":"60","cleansession":true,"willTopic":"","willQos":"0","willPayload":"","birthTopic":"","birthQos":"0","birthPayload":""}]
~~~
{: .flow}
{% endraw %}

### Discussion

The payload of an <code class="node">MQTT Input</code> node is a string unless it was detected as a binary buffer.  To parse the JSON string and convert it to a JavaScript Object, use the <code class="node">JSON</code> node.

Newer versions of the MQTT node (Node-RED version 0.19+) now have a select option to choose the required output format so the JSON node may no longer be required.
