---
layout: default
title: Create a single message from separate streams of messages
---

### Problem

You have messages arriving from different sources that you need to combine into
a single message.

For example, you have three different sensors publishing values and you want to
insert them into a database as a single entry.

### Solution

Give each stream a unique `msg.topic` value and use the <code class="node">Join</code>
node to group them into a single message.

#### Example

![](/images/basic/join-streams.png){:width="571px"}

{% raw %}
~~~json
[{"id":"8ccddb9a.a55f38","type":"inject","z":"ac14500e.2c57d","name":"temperature","topic":"temperature","payload":"10","payloadType":"num","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":110,"y":1760,"wires":[["47b769c5.cb0e28"]]},{"id":"47b769c5.cb0e28","type":"join","z":"ac14500e.2c57d","name":"","mode":"custom","build":"object","property":"payload","propertyType":"msg","key":"topic","joiner":"\\n","joinerType":"str","accumulate":false,"timeout":"","count":"3","reduceRight":false,"reduceExp":"","reduceInit":"","reduceInitType":"","reduceFixup":"","x":310,"y":1800,"wires":[["f9afb265.b11b7"]]},{"id":"f9afb265.b11b7","type":"debug","z":"ac14500e.2c57d","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":470,"y":1800,"wires":[]},{"id":"2d269127.4f04ce","type":"inject","z":"ac14500e.2c57d","name":"humidity","topic":"humidity","payload":"","payloadType":"num","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":100,"y":1800,"wires":[["47b769c5.cb0e28"]]},{"id":"d6fbe805.0e4628","type":"inject","z":"ac14500e.2c57d","name":"pressure","topic":"pressure","payload":"999","payloadType":"num","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":100,"y":1840,"wires":[["47b769c5.cb0e28"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

In the example flow, each <code class="node">Inject</code> node represents a
different source of messages. They each set a unique `msg.topic` value so they
can be identified later in the flow.

The <code class="node">Join</code> node has been configured in manual mode to
create a key/value object using `msg.topic` as the key name. As we know there
are three separate streams of messages to join, the node has been to configure to
send on a message when it receives that number of parts.

This means it will send on a message each time it receives at least one message
from three different topics - using the most recent value from each topic.

```json
{
    "temperature":10,
    "humidity":0,
    "pressure":999
}
```

The node has further options to change its behaviour that have not been used in
this recipe. For example, a timeout can be set to ensure it sends *something*
in case one of the sensors stops sending values. If that is a concern, you may
consider [this recipe](/basics/trigger-timeout) for providing a placeholder
value.
