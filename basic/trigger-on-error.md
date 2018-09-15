---
layout: default
title: Trigger a flow when a node throws an error
---

### Problem

You want to trigger a flow in case the function node throws an error.

### Solution

Use the <code class="node">Catch</code> node to trigger an alternative flow to handle to error.

#### Example

![](/images/basic/basic-flow-015.png)

{% raw %}
~~~json
[{"id":"e5862c0f.205ee","type":"tab","label":"Error handling","disabled":false,"info":"# **Trigger a flow when a node throws an error**\n\n## **Problem**\nYou want to trigger a flow in case the function node throws an error.\n\n## **Solution**\nUse the catch node to trigger an alternative flow to handle to error.\n\n## **Example**\n![messages](/ckbk/basic-flow-015.png)\n\n## **Discussion**\nA handling error flow will be triggered if the context value flow.test is undefined. This flow will set a context value.\n\n"},{"id":"b9fcb436.2e97a8","type":"comment","z":"e5862c0f.205ee","name":"Trigger a flow when a node throws an error","info":"","x":240,"y":60,"wires":[]},{"id":"e1c394e1.f48a78","type":"catch","z":"e5862c0f.205ee","name":"","scope":null,"x":120,"y":220,"wires":[["bb0090d2.5f535"]]},{"id":"3f57727a.b2132e","type":"function","z":"e5862c0f.205ee","name":"Read flow context","func":"let v = flow.get(\"test\");\nif (v === undefined) {\n node.error(\"flow variable is undefined\", msg);   \n} else {\n    msg.payload = v;\n}\nreturn msg;","outputs":1,"noerr":0,"x":350,"y":160,"wires":[["79068bb6.7a7e44"]]},{"id":"79068bb6.7a7e44","type":"debug","z":"e5862c0f.205ee","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","x":590,"y":220,"wires":[]},{"id":"fd1756e.730cea8","type":"inject","z":"e5862c0f.205ee","name":"Start","topic":"","payload":"invalid payload","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":130,"y":160,"wires":[["3f57727a.b2132e"]]},{"id":"bb0090d2.5f535","type":"change","z":"e5862c0f.205ee","name":"Set context","rules":[{"t":"set","p":"test","pt":"flow","to":"valid","tot":"str"},{"t":"set","p":"payload","pt":"msg","to":"Error handling flow invoked, context is now set","tot":"str"}],"action":"","property":"","from":"","to":"","reg":false,"x":290,"y":220,"wires":[["79068bb6.7a7e44"]]},{"id":"bef4fc01.c2e0c","type":"change","z":"e5862c0f.205ee","name":"","rules":[{"t":"delete","p":"test","pt":"flow"}],"action":"","property":"","from":"","to":"","reg":false,"x":360,"y":280,"wires":[[]]},{"id":"442a8212.93f9cc","type":"inject","z":"e5862c0f.205ee","name":"Delete flow context","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":170,"y":280,"wires":[["bef4fc01.c2e0c"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

A handling error flow will be triggered if the context value `flow.test` is undefined. This flow will set a context value.
