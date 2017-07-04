---
layout: default
title: Move a message property
---

### Problem

You want to move a message property to a different property.

### Solution

Use the <code class="node">Change</code> node to move a property.

#### Example

![](/images/basic/basic-flow-003.png)

{% raw %}
~~~json
[{"id":"d11f7311.77c15","type":"inject","z":"535331d8.55c1f","name":"","topic":"Hello","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"x":160,"y":280,"wires":[["13c01487.eb13cb"]]},{"id":"13c01487.eb13cb","type":"change","z":"535331d8.55c1f","name":"","rules":[{"t":"move","p":"topic","pt":"msg","to":"payload","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":360,"y":280,"wires":[["89cc4fb1.9b208"]]},{"id":"89cc4fb1.9b208","type":"debug","z":"535331d8.55c1f","name":"","active":true,"console":"false","complete":"false","x":550,"y":280,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The <code class="node">Change</code> node can be used to move a property of a message.

It can be done as two separate actions in the <code class="node">Change</code> node;
first using a Set action to copy the property to its new location and then a Delete
action to remove the original.

Alternatively, the node supports a Move action that does it in one step.
