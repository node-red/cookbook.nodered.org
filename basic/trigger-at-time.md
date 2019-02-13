---
layout: default
title: Trigger a flow at a specific time
---

### Problem

You want to trigger a flow at a specific time, such as at 4pm every weekday.

### Solution

Use an <code class="node">Inject</code> node configured to trigger at the desired
time.

#### Example

![](/images/basic/trigger-at-time.png){:width="530px"}

{% raw %}
~~~json
[{"id":"24579bcb.5c9814","type":"inject","z":"535331d8.55c1f","name":"","topic":"","payload":"It is 4pm on a weekday!","payloadType":"str","repeat":"","crontab":"00 16 * * 1,2,3,4,5","once":false,"x":190,"y":660,"wires":[["145b508a.f3325f"]]},{"id":"145b508a.f3325f","type":"debug","z":"535331d8.55c1f","name":"","active":true,"console":"false","complete":"false","x":410,"y":660,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The <code class="node">Inject</code> node can be configured to trigger at a specific
time on specific days of the week.

If multiple different times are required, multiple <code class="node">Inject</code>
nodes should be used.
