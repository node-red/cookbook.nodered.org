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
[{"id":"91f16331.47ba7","type":"inject","z":"e12931d5.38a02","name":"Inject message/s","props":[{"p":"payload"},{"p":"topic","vt":"str"}],"repeat":"1","crontab":"","once":false,"onceDelay":0.1,"topic":"","payload":"","payloadType":"date","x":270,"y":180,"wires":[["742aa2aa.28d44c"]]},{"id":"742aa2aa.28d44c","type":"delay","z":"e12931d5.38a02","name":"","pauseType":"rate","timeout":"5","timeoutUnits":"seconds","rate":"1","nbRateUnits":"5","rateUnits":"second","randomFirst":"1","randomLast":"5","randomUnits":"seconds","drop":true,"x":500,"y":180,"wires":[["3f1d7cd.50d7684"]]},{"id":"3f1d7cd.50d7684","type":"debug","z":"e12931d5.38a02","name":"Debug","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","x":690,"y":180,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The rate limiting mode of the <code class="node">Delay</code> node can be used to
change the rate of messages passing through it. With the option to drop intermediate
messages enabled, it will discard any message that arrives within the rate limit
interval.
