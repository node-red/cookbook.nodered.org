---
layout: default
title: Trigger a flow if a message isn’t received after a defined time
---

### Problem

You want a flow to be triggered if a message is not received after a defined time.
For example, you expect to receive a sensor reading every 5 seconds and need to know
if it fails to arrive.

### Solution

Use the <code class="node">Trigger</code> node to detect when a message has not
arrived after a defined interval.

#### Example

![](/images/basic/trigger-timeout.png){:width="555px"}

{% raw %}
~~~json
[{"id":"6ea53ad8.2362a4","type":"debug","z":"ac14500e.2c57d","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","x":450,"y":1160,"wires":[]},{"id":"3da6946e.184a5c","type":"inject","z":"ac14500e.2c57d","name":"","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":100,"y":1160,"wires":[["38caaff4.03f6d","6ea53ad8.2362a4"]]},{"id":"38caaff4.03f6d","type":"trigger","z":"ac14500e.2c57d","op1":"","op2":"timeout","op1type":"nul","op2type":"str","duration":"5","extend":true,"units":"s","reset":"","bytopic":"all","name":"Watchdog","x":270,"y":1200,"wires":[["ae477709.016088"]]},{"id":"ae477709.016088","type":"debug","z":"ac14500e.2c57d","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":450,"y":1200,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

In the example flow, the top branch represents the normal flow of the messages.
They also get passed to the <code class="node">Trigger</code> node on a second
branch of the flow.

The <code class="node">Trigger</code> node is configured to initially send nothing,
then to wait for 5 seconds before sending a `"timeout"` message. The option to
extend the delay if new messages arrive is also selected. This means as long as
messages continue to arrive, the node will not do anything. Once 5 seconds passes
after the last message to arrive, it will send on the `"timeout"` message.
