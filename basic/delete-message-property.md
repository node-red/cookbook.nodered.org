---
layout: default
title: Delete a message property
slug:
  - label: messages
    url: /#messages
  - delete property
---

### Problem

You want to delete a message property.

### Solution

Use the <code class="node">Change</code> node to delete the property.

#### Example

![](/images/basic/delete-message-property.png){:width="616px"}

{% raw %}
~~~json
[{"id":"91cd2fa9.e0a96","type":"inject","z":"535331d8.55c1f","name":"","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"x":140,"y":180,"wires":[["54ec03e4.5714bc"]]},{"id":"54ec03e4.5714bc","type":"change","z":"535331d8.55c1f","name":"","rules":[{"t":"delete","p":"payload","pt":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":350,"y":180,"wires":[["321900de.3cbea"]]},{"id":"321900de.3cbea","type":"debug","z":"535331d8.55c1f","name":"","active":true,"console":"false","complete":"false","x":550,"y":180,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The <code class="node">Change</code> node can be used to delete properties of a message.
