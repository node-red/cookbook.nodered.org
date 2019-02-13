---
layout: default
title: Drop messages that have not changed value
---

### Problem

You want to drop a message if the value of its payload has not changed since the
last message. For example, you have a sensor sending the state of a switch at
regular intervals and you only want to know when the value has changed.


### Solution

Use the <code class="node">RBE</code> node (Report By Exception) to block messages
unless its value has changed.

#### Example

![](/images/basic/report-by-exception.png){:width="618px"}

{% raw %}
~~~json
[{"id":"9a55494.3de85b8","type":"comment","z":"84b79f91.7264e","name":"Trigger a flow when a message property changes value","info":"","x":280,"y":60,"wires":[]},{"id":"113f0bf.25877f4","type":"rbe","z":"84b79f91.7264e","name":"","func":"rbe","gap":"","start":"","inout":"out","property":"payload","x":310,"y":160,"wires":[["4157d0f5.11b66"]]},{"id":"601fa81a.504658","type":"inject","z":"84b79f91.7264e","name":"","topic":"","payload":"Alfa","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":150,"y":160,"wires":[["113f0bf.25877f4"]]},{"id":"25941272.33e5ee","type":"inject","z":"84b79f91.7264e","name":"","topic":"","payload":"Bravo","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":150,"y":220,"wires":[["113f0bf.25877f4"]]},{"id":"4157d0f5.11b66","type":"debug","z":"84b79f91.7264e","name":"Debug","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","x":460,"y":160,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The <code class="node">RBE</code> can be used to drop messages unless their value
has changed. This is useful for detecting changes.

If the property being checked is a number, the node can also be configured with
a threshold for how much the value must change for the message to be passed on.
