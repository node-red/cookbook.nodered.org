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
[{"id":"3cc88e40.b187f2","type":"tab","label":"Flow control","disabled":false,"info":"# **Perform an operation on each element in an array**\n\n## **Problem**\nYou want to round each number from an array to the nearest integer.\n\n## **Solution**\nUse a split node to separate the array into individual elements. \nUse a range node to round each element.\n\n## **Example**\n![messages](/ckbk/basic-flow-010.png)\n\n## **Discussion**\nYou can think of the split node as doing a for-loop to iterate over each element of the array. \nNote that the split node add the property parts to the message to keep control of each iteration.\n"},{"id":"c858c23f.b48cf","type":"comment","z":"3cc88e40.b187f2","name":"Perform an operation on each element in an array","info":"","x":260,"y":60,"wires":[]},{"id":"9141ea9c.fd4e48","type":"inject","z":"3cc88e40.b187f2","name":"Array of decimals","topic":"","payload":"[1.67,2.98,3.12,4.99,5.50]","payloadType":"json","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":120,"y":180,"wires":[["65d694f5.c425cc"]]},{"id":"65d694f5.c425cc","type":"split","z":"3cc88e40.b187f2","name":"","splt":"\\n","spltType":"str","arraySplt":"1","arraySpltType":"len","stream":false,"addname":"","x":290,"y":180,"wires":[["c63adcb2.87a4"]]},{"id":"c63adcb2.87a4","type":"range","z":"3cc88e40.b187f2","minin":"0","maxin":"10","minout":"0","maxout":"10","action":"scale","round":true,"property":"payload","name":"","x":440,"y":180,"wires":[["2efff0d5.028b8"]]},{"id":"2efff0d5.028b8","type":"debug","z":"3cc88e40.b187f2","name":"Output msg","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"true","x":600,"y":180,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

You can think of the <code class="node">Split</code> node as doing a for-loop to iterate over each element of the array. 
Note that the <code class="node">Split</code> node add the property parts to the message to keep control of each iteration.
