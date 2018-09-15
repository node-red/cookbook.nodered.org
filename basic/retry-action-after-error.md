---
layout: default
title: Automatically retry an action after an error
---

### Problem

You want to activate an error handling flow to access and alternate web page in case the original one results in errror.

### Solution

Use the <code class="node">Catch</code> node connected to an error handling code and retry the http request.

#### Example

![](/images/basic/basic-flow-016.png)

{% raw %}
~~~json
[{"id":"a4ec8c83.1cf2e","type":"tab","label":"Error handling","disabled":false,"info":"# **Automatically retry an action after an error**\n\n## **Problem**\nYou want to activate an error handling flow to access and alternate web page in case the original one results in errror.\n\n## **Solution**\nUse the catch node connected to an error handling code and retry the http request.\n\n## **Example**\n![messages](/ckbk/basic-flow-016.png)\n\n## **Discussion**\nIn this example the error handling code is a simple selection of another URL.\n"},{"id":"5ba7cf46.e1b0c","type":"comment","z":"a4ec8c83.1cf2e","name":"Automatically retry an action after an error","info":"","x":240,"y":60,"wires":[]},{"id":"35796411.c8324c","type":"catch","z":"a4ec8c83.1cf2e","name":"","scope":null,"x":100,"y":220,"wires":[["14812696.fd08c9"]]},{"id":"1a4a129b.b6a38d","type":"http request","z":"a4ec8c83.1cf2e","name":"","method":"use","ret":"txt","url":"","tls":"","x":490,"y":160,"wires":[["f0221d62.7f9de"]]},{"id":"ae962f60.69579","type":"inject","z":"a4ec8c83.1cf2e","name":"","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":120,"y":160,"wires":[["9de0fa7c.9daa58"]]},{"id":"f0221d62.7f9de","type":"debug","z":"a4ec8c83.1cf2e","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":650,"y":160,"wires":[]},{"id":"9de0fa7c.9daa58","type":"change","z":"a4ec8c83.1cf2e","name":"Get to wrong URL","rules":[{"t":"set","p":"url","pt":"msg","to":"https://nodered.com","tot":"str"},{"t":"set","p":"method","pt":"msg","to":"GET","tot":"str"}],"action":"","property":"","from":"","to":"","reg":false,"x":290,"y":160,"wires":[["1a4a129b.b6a38d"]]},{"id":"14812696.fd08c9","type":"change","z":"a4ec8c83.1cf2e","name":"Get to correct URL","rules":[{"t":"set","p":"url","pt":"msg","to":"https://nodered.org/","tot":"str"},{"t":"set","p":"method","pt":"msg","to":"GET","tot":"str"}],"action":"","property":"","from":"","to":"","reg":false,"x":290,"y":220,"wires":[["1a4a129b.b6a38d"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

In this example the error handling code is a simple selection of another URL.
