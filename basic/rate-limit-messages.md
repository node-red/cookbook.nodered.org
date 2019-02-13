---
layout: default
title: Slow down messages passing through a flow
---

### Problem

You want to slow down the messages passing through a flow. For example,
you have a message containing an array of values that you
[split into a stream of messages](/basic/operate-on-array) and want to process
each message in that stream at a rate of one per second.

### Solution

Use a <code class="node">Delay</code> node configured to rate limit the messages
passing through it.

#### Example

![](/images/basic/rate-limit-messages.png){:width="615px"}

{% raw %}
~~~json
[{"id":"1fccc223.7ba87e","type":"inject","z":"ac14500e.2c57d","name":"Inject Array","topic":"","payload":"[0,1,2,3,4,5,6,7,8,9]","payloadType":"json","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":110,"y":1280,"wires":[["b2837466.e02a38"]]},{"id":"b2837466.e02a38","type":"split","z":"ac14500e.2c57d","name":"","splt":"\\n","spltType":"str","arraySplt":1,"arraySpltType":"len","stream":false,"addname":"","x":250,"y":1280,"wires":[["bd97c8ed.a5c8d8"]]},{"id":"bd97c8ed.a5c8d8","type":"delay","z":"ac14500e.2c57d","name":"","pauseType":"rate","timeout":"5","timeoutUnits":"seconds","rate":"1","nbRateUnits":"1","rateUnits":"second","randomFirst":"1","randomLast":"5","randomUnits":"seconds","drop":false,"x":390,"y":1280,"wires":[["bd66f03e.bdf0c"]]},{"id":"bd66f03e.bdf0c","type":"debug","z":"ac14500e.2c57d","name":"Debug","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","x":530,"y":1280,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The rate limiting mode of the <code class="node">Delay</code> node can be used to
change the rate of messages passing through it. It is configured with the desired
number of messages to pass through the node per time interval. It will evenly
spread the delivery of messages across the time period.
