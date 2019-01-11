---
layout: default
title: Limit the rate of messages passing through a flow
---

### Problem

You want to limit the rate of messages to, let's say, five message per second.

### Solution

Use a <code class="node">Delay</code> node configured with action = rate limit.

#### Example

![](/images/basic/basic-flow-012.png)

{% raw %}
~~~json
[{"id":"87ab3f0c.2bb42","type":"tab","label":"Flow control","disabled":false,"info":""},{"id":"7d7c5464.c88fdc","type":"comment","z":"87ab3f0c.2bb42","name":"Limit the rate of messages passing through a flow","info":"","x":220,"y":100,"wires":[]},{"id":"d7bf5f31.0a132","type":"delay","z":"87ab3f0c.2bb42","name":"Rate limit 5 per second","pauseType":"rate","timeout":"5","timeoutUnits":"seconds","rate":"1","nbRateUnits":"5","rateUnits":"second","randomFirst":"1","randomLast":"5","randomUnits":"seconds","drop":true,"x":400,"y":180,"wires":[["a271aabb.d0d8c8"]]},{"id":"87da4875.454a08","type":"inject","z":"87ab3f0c.2bb42","name":"Repeat each second","topic":"","payload":"","payloadType":"date","repeat":"1","crontab":"","once":true,"onceDelay":0.1,"x":160,"y":180,"wires":[["d7bf5f31.0a132"]]},{"id":"a271aabb.d0d8c8","type":"debug","z":"87ab3f0c.2bb42","name":"Debug","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","x":590,"y":180,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

You will see in the debug panel messages logged each 5 seconds, even if the <code class="node">trigger</code> node is generating one message per second. Intermediate messages are being dropped, which is a configuration option for the node.
