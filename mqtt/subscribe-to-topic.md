---
layout: default
title: Subscribe to a Topic
---

### Problem

You want to subscribe to messages on an MQTT topic.

### Solution

Use the <code class="node">MQTT Input</code> node to subscribe to messages sent to a topic or a topic pattern.

#### Example

![](/images/mqtt/mqtt-flow-005.png)

{% raw %}
~~~json
[{"id":"8024cb4.98c5238","type":"mqtt in","z":"eda2a949.74ea98","name":"","topic":"sensors/#","qos":"2","broker":"61de5090.0f5d9","x":240,"y":180,"wires":[["15d727dd.33e808"]]},{"id":"15d727dd.33e808","type":"debug","z":"eda2a949.74ea98","name":"","active":true,"console":"false","complete":"false","x":390,"y":180,"wires":[]},{"id":"61de5090.0f5d9","type":"mqtt-broker","z":"","broker":"localhost","port":"1883","clientid":"","usetls":false,"compatmode":true,"keepalive":"60","cleansession":true,"willTopic":"","willQos":"0","willPayload":"","birthTopic":"","birthQos":"0","birthPayload":""}]
~~~
{: .flow}
{% endraw %}

### Discussion

The <code class="node">MQTT Input</code> node with an associated <code class="node">MQTT Config</code> node connected to an MQTT broker can be used to subscribe to receive messages sent to a specific topic or MQTT topic pattern.  In the example we subscribe to all messages under the `sensors` topic level using the `sensors/#` pattern.
