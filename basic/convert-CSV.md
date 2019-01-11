---
layout: default
title: Convert to/from CSV
---

### Problem

You want to convert a CSV string into a JavaScript object and vice-versa.

### Solution

Use a <code class="node">CSV</code> node.

#### Example

![](/images/basic/basic-flow-020.png)

{% raw %}
~~~json
[{"id":"d049b8b8.7ab188","type":"tab","label":"Data formats","disabled":false,"info":""},{"id":"7d055f12.f699a","type":"comment","z":"d049b8b8.7ab188","name":"Convert to/from CSV","info":"","x":170,"y":60,"wires":[]},{"id":"e47fedd8.359f8","type":"csv","z":"d049b8b8.7ab188","name":"CSV to object","sep":",","hdrin":true,"hdrout":"","multi":"mult","ret":"\\n","temp":"","skip":"0","x":440,"y":140,"wires":[["711ecc1f.7a9064"]]},{"id":"c577950b.9e5f18","type":"inject","z":"d049b8b8.7ab188","name":"trigger only","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":120,"y":140,"wires":[["793a12e7.e85cec"]]},{"id":"711ecc1f.7a9064","type":"debug","z":"d049b8b8.7ab188","name":"object","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","x":610,"y":140,"wires":[]},{"id":"c53d1395.70658","type":"debug","z":"d049b8b8.7ab188","name":"CSV","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","x":510,"y":200,"wires":[]},{"id":"8c8617dd.275fd8","type":"inject","z":"d049b8b8.7ab188","name":"Object","topic":"","payload":"[{\"city\":\"London\",\"temperature\":17,\"humidity\":40},{\"city\":\"Melbourne\",\"temperature\":35,\"humidity\":60}]","payloadType":"json","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":110,"y":200,"wires":[["ec9e4101.68b16"]]},{"id":"793a12e7.e85cec","type":"template","z":"d049b8b8.7ab188","name":"CSV","field":"payload","fieldType":"msg","format":"text","syntax":"plain","template":"city,temperature,humidity\nLondon,17,40\nMelbourne,35,60","output":"str","x":270,"y":140,"wires":[["e47fedd8.359f8"]]},{"id":"ec9e4101.68b16","type":"csv","z":"d049b8b8.7ab188","name":"object to CSV","sep":",","hdrin":true,"hdrout":true,"multi":"one","ret":"\\n","temp":"city, temperature, humidity","skip":"0","x":320,"y":200,"wires":[["c53d1395.70658"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

Note that when converting from string to object the name of each object property will be taken from the first line of the CSV file.
On the other hand to generate the CSV string from a JavaScript object you need to indicate, in the configuration node, how the CSV columns will looks like.
You do that by using a comma separate line with the name of the columns. 
You have the flexibility to change the orders of the columns by selecting the order of the elements in this line.
Also you have the possibility to choose in the configuration dialog if you want to add or not the column names in the output CSV file.
