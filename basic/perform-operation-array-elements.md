---
layout: default
title: Perform an operation on each element in an array
---

### Problem

You want to round each number from an array to the nearest integer.

### Solution

Use a <code class="node">Split</code> node to separate the array into individual elements. 
Use a <code class="node">Range</code> node to round each element.

#### Example

![](/images/basic/basic-flow-010.png)

{% raw %}
~~~json
[{"id":"3cc88e40.b187f2","type":"tab","label":"Flow control","disabled":false,"info":""},{"id":"c858c23f.b48cf","type":"comment","z":"3cc88e40.b187f2","name":"Perform an operation on each element in an array","info":"","x":200,"y":100,"wires":[]},{"id":"9141ea9c.fd4e48","type":"inject","z":"3cc88e40.b187f2","name":"Array of decimals","topic":"","payload":"[1.67,2.98,3.12,4.99,5.50]","payloadType":"json","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":120,"y":180,"wires":[["65d694f5.c425cc"]]},{"id":"65d694f5.c425cc","type":"split","z":"3cc88e40.b187f2","name":"Split array","splt":"\\n","spltType":"str","arraySplt":"1","arraySpltType":"len","stream":false,"addname":"","x":300,"y":180,"wires":[["c63adcb2.87a4"]]},{"id":"c63adcb2.87a4","type":"range","z":"3cc88e40.b187f2","minin":"0","maxin":"10","minout":"0","maxout":"10","action":"scale","round":true,"property":"payload","name":"Round checked","x":470,"y":180,"wires":[["2efff0d5.028b8"]]},{"id":"2efff0d5.028b8","type":"debug","z":"3cc88e40.b187f2","name":"Output msg","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"true","x":650,"y":180,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

You can think of the <code class="node">Split</code> node as doing a for-loop to iterate over each element of the array. 
Note that the <code class="node">Split</code> node adds <code class="highlighter-rouge">msg.parts</code> property to the message to keep control of each iteration.
