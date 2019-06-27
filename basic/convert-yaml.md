---
layout: default
title: Convert to/from YAML
slug:
  - label: formats
    url: /#working-with-data-formats
  - yaml
---

### Problem

You want to convert a message property between a YAML string and the JavaScript object
it represents.

### Solution

The <code class="node">YAML</code> node can be used to convert between the two
formats.

#### Example

![](/images/basic/convert-yaml.png){:width="682px"}

{% raw %}
~~~json
[{"id":"f231967.0251a68","type":"inject","z":"64133d39.bb0394","name":"YAML String","topic":"","payload":"{\"a\":1}","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":110,"y":320,"wires":[["a0110756.ecfa48"]]},{"id":"8f8f31b7.1f916","type":"debug","z":"64133d39.bb0394","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":590,"y":320,"wires":[]},{"id":"5138ba3.c972444","type":"inject","z":"64133d39.bb0394","name":"Object","topic":"","payload":"{\"a\":1, \"b\":[1,2,3]}","payloadType":"json","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":90,"y":360,"wires":[["2fa653cc.60d3dc"]]},{"id":"50f2f4c.4a6e60c","type":"debug","z":"64133d39.bb0394","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":430,"y":360,"wires":[]},{"id":"a0110756.ecfa48","type":"template","z":"64133d39.bb0394","name":"","field":"payload","fieldType":"msg","format":"yaml","syntax":"plain","template":"a: 1\nb:\n  - 1\n  - 2\n  - 3","output":"str","x":280,"y":320,"wires":[["104b80e2.51068f"]]},{"id":"2fa653cc.60d3dc","type":"yaml","z":"64133d39.bb0394","property":"payload","name":"","x":250,"y":360,"wires":[["50f2f4c.4a6e60c"]]},{"id":"104b80e2.51068f","type":"yaml","z":"64133d39.bb0394","property":"payload","name":"","x":430,"y":320,"wires":[["8f8f31b7.1f916"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

In the example, the first flow injects the YAML:

~~~yaml
a: 1
b:
  - 1
  - 2
  - 3
~~~

The <code class="node">YAML</code> node then converts it to the equivalent JavaScript
object.

The second flow does the reverse, injecting the object `{ a: 1, b: [1,2,3] }`
and converting it to YAML.
