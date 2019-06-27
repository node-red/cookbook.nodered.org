---
layout: default
title: Perform an operation on each element in an array
slug:
  - label: flow control
    url: /#flow-control
  - operate on array
---

### Problem

You want to perform an operation on every element in an array. For example,
given an array of numbers, you want to round each value to the nearest integer.

### Solution

The <code class="node">Split</code> node can be used to send a message for every
element in the array. It can be followed by the nodes needed to operate on the
individual elements, followed by a <code class="node">Join</code> node to recombine
them back into a single array.

#### Example

![](/images/basic/operate-on-array.png){:width="645px"}

{% raw %}
~~~json
[{"id":"3149f240.c0e25e","type":"inject","z":"ac14500e.2c57d","name":"Array of decimals","topic":"","payload":"[1.67,2.98,3.12,4.99,5.50]","payloadType":"json","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":120,"y":960,"wires":[["bd57baa6.00f998"]]},{"id":"bd57baa6.00f998","type":"split","z":"ac14500e.2c57d","name":"Split array","splt":"\\n","spltType":"str","arraySplt":"1","arraySpltType":"len","stream":false,"addname":"","x":200,"y":1020,"wires":[["7ab9e9ed.d514b8"]]},{"id":"7ab9e9ed.d514b8","type":"range","z":"ac14500e.2c57d","minin":"0","maxin":"10","minout":"0","maxout":"10","action":"scale","round":true,"property":"payload","name":"Round value","x":350,"y":1020,"wires":[["f26660ab.007b3"]]},{"id":"f26660ab.007b3","type":"join","z":"ac14500e.2c57d","name":"","mode":"auto","build":"string","property":"payload","propertyType":"msg","key":"topic","joiner":"\\n","joinerType":"str","accumulate":"false","timeout":"","count":"","reduceRight":false,"x":490,"y":1020,"wires":[["f9b5abac.f13828"]]},{"id":"f9b5abac.f13828","type":"debug","z":"ac14500e.2c57d","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":550,"y":1080,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

In other programming environments, this task would be accomplished by creating a loop
over the elements of the array.

In Node-RED, the way to achieve the same thing is to turn the single message containing
the array into a stream of messages that can be processed individually and finally
recombine them back into one message.

The <code class="node">Split</code>/<code class="node">Join</code> node pair are
commonly used together to achieve this. The <code class="node">Split</code> node
adds the `msg.parts` property to each message in the stream which allows the
<code class="node">Join</code> node to properly reassemble the original message.
