---
layout: default
title: Trigger a flow if a message isn’t received after a defined time
---

### Problem

You want the flow to be retriggered if a message is not received after a defined time.

### Solution

Use a <code class="node">Trigger</code> node configured like a watchdog. 

#### Example

![](/images/basic/basic-flow-011.png)

{% raw %}
~~~json
[{"id":"3ec760b3.9ee04","type":"tab","label":"Flow control","disabled":false,"info":"# **Trigger a flow if a message isn’t received after a defined time**\n\n## **Problem**\nYou want the flow to be retriggered if a message is not received after a defined time.\n\n\n## **Solution**\nUse a trigger node configured like a watchdog. \nOnce it is activated it expects to receive a message within a configured amount of time. If this message does not arrive the watchdog will triggger its output by resending the last message.\n\n## **Example**\n![messages](/ckbk/basic-flow-011.png)\n\n## **Discussion**\n\n"},{"id":"1df74b2d.0f1ca5","type":"comment","z":"3ec760b3.9ee04","name":"Trigger a flow if a message isn’t received after a defined time","info":"","x":300,"y":60,"wires":[]},{"id":"f6d040b7.ffd8b","type":"trigger","z":"3ec760b3.9ee04","op1":"","op2":"watching you","op1type":"pay","op2type":"str","duration":"-6","extend":false,"units":"s","reset":"stop","bytopic":"all","name":"Watchdog","x":300,"y":200,"wires":[["c8d4707.482fe9"]]},{"id":"e06e2c94.cd6e9","type":"inject","z":"3ec760b3.9ee04","name":"","topic":"","payload":"start","payloadType":"str","repeat":"","crontab":"","once":true,"onceDelay":0.1,"x":150,"y":160,"wires":[["f6d040b7.ffd8b"]]},{"id":"c8d4707.482fe9","type":"debug","z":"3ec760b3.9ee04","name":"","active":false,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","x":450,"y":200,"wires":[]},{"id":"f5414164.96e63","type":"inject","z":"3ec760b3.9ee04","name":"","topic":"","payload":"stop","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":150,"y":240,"wires":[["f6d040b7.ffd8b"]]},{"id":"7d6be007.bcf6c","type":"inject","z":"3ec760b3.9ee04","name":"","topic":"","payload":"ping","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":150,"y":200,"wires":[["f6d040b7.ffd8b"]]},{"id":"83b6075d.fdb9d8","type":"comment","z":"3ec760b3.9ee04","name":"unclick this tab in the debug node and redeploy the flow","info":"","x":580,"y":160,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

Once it is activated it expects to receive a message within a configured amount of time. 
If this message does not arrive the watchdog will trigger its output by resending the last message.
