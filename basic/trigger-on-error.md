---
layout: default
title: Trigger a flow when a node throws an error
slug:
  - label: error handling
    url: /#error-handling
  - trigger on error
---

### Problem

You want to trigger a flow when a node throws an error.

### Solution

Use the <code class="node">Catch</code> node to receive the error and trigger a flow.

#### Example

![](/images/basic/trigger-on-error.png){:width="401px"}

{% raw %}
~~~json
[{"id":"2bd6810d.e22ece","type":"catch","z":"fc046f99.4be08","name":"","scope":["2c94a22c.91012e"],"uncaught":false,"x":130,"y":160,"wires":[["d16b9fac.8212a"]]},{"id":"2c94a22c.91012e","type":"function","z":"fc046f99.4be08","name":"Throw Error","func":"node.error(\"an example error\", msg);   ","outputs":1,"noerr":0,"x":310,"y":100,"wires":[[]]},{"id":"d16b9fac.8212a","type":"debug","z":"fc046f99.4be08","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"error","targetType":"msg","x":300,"y":160,"wires":[]},{"id":"c5ee9670.5dbbd8","type":"inject","z":"fc046f99.4be08","name":"Trigger error","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":110,"y":100,"wires":[["2c94a22c.91012e"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The <code class="node">Catch</code> node can be configured to catch errors from
specific nodes in the flow or from any node. This allows you to create different
error handling flows for different nodes.

The <code class="node">Catch</code> node sends on the message that was logged with
the error. It also sets `msg.error` with details of the error and which node triggered
it.

Note that this requires nodes to properly log their errors so that they can be caught.
