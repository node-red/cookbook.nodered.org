---
layout: default
title: Handle messages at a regular rate
slug:
  - label: flow control
    url: /#flow-control
  - rate limit
---

### Problem

You want to handle messages at a regular rate, ignoring messages that arrive too
quickly. For example, you have a sensor sending data every second but you only
want to handle an update every 5 seconds. The messages you handle must be the most
recent.

### Solution

Use a <code class="node">Delay</code> node configured to rate limit the messages
passing through it with the option to drop intermediate messages enabled.

#### Example

![](/images/basic/rate-limit-message-stream.png){:width="601px"}

{% raw %}
~~~json
[{"id":"8a1bcd7d.f6b67","type":"inject","z":"ac14500e.2c57d","name":"Inject Array","topic":"","payload":"[0,1,2,3,4,5,6,7,8,9]","payloadType":"json","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":110,"y":1380,"wires":[["bd4bdd42.bd1b"]]},{"id":"bd4bdd42.bd1b","type":"delay","z":"ac14500e.2c57d","name":"","pauseType":"rate","timeout":"5","timeoutUnits":"seconds","rate":"1","nbRateUnits":"5","rateUnits":"second","randomFirst":"1","randomLast":"5","randomUnits":"seconds","drop":true,"x":320,"y":1380,"wires":[["be20c513.237c78"]]},{"id":"be20c513.237c78","type":"debug","z":"ac14500e.2c57d","name":"Debug","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","x":510,"y":1380,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The rate limiting mode of the <code class="node">Delay</code> node can be used to
change the rate of messages passing through it. With the option to drop intermediate
messages enabled, it will discard any message that arrives within the rate limit
interval.
