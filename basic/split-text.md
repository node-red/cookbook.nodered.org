---
layout: default
title: Split text into one message per line
---

### Problem

You want to split a text, one message per line. Each line will generate a separate <code class="highlighter-rouge">msg.payload</code> .

### Solution

Use a <code class="node">Split</code> node with the default configuration to separate strings using the sequence <code class="highlighter-rouge">\n</code>.

#### Example

![](/images/basic/basic-flow-022.png)

{% raw %}
~~~json
[{"id":"64040a64.66fd84","type":"tab","label":"Data formats","disabled":false,"info":""},{"id":"c9676832.26fec8","type":"comment","z":"64040a64.66fd84","name":"Split text into one message per line","info":"","x":220,"y":60,"wires":[]},{"id":"a8cbd92f.1aa5f8","type":"split","z":"64040a64.66fd84","name":"","splt":"\\n","spltType":"str","arraySplt":1,"arraySpltType":"len","stream":false,"addname":"","x":430,"y":160,"wires":[["d28cfeff.94e57"]]},{"id":"ecba8e11.46937","type":"inject","z":"64040a64.66fd84","name":"","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":120,"y":160,"wires":[["6cace568.fea26c"]]},{"id":"d28cfeff.94e57","type":"debug","z":"64040a64.66fd84","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":590,"y":160,"wires":[]},{"id":"6cace568.fea26c","type":"template","z":"64040a64.66fd84","name":"","field":"payload","fieldType":"msg","format":"text","syntax":"plain","template":"Node-RED is a programming tool for wiring together hardware devices, APIs and online services in new and interesting ways.\nIt provides a browser-based editor that makes it easy to wire together flows using the wide range of nodes in the palette that can be deployed to its runtime in a single-click.","output":"str","x":280,"y":160,"wires":[["a8cbd92f.1aa5f8"]]},{"id":"4640023e.eb7ebc","type":"inject","z":"64040a64.66fd84","name":"","topic":"","payload":"","payloadType":"str","repeat":"","crontab":"","once":false,"x":110,"y":220,"wires":[["22fa10da.65846"]]},{"id":"70a4964b.a611e8","type":"function","z":"64040a64.66fd84","name":"Split lines into an array","func":"//split input file into an array - 1 array element in each line\nvar a = msg.payload.split(\"\\n\");\n\n//shift off (drop) the first line\n//a.shift();\n\n//rejoin the rest\n//msg.payload = a.join(\"\\n\");\n\nreturn {\"payload\": a};","outputs":1,"noerr":0,"x":500,"y":220,"wires":[["658257e6.73eea8"]]},{"id":"658257e6.73eea8","type":"debug","z":"64040a64.66fd84","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"true","x":730,"y":220,"wires":[]},{"id":"22fa10da.65846","type":"template","z":"64040a64.66fd84","name":"","field":"payload","fieldType":"msg","format":"text","syntax":"plain","template":"Node-RED is a programming tool for wiring together hardware devices, APIs and online services in new and interesting ways.\nIt provides a browser-based editor that makes it easy to wire together flows using the wide range of nodes in the palette that can be deployed to its runtime in a single-click.","output":"str","x":280,"y":220,"wires":[["70a4964b.a611e8"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

We show two different ways to perform the text splitting. In the first flow each splitted message will be sent immediatelly to the following node. 
In the second flow each line is stored as an element in an array in the <code class="node">Function</code> node. This can be useful should you need to perform any operation with array elements.
