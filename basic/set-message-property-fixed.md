---
layout: default
title: Set a message property to a fixed value
slug:
  - label: messages
    url: /#messages
  - set property
---

### Problem

You want to set a message property to a fixed value.

### Solution

Use the <code class="node">Change</code> node to set the property of the message.

#### Example

![](/images/basic/set-message-property-fixed.png){:width="616px"}

{% raw %}
~~~json
[{"id":"d72dc4ce.89b368","type":"inject","z":"535331d8.55c1f","name":"","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"x":140,"y":80,"wires":[["78075f19.e0174"]]},{"id":"78075f19.e0174","type":"change","z":"535331d8.55c1f","name":"","rules":[{"t":"set","p":"payload","pt":"msg","to":"Hello World!","tot":"str"}],"action":"","property":"","from":"","to":"","reg":false,"x":340,"y":80,"wires":[["78dc7c25.b90d54"]]},{"id":"78dc7c25.b90d54","type":"debug","z":"535331d8.55c1f","name":"","active":true,"console":"false","complete":"false","x":550,"y":80,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The <code class="node">Change</code> node can be used to set properties of a message.

The node supports setting various JavaScript types as well as some Node-RED specific types.

 - strings: `"hello world"`
 - numbers: `42`
 - boolean: `true`/`false`
 - timestamp: the current time, in milliseconds, since epoch (January 1st, 1970)
 - JSON: a JSON string that will be parsed to its Object representation
 - Buffer: a Node.js Buffer object

It also supports setting a property to a value based on the value of context properties,
other message properties or a JSONata expression.
