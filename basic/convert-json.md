---
layout: default
title: Convert to/from JSON
slug:
  - label: formats
    url: /#working-with-data-formats
  - json

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
[{"id":"634256b7.2d6818","type":"inject","z":"64133d39.bb0394","name":"JSON String","topic":"","payload":"{\"a\":1}","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":110,"y":80,"wires":[["a2fe0fc8.095e1"]]},{"id":"a2fe0fc8.095e1","type":"json","z":"64133d39.bb0394","name":"","property":"payload","action":"","pretty":false,"x":270,"y":80,"wires":[["9a4ce2b8.47698"]]},{"id":"9a4ce2b8.47698","type":"debug","z":"64133d39.bb0394","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":430,"y":80,"wires":[]},{"id":"80032e2.7c92cd","type":"inject","z":"64133d39.bb0394","name":"Object","topic":"","payload":"{\"a\":1}","payloadType":"json","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":90,"y":120,"wires":[["cd40a0f4.4f5ac"]]},{"id":"cd40a0f4.4f5ac","type":"json","z":"64133d39.bb0394","name":"","property":"payload","action":"","pretty":false,"x":270,"y":120,"wires":[["478b4106.4fd7c"]]},{"id":"478b4106.4fd7c","type":"debug","z":"64133d39.bb0394","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":430,"y":120,"wires":[]}]
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
