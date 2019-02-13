---
layout: default
title: Convert to/from JSON
---

### Problem

You want to convert a message property between a JSON string and the JavaScript object
it represents.

### Solution

The <code class="node">JSON</code> node can be used to convert between the two
formats.

#### Example

![](/images/basic/convert-json.png){:width="534px"}

{% raw %}
~~~json
[{"id":"42c7e8c9.c8dcc8","type":"tab","label":"Data formats","disabled":false,"info":""},{"id":"55ce5d01.f44844","type":"comment","z":"42c7e8c9.c8dcc8","name":"Convert to/from JSON","info":"","x":180,"y":60,"wires":[]},{"id":"7e85d691.9419b8","type":"json","z":"42c7e8c9.c8dcc8","name":"Convert to object","property":"payload","action":"obj","pretty":false,"x":450,"y":160,"wires":[["f0f10d7a.0348"]]},{"id":"f0f10d7a.0348","type":"debug","z":"42c7e8c9.c8dcc8","name":"Object","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","x":630,"y":160,"wires":[]},{"id":"2bae7b92.675084","type":"json","z":"42c7e8c9.c8dcc8","name":"Convert to JSON","property":"payload","action":"str","pretty":true,"x":330,"y":240,"wires":[["c6136487.030a38"]]},{"id":"3ead7d36.e00052","type":"inject","z":"42c7e8c9.c8dcc8","name":"","topic":"","payload":"[\"temperature\", 23,{\"city\": \"Venice\"},[3,4],true]","payloadType":"json","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":110,"y":160,"wires":[["c3329280.9f4ff"]]},{"id":"6cdbd34e.ae194c","type":"inject","z":"42c7e8c9.c8dcc8","name":"Object","topic":"","payload":"{     \"moisture\": 30,     \"battery\": 40,     \"temperature\": 50,     \"conductivity\": 60 }","payloadType":"json","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":110,"y":240,"wires":[["2bae7b92.675084"]]},{"id":"c3329280.9f4ff","type":"template","z":"42c7e8c9.c8dcc8","name":"String","field":"payload","fieldType":"msg","format":"json","syntax":"plain","template":"{\n    \"moisture\": 30,\n    \"battery\": 40,\n    \"temperature\": 50,\n    \"conductivity\": 60\n}","output":"str","x":250,"y":160,"wires":[["7e85d691.9419b8"]]},{"id":"c6136487.030a38","type":"debug","z":"42c7e8c9.c8dcc8","name":"JSON string","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","x":570,"y":240,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

In the example, the first flow injects the JSON string `'{"a":1}'` which the
<code class="node">JSON</code> node converts to the equivalent JavaScript object.

The second flow does the reverse, injecting the object `{ a: 1 }` and converting
it to JSON.

The <code class="node">JSON</code> will, by default, detect what it is being given
to convert. It can also be configured to ensure the property is a given type. For
example if your flow could receive either JSON or an Object, the <code class="node">JSON</code>
node can be configured to ensure the property is an Object.
