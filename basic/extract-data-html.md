---
layout: default
title: Extracting data from an HTML page
---

### Problem

You want to connect to a web page and retrieve some data.

### Solution

Use the <code class="node">html</code> node found in the function session of the node pallete.

#### Example

![](/images/basic/basic-flow-021.png)

{% raw %}
~~~json
[{"id":"3af458b8.7cfae8","type":"tab","label":"Data formats","disabled":false,"info":"# **Extracting data from an HTML page**\n\n## **Problem**\nYou want to connect to a web page and retrieve some data.\n\n## **Solution**\nUse the html node found in the function session of the node pallete.\n\n## **Example**\n![messages](/ckbk/basic-flow-021.png)\n\n## **Discussion**\nConfigure the html node with the CSS selection, in this use case it was used the class selector .node-red-latest-version\n"},{"id":"8414ba0f.ba1e48","type":"inject","z":"3af458b8.7cfae8","name":"make request","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":"","x":150,"y":120,"wires":[["e515066f.813f58"]]},{"id":"e515066f.813f58","type":"http request","z":"3af458b8.7cfae8","name":"https://nodered.org","method":"GET","ret":"txt","url":"https://nodered.org","tls":"","x":334.5,"y":120,"wires":[["497aa83b.a0d4f8"]]},{"id":"c49cfac1.1b3548","type":"debug","z":"3af458b8.7cfae8","name":"","active":true,"console":"false","complete":"false","x":750,"y":120,"wires":[]},{"id":"497aa83b.a0d4f8","type":"html","z":"3af458b8.7cfae8","name":"Select latest version","property":"payload","outproperty":"payload","tag":".node-red-latest-version","ret":"text","as":"multi","x":560,"y":120,"wires":[["c49cfac1.1b3548"]]},{"id":"359317bd.b90558","type":"comment","z":"3af458b8.7cfae8","name":"Extracting data from an HTML page","info":"","x":200,"y":60,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

Configure the <code class="node">html</code> node with the CSS selection, in this use case it was used the class selector `.node-red-latest-version`
