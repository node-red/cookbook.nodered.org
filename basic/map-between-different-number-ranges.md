---
layout: default
title: Map a property between different numeric ranges
---

### Problem

You want to scale a number from one numeric range to another. For example, a
sensor reading in the range 0 - 1023 should be mapped to a voltage range of 0 - 5.

### Solution

Use the <code class="node">Range</code> node to map between the defined ranges.

#### Example

![](/images/basic/map-between-different-number-ranges.png){:width="616px"}

{% raw %}
~~~json
[{"id":"80dae67d.b4d8f8","type":"inject","z":"535331d8.55c1f","name":"","topic":"","payload":"0","payloadType":"num","repeat":"","crontab":"","once":false,"x":130,"y":380,"wires":[["81f13534.456348"]]},{"id":"81f13534.456348","type":"range","z":"535331d8.55c1f","minin":"0","maxin":"1023","minout":"0","maxout":"5","action":"clamp","round":false,"name":"","x":350,"y":420,"wires":[["e80b61d7.4b399"]]},{"id":"cb21de23.75a2f","type":"inject","z":"535331d8.55c1f","name":"","topic":"","payload":"512","payloadType":"num","repeat":"","crontab":"","once":false,"x":130,"y":420,"wires":[["81f13534.456348"]]},{"id":"342552de.255a1e","type":"inject","z":"535331d8.55c1f","name":"","topic":"","payload":"1023","payloadType":"num","repeat":"","crontab":"","once":false,"x":130,"y":460,"wires":[["81f13534.456348"]]},{"id":"e80b61d7.4b399","type":"debug","z":"535331d8.55c1f","name":"","active":true,"console":"false","complete":"false","x":550,"y":420,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The <code class="node">Range</code> node can be used to linearly scale between two
different numberic ranges.

By default, the result is not constrained to the range defined in the node. This means
using the voltage example above, a value of 2046 would map to a result of 10.

The node can be configured to constrain the result to the target range, or apply simple
modulo arithmetic so the value wraps within the target range.
