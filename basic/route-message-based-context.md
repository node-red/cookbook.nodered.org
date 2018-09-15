---
layout: default
title: Route a message based on a context property
---

### Problem

You want that a value stored in the flow context determines to which switch output a message will be routed.

### Solution

Use a <code class="node">Switch</code> node. Select the content property and define the rules to each output.

#### Example

![](/images/basic/basic-flow-009.png)

{% raw %}
~~~json
[{"id":"964fa232.b1d9d","type":"tab","label":"Flow control","disabled":false,"info":"# **Route a message based on a context property**\n\n## **Problem**\nYou want that a value stored in the flow context determines to which switch output a message will be routed.\n\n## **Solution**\nUse a switch node. Select the content property and define the rules to each output.\n\n## **Example**\n![messages](/ckbk/basic-flow-009.png)\n\n## **Discussion**\nThere is an auxiliary flow used to set the context variable. In this recipe example it stores in flow.color the value taken from msg.payload. When the flow is deployed it will set the property flow.color with a value. You can change the property value by clicking in the inject nodes.\n"},{"id":"a66604a9.9600f8","type":"comment","z":"964fa232.b1d9d","name":"Route a message based on a context property","info":"","x":250,"y":60,"wires":[]},{"id":"9cbc8188.a3bdf","type":"switch","z":"964fa232.b1d9d","name":"Context based forward","property":"color","propertyType":"flow","rules":[{"t":"eq","v":"#FF0000","vt":"str"},{"t":"eq","v":"#00FF00","vt":"str"},{"t":"eq","v":"#0000FF","vt":"str"}],"checkall":"true","repair":false,"outputs":3,"x":320,"y":180,"wires":[["a112eea.e7fc01"],["39264d04.136ac2"],["7934c920.125f78"]]},{"id":"a112eea.e7fc01","type":"debug","z":"964fa232.b1d9d","name":"Output 1 - Red","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","x":540,"y":140,"wires":[]},{"id":"a1ffea5b.334148","type":"inject","z":"964fa232.b1d9d","name":"Red","topic":"","payload":"#FF0000","payloadType":"str","repeat":"","crontab":"","once":true,"onceDelay":0.1,"x":130,"y":340,"wires":[["234d90e1.40f45"]]},{"id":"ec678b06.429da8","type":"inject","z":"964fa232.b1d9d","name":"Green","topic":"","payload":"#00FF00","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":130,"y":380,"wires":[["234d90e1.40f45"]]},{"id":"cbf66f07.1f1e6","type":"debug","z":"964fa232.b1d9d","name":"Allowed","active":false,"tosidebar":true,"console":false,"tostatus":true,"complete":"payload","x":520,"y":380,"wires":[]},{"id":"c73b33c5.c07b3","type":"inject","z":"964fa232.b1d9d","name":"Blue","topic":"","payload":"#0000FF","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":130,"y":420,"wires":[["234d90e1.40f45"]]},{"id":"234d90e1.40f45","type":"change","z":"964fa232.b1d9d","name":"Set Context","rules":[{"t":"set","p":"color","pt":"flow","to":"payload","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":330,"y":380,"wires":[["cbf66f07.1f1e6"]]},{"id":"d579d186.2adb","type":"inject","z":"964fa232.b1d9d","name":"","topic":"","payload":"My string","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":140,"y":180,"wires":[["9cbc8188.a3bdf"]]},{"id":"39264d04.136ac2","type":"debug","z":"964fa232.b1d9d","name":"Output 2 - Green","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","x":550,"y":180,"wires":[]},{"id":"7934c920.125f78","type":"debug","z":"964fa232.b1d9d","name":"Output 3 - Blue","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","x":540,"y":220,"wires":[]},{"id":"c0536f39.75b1f","type":"comment","z":"964fa232.b1d9d","name":"unclick this tab in the debug node and redeploy the flow","info":"","x":600,"y":340,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

There is an auxiliary flow used to set the context variable. 
In this example it stores in `flow.color` the value taken from `msg.payload`. 
When the flow is deployed it will set the property `flow.color` with a value. 
You can change the property value by clicking in the <code class="node">Inject</code> nodes.
