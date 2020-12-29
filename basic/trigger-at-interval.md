---
layout: default
title: Trigger a flow at regular intervals
slug:
  - label: flow control
    url: /#flow-control
  - trigger at interval
---

### Problem

You want to trigger a flow at regular intervals. For example, to periodically
call an api to retrieve its current state.

### Solution

Use an <code class="node">Inject</code> node configured to repeat at the desired
interval.

To stop - you must re-configure the node and set Repeat to none. Click done to save the change and deploy.

#### Example

![](/images/basic/trigger-at-interval.png){:width="530px"}

{% raw %}
~~~json
[{"id":"372cfc32.bcd244","type":"inject","z":"535331d8.55c1f","name":"","topic":"","payload":"","payloadType":"date","repeat":"5","crontab":"","once":false,"x":150,"y":600,"wires":[["6c63c499.ce3adc"]]},{"id":"6c63c499.ce3adc","type":"debug","z":"535331d8.55c1f","name":"","active":true,"console":"false","complete":"false","x":410,"y":600,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The <code class="node">Inject</code> node can be configured to repeat at a fixed
interval. If desired, it can also be constrained to do so between certain times on
certain days.
