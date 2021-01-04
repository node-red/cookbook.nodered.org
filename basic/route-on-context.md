---
layout: default
title: Route or block a message based on a context value
slug:
  - label: flow control
    url: /#flow-control
  - route on context
---

### Problem

You want to route a message to different flows, or stop it entirely, according to the current value
of another variable.

### Solution

Save the switching variable into a flow context variable, and then use a <code class="node">Switch</code> node to check the value of that flow context
property against different values corresponding to different outputs of the node.

#### Example

![](/images/basic/route-on-context.png){:width="643px"}

{% raw %}
~~~json
[{"id":"a62d8cdf.1bd82","type":"inject","z":"9138b11f.f64d5","name":"Inject","props":[{"p":"payload"},{"p":"topic","vt":"str"}],"repeat":"2","crontab":"","once":false,"onceDelay":0.1,"topic":"","payload":"","payloadType":"date","x":140,"y":585,"wires":[["b8bbbc41.f272"]]},{"id":"b8bbbc41.f272","type":"switch","z":"9138b11f.f64d5","name":"Context based routing","property":"state","propertyType":"flow","rules":[{"t":"eq","v":"1","vt":"num"},{"t":"eq","v":"2","vt":"num"},{"t":"eq","v":"3","vt":"num"}],"checkall":"true","repair":false,"outputs":3,"x":350,"y":585,"wires":[["9aa9c6b2.18a8e8"],["6ba4ec46.476794"],["a2e806c8.ffa168"]]},{"id":"9aa9c6b2.18a8e8","type":"debug","z":"9138b11f.f64d5","name":"Output 1","active":true,"tosidebar":true,"console":false,"tostatus":true,"complete":"payload","targetType":"msg","x":590,"y":525,"wires":[]},{"id":"6ba4ec46.476794","type":"debug","z":"9138b11f.f64d5","name":"Output 2","active":true,"tosidebar":true,"console":false,"tostatus":true,"complete":"payload","targetType":"msg","x":590,"y":585,"wires":[]},{"id":"a2e806c8.ffa168","type":"debug","z":"9138b11f.f64d5","name":"Output 3","active":true,"tosidebar":true,"console":false,"tostatus":true,"complete":"payload","targetType":"msg","x":590,"y":645,"wires":[]},{"id":"8aabdb51.e8b538","type":"inject","z":"9138b11f.f64d5","name":"Set state 0 - turn off","props":[{"p":"payload"},{"p":"topic","vt":"str"}],"repeat":"","crontab":"","once":false,"onceDelay":0.1,"topic":"","payload":"0","payloadType":"num","x":180,"y":675,"wires":[["e46083e4.1f17b"]]},{"id":"d1722dee.48db4","type":"inject","z":"9138b11f.f64d5","name":"Set state 1 - send to output 1","props":[{"p":"payload"},{"p":"topic","vt":"str"}],"repeat":"","crontab":"","once":false,"onceDelay":0.1,"topic":"","payload":"1","payloadType":"num","x":210,"y":720,"wires":[["e46083e4.1f17b"]]},{"id":"4bdb08de.706328","type":"inject","z":"9138b11f.f64d5","name":"Set state 2 - send to output 2","props":[{"p":"payload"},{"p":"topic","vt":"str"}],"repeat":"","crontab":"","once":false,"onceDelay":0.1,"topic":"","payload":"2","payloadType":"num","x":210,"y":765,"wires":[["e46083e4.1f17b"]]},{"id":"220ce0a6.cf81e","type":"inject","z":"9138b11f.f64d5","name":"Set state 3 - send to output 3","props":[{"p":"payload"},{"p":"topic","vt":"str"}],"repeat":"","crontab":"","once":false,"onceDelay":0.1,"topic":"","payload":"3","payloadType":"num","x":210,"y":810,"wires":[["e46083e4.1f17b"]]},{"id":"e46083e4.1f17b","type":"change","z":"9138b11f.f64d5","name":"Set flow.state","rules":[{"t":"set","p":"state","pt":"flow","to":"payload","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":470,"y":720,"wires":[[]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

In the example flow, the top flow represents the stream of messages that can be stopped or routed to one of the three outputs by the <code class="node">Switch</code> node.

The bottom flow provides a set of <code class="node">Inject</code> nodes to change
the current value of the `flow.state` context property.

This can be used as a simple gate like function - based on the value of some other input, that you store into the `flow.state` context property.

This shows how the routing in one flow can be changed by a separate flow.
