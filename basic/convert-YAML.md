---
layout: default
title: Convert to/from YAML
---

### Problem

You want to convert a string YAML to a JavaScript object and vice-versa.

### Solution

Use the <code class="node">YAML</code> node.

#### Example

![](/images/basic/basic-flow-019.png)

{% raw %}
~~~json
[{"id":"d9d1e47a.d30d58","type":"tab","label":"Data formats","disabled":false,"info":"# **Convert to/from YAML**\n\n## **Problem**\nYou want to convert a string YAML to a JavaScript object and vice-versa.\n\n## **Solution**\nUse the YAML node.\n\n## **Example**\n![messages](/ckbk/basic-flow-019.png)\n\n## **Discussion**\nThe YAML node works in either direction without any specific configuration.\n"},{"id":"ba020d93.39cf8","type":"comment","z":"d9d1e47a.d30d58","name":"Convert to/from YAML","info":"","x":180,"y":60,"wires":[]},{"id":"f54d46d9.755dc8","type":"inject","z":"d9d1e47a.d30d58","name":"trigger only","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":120,"y":140,"wires":[["e1ea771b.29dff8"]]},{"id":"b137baf4.5a08c8","type":"debug","z":"d9d1e47a.d30d58","name":"object","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","x":650,"y":140,"wires":[]},{"id":"b7ee01e4.63191","type":"debug","z":"d9d1e47a.d30d58","name":"string","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","x":490,"y":220,"wires":[]},{"id":"e6eb8064.c9d53","type":"inject","z":"d9d1e47a.d30d58","name":"Object","topic":"","payload":"{\"London\":{\"Temperature\":15,\"Humidity\":45},\"Melbourne\":{\"Temperature\":35,\"Humidity\":65}}","payloadType":"json","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":110,"y":220,"wires":[["477e2f5b.28c6d"]]},{"id":"e1ea771b.29dff8","type":"template","z":"d9d1e47a.d30d58","name":"YAML string","field":"payload","fieldType":"msg","format":"yaml","syntax":"plain","template":"London:\n  Temperature : 15\n  Humidity : 45\nMelbourne:\n  Temperature : 35\n  Humidity : 65","output":"str","x":290,"y":140,"wires":[["7a0afdb.8b99304"]]},{"id":"7a0afdb.8b99304","type":"yaml","z":"d9d1e47a.d30d58","property":"payload","name":"String to object","x":480,"y":140,"wires":[["b137baf4.5a08c8"]]},{"id":"477e2f5b.28c6d","type":"yaml","z":"d9d1e47a.d30d58","property":"payload","name":"Object to string","x":320,"y":220,"wires":[["b7ee01e4.63191"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The <code class="node">YAML</code> node works in either direction without any specific configuration.
