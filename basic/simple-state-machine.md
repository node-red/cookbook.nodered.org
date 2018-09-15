---
layout: default
title: Create a simple state machine
---

### Problem

You want to implement a simple state machine.

### Solution

Use the <code class="node">Function</code> node along with storage in the flow context.

#### Example

![](/images/basic/basic-flow-014.png)

{% raw %}
~~~json
[{"id":"793160c0.bedcc","type":"tab","label":"Flow control","disabled":false,"info":"# **Create a simple state machine**\n\n## **Problem**\nYou want to implement a simple state machine.\n\n## **Solution**\nUse the function node along with storage in the flow context.\n\n## **Example**\n![messages](/ckbk/basic-flow-014.png)\n\n\n## **Discussion**\nThe state machine in this example is programmed to allow to change from any state to any state except for state1 that can only change to state2 (not allowed to go from state1 to state3)\n"},{"id":"94c986d.6524478","type":"comment","z":"793160c0.bedcc","name":"Create a simple state machine","info":"","x":200,"y":60,"wires":[]},{"id":"c53df822.bda258","type":"debug","z":"793160c0.bedcc","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","x":630,"y":180,"wires":[]},{"id":"c401e50a.e1f388","type":"inject","z":"793160c0.bedcc","name":"","topic":"transition1","payload":"transition1","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":180,"y":140,"wires":[["1ae63a8a.350fa5"]]},{"id":"afdea29.c31bf6","type":"inject","z":"793160c0.bedcc","name":"","topic":"transition2","payload":"transition2","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":180,"y":180,"wires":[["1ae63a8a.350fa5"]]},{"id":"ef8514f2.d91538","type":"inject","z":"793160c0.bedcc","name":"","topic":"transition3","payload":"transition3","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":180,"y":220,"wires":[["1ae63a8a.350fa5"]]},{"id":"1ae63a8a.350fa5","type":"function","z":"793160c0.bedcc","name":"Finite State Machine","func":"let currentState = flow.get(\"currentState\") || \"state1\";\nlet newState = currentState;\n\nlet p = msg.payload;\n\n\nswitch (currentState) {\n    case \"state1\":\n        if (p === \"transition2\") {newState = \"state2\"}\n        break;\n    case \"state2\":\n        if (p === \"transition1\") {newState = \"state1\"}\n        if (p === \"transition3\") {newState = \"state3\"}\n        break;\n    case \"state3\":\n        if (p === \"transition1\") {newState = \"state1\"}\n        if (p === \"transition2\") {newState = \"state2\"}\n        break;\n}\n\n\nflow.set(\"currentState\",newState);\nmsg.payload = newState;\nreturn msg;","outputs":1,"noerr":0,"x":430,"y":180,"wires":[["c53df822.bda258"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The state machine in this example is programmed to allow to change from any state to any state except for state1 that can only change to state2 (not allowed to go from state1 to state3)
