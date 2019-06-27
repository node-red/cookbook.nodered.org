---
layout: default
title: Drop messages that have not changed value
slug:
  - label: flow control
    url: /#flow-control
  - rbe
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
[{"id":"6079638d.df403c","type":"inject","z":"ac14500e.2c57d","name":"","topic":"","payload":"0","payloadType":"num","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":90,"y":1500,"wires":[["87129503.c7b358"]]},{"id":"87129503.c7b358","type":"rbe","z":"ac14500e.2c57d","name":"report-by-exception","func":"deadband","gap":"","start":"","inout":"out","property":"payload","x":300,"y":1520,"wires":[["5e2ffc27.c61dd4"]]},{"id":"5e2ffc27.c61dd4","type":"debug","z":"ac14500e.2c57d","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","x":510,"y":1520,"wires":[]},{"id":"2dc49f96.3070c","type":"inject","z":"ac14500e.2c57d","name":"","topic":"","payload":"1","payloadType":"num","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":90,"y":1540,"wires":[["87129503.c7b358"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The <code class="node">RBE</code> can be used to drop messages unless their value
has changed. This is useful for detecting changes.

If the property being checked is a number, the node can also be configured with
a threshold for how much the value must change for the message to be passed on.
