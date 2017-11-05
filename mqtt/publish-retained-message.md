---
layout: default
title: Publish to a Topic
---

### Problem

You want to publish a retained message to an MQTT topic on a broker.

### Solution

Set the `Retain` option to `true` in the <code class="node">MQTT Output</code> node configuration dialog, or set the `retain` message property to `true` in the message sent to the output node.

#### Example

![](/images/mqtt/mqtt-flow-004.png)

{% raw %}
~~~json
[{"id":"4a7dc819.3aa6f8","type":"mqtt out","z":"eda2a949.74ea98","name":"","topic":"sensors/livingroom/temp","qos":"","retain":"true","broker":"61de5090.0f5d9","x":430,"y":420,"wires":[]},{"id":"fb7b873.c391878","type":"inject","z":"eda2a949.74ea98","name":"temperature","topic":"","payload":"22","payloadType":"num","repeat":"","crontab":"","once":false,"x":230,"y":420,"wires":[["4a7dc819.3aa6f8"]]},{"id":"61de5090.0f5d9","type":"mqtt-broker","z":"","broker":"localhost","port":"1883","clientid":"","usetls":false,"compatmode":true,"keepalive":"60","cleansession":true,"willTopic":"","willQos":"0","willPayload":"","birthTopic":"","birthQos":"0","birthPayload":""}]
~~~
{: .flow}
{% endraw %}

### Discussion

Once you have sent a retained message to a topic, all subscribers will receive that message when they subscribe.  In Node-RED this occurs when an <code class="node">MQTT Input</code> node is deployed.  To clear a previously retained topic from the broker, send a blank message to that topic with the retain flag set.