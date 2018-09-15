---
layout: default
title: Limit the rate of messages passing through a flow
---

### Problem

You want to limit the rate of messages to, let's say, one message per second.

### Solution

Use a <code class="node">Delay</code> node configured with action = rate limit.

#### Example

![](/images/basic/basic-flow-012.png)

{% raw %}
~~~json
[{"id":"87ab3f0c.2bb42","type":"tab","label":"Flow control","disabled":false,"info":"# **Limit the rate of messages passing through a flow**\n\n## **Problem**\nYou want to limit the rate of messages to , let´s say, one message per second.\n\n## **Solution**\nUse a delay node configured with action = rate limit.\n\n## **Example**\n![messages](/ckbk/basic-flow-012.png)\n\n## **Discussion**\nYou can allow messages to be dropped by checking, in the node configuration dialog, the box named drop intermediate messages.\n"},{"id":"7d7c5464.c88fdc","type":"comment","z":"87ab3f0c.2bb42","name":"Limit the rate of messages passing through a flow","info":"","x":260,"y":60,"wires":[]},{"id":"d7bf5f31.0a132","type":"delay","z":"87ab3f0c.2bb42","name":"Rate limit","pauseType":"rate","timeout":"5","timeoutUnits":"seconds","rate":"1","nbRateUnits":"1","rateUnits":"second","randomFirst":"1","randomLast":"5","randomUnits":"seconds","drop":false,"x":340,"y":180,"wires":[["a271aabb.d0d8c8"]]},{"id":"87da4875.454a08","type":"inject","z":"87ab3f0c.2bb42","name":"","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":180,"y":180,"wires":[["d7bf5f31.0a132"]]},{"id":"a271aabb.d0d8c8","type":"debug","z":"87ab3f0c.2bb42","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":510,"y":180,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

You can allow messages to be dropped by checking, in the node configuration dialog, the box named drop intermediate messages.
