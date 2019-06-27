---
layout: default
title: Send placeholder messages when a stream stops sending
slug:
  - label: flow control
    url: /#flow-control
  - trigger placeholder
---

### Problem

You have a stream of messages coming from a sensor at regular intervals. If the
sensor stops sending messages, you want to send placeholder messages at the same
rate.

For example, the sensor data may be feeding a Dashboard chart. If the sensor
stops sending, the chart will stop updating. So placeholder messages are needed
for the chart to update with a `0` value to highlight the sensor has stopped.

### Solution

Use the <code class="node">Trigger</code> node to detect when a message has not
arrived after a defined interval and a second <code class="node">Trigger</code> node
to send the placeholder messages at a regular interval.

#### Example

![](/images/basic/trigger-placeholder.png){:width="711px"}

{% raw %}
~~~json
[{"id":"9ccdf268.c96ff","type":"inject","z":"ac14500e.2c57d","name":"","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":100,"y":1660,"wires":[["38950a5.28d15f6","2c532f67.0330e"]]},{"id":"38950a5.28d15f6","type":"debug","z":"ac14500e.2c57d","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":610,"y":1660,"wires":[]},{"id":"2c532f67.0330e","type":"trigger","z":"ac14500e.2c57d","op1":"reset","op2":"true","op1type":"str","op2type":"bool","duration":"2","extend":true,"units":"s","reset":"","bytopic":"all","name":"","x":260,"y":1700,"wires":[["e4e42b96.97a338"]]},{"id":"e4e42b96.97a338","type":"trigger","z":"ac14500e.2c57d","op1":"0","op2":"0","op1type":"num","op2type":"str","duration":"-2","extend":false,"units":"s","reset":"reset","bytopic":"all","name":"","x":420,"y":1700,"wires":[["38950a5.28d15f6"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

In the example flow, the top branch represents the normal flow of the messages,
from the <code class="node">Inject</code> node to the <code class="node">Debug</code>
node.

The messages also get passed to the first <code class="node">Trigger</code> node
on a second branch of the flow. That node is configured to initially send a payload
of `"reset"`, then to wait for 2 seconds before sending a timeout message. The
option to extend the delay if new messages arrive is also selected. This means
as long as messages continue to arrive, the node will not do anything. Once 2
seconds passes after the last message to arrive, it will send on the timeout message.

The timeout message feeds into a second <code class="node">Trigger</code> node. This
node is configured to send on `0` every two seconds and feeds back into the top
branch. The node is also configured to stop sending if it receives a `msg.payload`
of `"reset"`. As this is the initial message sent by the first
<code class="node">Trigger</code> node when it receives a sensor message, this will
cause the second <code class="node">Trigger</code> node to be reset when the sensor
resumes sending its own messages.
