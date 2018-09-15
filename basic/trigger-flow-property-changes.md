---
layout: default
title: Trigger a flow when a message property changes value
---

### Problem

You want to trigger the flow whenever and only when the property payload changes.

### Solution

Use the <code class="node">RBE</code> node configured in the mode "block unless value changes".

#### Example

![](/images/basic/basic-flow-013.png)

{% raw %}
~~~json
[{"id":"84b79f91.7264e","type":"tab","label":"Flow control","disabled":false,"info":"# **Trigger a flow when a message property changes value**\n\n## **Problem**\nYou want to trigger the flow whenever and only when the property payload changes.\n\n## **Solution**\nUse the RBE node configured in the mode \"block unless value changes\".\n\n## **Example**\n![messages](/ckbk/basic-flow-013.png)\n\n## **Discussion**\nYou can select other property in the node configuration dialog box, instead of using payload.\n"},{"id":"9a55494.3de85b8","type":"comment","z":"84b79f91.7264e","name":"Trigger a flow when a message property changes value","info":"","x":280,"y":60,"wires":[]},{"id":"113f0bf.25877f4","type":"rbe","z":"84b79f91.7264e","name":"","func":"rbe","gap":"","start":"","inout":"out","property":"payload","x":310,"y":160,"wires":[["4157d0f5.11b66"]]},{"id":"601fa81a.504658","type":"inject","z":"84b79f91.7264e","name":"","topic":"","payload":"Alfa","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":150,"y":160,"wires":[["113f0bf.25877f4"]]},{"id":"25941272.33e5ee","type":"inject","z":"84b79f91.7264e","name":"","topic":"","payload":"Bravo","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":150,"y":220,"wires":[["113f0bf.25877f4"]]},{"id":"4157d0f5.11b66","type":"debug","z":"84b79f91.7264e","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":480,"y":160,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

You can select any other property in the node configuration dialog box, instead of using payload.
