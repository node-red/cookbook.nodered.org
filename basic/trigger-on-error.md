---
layout: default
title: Trigger a flow when a node throws an error
---

### Problem

You want to trigger a flow in case the <code class="node">function</code> node throws an error.

### Solution

Use the <code class="node">Catch</code> node to trigger an error handling flow.

#### Example

![](/images/basic/basic-flow-015.png)

{% raw %}
~~~json
[{"id":"e5862c0f.205ee","type":"tab","label":"Error handling","disabled":false,"info":""},{"id":"b9fcb436.2e97a8","type":"comment","z":"e5862c0f.205ee","name":"Trigger a flow when a node throws an error","info":"","x":240,"y":60,"wires":[]},{"id":"e1c394e1.f48a78","type":"catch","z":"e5862c0f.205ee","name":"","scope":null,"x":120,"y":220,"wires":[["bb0090d2.5f535"]]},{"id":"3f57727a.b2132e","type":"function","z":"e5862c0f.205ee","name":"Read flow context","func":"let v = flow.get(\"test\");\nif (v === undefined) {\n node.error(\"flow variable is undefined\", msg);   \n} else {\n    msg.payload = v;\n}\nreturn msg;","outputs":1,"noerr":0,"x":370,"y":160,"wires":[["67ab640a.13cbbc"]]},{"id":"79068bb6.7a7e44","type":"debug","z":"e5862c0f.205ee","name":"Debug2","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","x":560,"y":220,"wires":[]},{"id":"fd1756e.730cea8","type":"inject","z":"e5862c0f.205ee","name":"Trigger flow","topic":"","payload":"invalid payload","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":150,"y":160,"wires":[["3f57727a.b2132e"]]},{"id":"bb0090d2.5f535","type":"change","z":"e5862c0f.205ee","name":"Set context","rules":[{"t":"set","p":"test","pt":"flow","to":"valid","tot":"str"},{"t":"set","p":"payload","pt":"msg","to":"Context is now setup","tot":"str"}],"action":"","property":"","from":"","to":"","reg":false,"x":390,"y":220,"wires":[["79068bb6.7a7e44"]]},{"id":"bef4fc01.c2e0c","type":"change","z":"e5862c0f.205ee","name":"Delete context","rules":[{"t":"delete","p":"test","pt":"flow"},{"t":"set","p":"payload","pt":"msg","to":"Context was deleted. An error with be thrown if the flow is triggered now","tot":"str"}],"action":"","property":"","from":"","to":"","reg":false,"x":380,"y":380,"wires":[["b8de0a5f.20fd88"]]},{"id":"442a8212.93f9cc","type":"inject","z":"e5862c0f.205ee","name":"Delete flow context","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":190,"y":380,"wires":[["bef4fc01.c2e0c"]]},{"id":"5c09ee3a.d8c65","type":"inject","z":"e5862c0f.205ee","name":"Setup flow context","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":170,"y":280,"wires":[["bb0090d2.5f535"]]},{"id":"67ab640a.13cbbc","type":"debug","z":"e5862c0f.205ee","name":"Debug1","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","x":560,"y":160,"wires":[]},{"id":"b8de0a5f.20fd88","type":"debug","z":"e5862c0f.205ee","name":"Debug3","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","x":560,"y":380,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The very first time you run the flow it will check that the <code class="highlighter-rouge">flow.test</code> property is undefined and will throw an error. A handling error flow will invoked and will set the context properly.
