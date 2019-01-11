---
layout: default
title: Automatically retry an action after an error
---

### Problem

You want to activate an error handling flow to retry to extract data from a webpage after an error to access the url.

### Solution

Use the <code class="node">Catch</code> node connected to an error handling code and retry the http request.

#### Example

![](/images/basic/basic-flow-016.png)

{% raw %}
~~~json
[{"id":"a4ec8c83.1cf2e","type":"tab","label":"Error handling","disabled":false,"info":""},{"id":"5ba7cf46.e1b0c","type":"comment","z":"a4ec8c83.1cf2e","name":"Automatically retry an action after an error","info":"","x":200,"y":100,"wires":[]},{"id":"35796411.c8324c","type":"catch","z":"a4ec8c83.1cf2e","name":"","scope":null,"x":100,"y":220,"wires":[["84fd6d5d.d05c4"]]},{"id":"6da9c59c.05ce6c","type":"inject","z":"a4ec8c83.1cf2e","name":"make request","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":"","x":130,"y":160,"wires":[["7a78d80e.d99698"]]},{"id":"7a78d80e.d99698","type":"http request","z":"a4ec8c83.1cf2e","name":"Wrong endpoint","method":"GET","ret":"txt","url":"https://nodered.com","tls":"","proxy":"","x":304.5,"y":160,"wires":[["de249fd9.6f865"]]},{"id":"c2e10431.178088","type":"debug","z":"a4ec8c83.1cf2e","name":"","active":true,"tosidebar":true,"console":false,"complete":"false","x":730,"y":160,"wires":[]},{"id":"de249fd9.6f865","type":"html","z":"a4ec8c83.1cf2e","name":"Select latest version","property":"payload","outproperty":"payload","tag":".node-red-latest-version","ret":"text","as":"multi","x":540,"y":160,"wires":[["c2e10431.178088"]]},{"id":"84fd6d5d.d05c4","type":"http request","z":"a4ec8c83.1cf2e","name":"Correct endpoint","method":"GET","ret":"txt","url":"https://nodered.org","tls":"","proxy":"","x":300,"y":220,"wires":[["de249fd9.6f865"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

In this example the error handling code will inject the correct url for the data extraction.
