---
layout: default
title: Route a message based on a context value
---

### Problem

You want to route a message to different flows according to the current value
of a flow context property.

### Solution

Use the <code class="node">Switch</code> node to check the value of a flow context
property against different values corresponding to different outputs of the node.

#### Example

![](/images/basic/basic-flow-009.png){:width="643px"}

{% raw %}
~~~json
[{"id":"a62d8cdf.1bd82","type":"inject","z":"ac14500e.2c57d","name":"Inject","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":110,"y":600,"wires":[["b8bbbc41.f272"]]},{"id":"b8bbbc41.f272","type":"switch","z":"ac14500e.2c57d","name":"Context based routing","property":"state","propertyType":"flow","rules":[{"t":"eq","v":"1","vt":"num"},{"t":"eq","v":"2","vt":"num"},{"t":"eq","v":"3","vt":"num"}],"checkall":"true","repair":false,"outputs":3,"x":320,"y":600,"wires":[["9aa9c6b2.18a8e8"],["6ba4ec46.476794"],["a2e806c8.ffa168"]]},{"id":"9aa9c6b2.18a8e8","type":"debug","z":"ac14500e.2c57d","name":"Output 1","active":true,"tosidebar":true,"console":false,"tostatus":true,"complete":"payload","targetType":"msg","x":560,"y":540,"wires":[]},{"id":"6ba4ec46.476794","type":"debug","z":"ac14500e.2c57d","name":"Output 2","active":true,"tosidebar":true,"console":false,"tostatus":true,"complete":"payload","targetType":"msg","x":560,"y":600,"wires":[]},{"id":"a2e806c8.ffa168","type":"debug","z":"ac14500e.2c57d","name":"Output 3","active":true,"tosidebar":true,"console":false,"tostatus":true,"complete":"payload","targetType":"msg","x":560,"y":660,"wires":[]},{"id":"8aabdb51.e8b538","type":"inject","z":"ac14500e.2c57d","name":"Set state 0","topic":"","payload":"0","payloadType":"num","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":120,"y":680,"wires":[["e46083e4.1f17b"]]},{"id":"d1722dee.48db4","type":"inject","z":"ac14500e.2c57d","name":"Set state 1","topic":"","payload":"1","payloadType":"num","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":120,"y":720,"wires":[["e46083e4.1f17b"]]},{"id":"4bdb08de.706328","type":"inject","z":"ac14500e.2c57d","name":"Set state 2","topic":"","payload":"2","payloadType":"num","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":120,"y":760,"wires":[["e46083e4.1f17b"]]},{"id":"220ce0a6.cf81e","type":"inject","z":"ac14500e.2c57d","name":"Set state 3","topic":"","payload":"3","payloadType":"num","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":120,"y":800,"wires":[["e46083e4.1f17b"]]},{"id":"e46083e4.1f17b","type":"change","z":"ac14500e.2c57d","name":"Set flow.state","rules":[{"t":"set","p":"state","pt":"flow","to":"payload","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":340,"y":720,"wires":[[]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

In the example flow, the top flow represents the stream of messages that need to be
routed to one of the three outputs by the <code class="node">Switch</code> node.

The bottom flow provides a set of <code class="node">Inject</code> nodes to change
the current value of the `flow.state` context property.

This shows how the routing in one flow can be changed by a separate flow.
