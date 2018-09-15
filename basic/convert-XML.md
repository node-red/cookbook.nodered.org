---
layout: default
title: Convert to/from XML
---

### Problem

You want to convert an XML string into a JavaScript object and vice-versa.

### Solution

Use the <code class="node">XML</code> node.

#### Example

![](/images/basic/basic-flow-018.png)

{% raw %}
~~~json
[{"id":"cd115bfd.1fb228","type":"tab","label":"Data formats","disabled":false,"info":"# **Convert to/from XML**\n\n## **Problem**\nYou want to convert an XML string into a JavaScript object and vice-versa.\n\n## **Solution**\nUse the XML node.\n\n## **Example**\n![messages](/ckbk/basic-flow-018.png)\n\n## **Discussion**\nThe XML node works in either direction without any specific configuration."},{"id":"12e6122e.f9187e","type":"comment","z":"cd115bfd.1fb228","name":"Convert to/from XML","info":"XML source: https://www.w3schools.com/xml/simple.xml","x":170,"y":60,"wires":[]},{"id":"619c120.ddb28f","type":"inject","z":"cd115bfd.1fb228","name":"trigger only","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":140,"y":180,"wires":[["ed324e08.84077"]]},{"id":"8f2bbfc3.8b956","type":"xml","z":"cd115bfd.1fb228","name":"object to string","property":"payload","attr":"","chr":"","x":340,"y":280,"wires":[["626cc163.bc2db"]]},{"id":"5a80bf2b.a0fd","type":"inject","z":"cd115bfd.1fb228","name":"XML object","topic":"","payload":"{\"breakfast_menu\":{\"food\":[{\"name\":[\"Belgian Waffles\"],\"price\":[\"$5.95\"],\"description\":[\"\\nTwo of our famous Belgian Waffles with plenty of real maple syrup\\n\"],\"calories\":[\"650\"]},{\"name\":[\"Strawberry Belgian Waffles\"],\"price\":[\"$7.95\"],\"description\":[\"\\nLight Belgian waffles covered with strawberries and whipped cream\\n\"],\"calories\":[\"900\"]},{\"name\":[\"Berry-Berry Belgian Waffles\"],\"price\":[\"$8.95\"],\"description\":[\"\\nLight Belgian waffles covered with an assortment of fresh berries and whipped cream\\n\"],\"calories\":[\"900\"]},{\"name\":[\"French Toast\"],\"price\":[\"$4.50\"],\"description\":[\"\\nThick slices made from our homemade sourdough bread\\n\"],\"calories\":[\"600\"]},{\"name\":[\"Homestyle Breakfast\"],\"price\":[\"$6.95\"],\"description\":[\"\\nTwo eggs, bacon or sausage, toast, and our ever-popular hash browns\\n\"],\"calories\":[\"950\"]}]}}","payloadType":"json","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":140,"y":280,"wires":[["8f2bbfc3.8b956"]]},{"id":"3dd89b68.e90c94","type":"debug","z":"cd115bfd.1fb228","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","x":690,"y":180,"wires":[]},{"id":"eadcb5eb.8b2d88","type":"xml","z":"cd115bfd.1fb228","name":"string to object","property":"payload","attr":"","chr":"","x":500,"y":180,"wires":[["3dd89b68.e90c94"]]},{"id":"ed324e08.84077","type":"template","z":"cd115bfd.1fb228","name":"XML string","field":"payload","fieldType":"msg","format":"html","syntax":"plain","template":"<breakfast_menu>\n<food>\n<name>Belgian Waffles</name>\n<price>$5.95</price>\n<description>\nTwo of our famous Belgian Waffles with plenty of real maple syrup\n</description>\n<calories>650</calories>\n</food>\n<food>\n<name>Strawberry Belgian Waffles</name>\n<price>$7.95</price>\n<description>\nLight Belgian waffles covered with strawberries and whipped cream\n</description>\n<calories>900</calories>\n</food>\n<food>\n<name>Berry-Berry Belgian Waffles</name>\n<price>$8.95</price>\n<description>\nLight Belgian waffles covered with an assortment of fresh berries and whipped cream\n</description>\n<calories>900</calories>\n</food>\n<food>\n<name>French Toast</name>\n<price>$4.50</price>\n<description>\nThick slices made from our homemade sourdough bread\n</description>\n<calories>600</calories>\n</food>\n<food>\n<name>Homestyle Breakfast</name>\n<price>$6.95</price>\n<description>\nTwo eggs, bacon or sausage, toast, and our ever-popular hash browns\n</description>\n<calories>950</calories>\n</food>\n</breakfast_menu>","output":"str","x":310,"y":180,"wires":[["eadcb5eb.8b2d88"]]},{"id":"626cc163.bc2db","type":"debug","z":"cd115bfd.1fb228","name":"XML string","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","x":530,"y":280,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The <code class="node">XML</code> node works in either direction without any specific configuration.
