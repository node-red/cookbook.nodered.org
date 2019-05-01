---
layout: default
title: Simple GET request
---

### Problem

You want to make a simple GET request to a web site and extract useful information.

### Solution

Use the <code class="node">HTTP Request</code> node to make an HTTP request and an
<code class="node">HTML</code> node to extract elements from the retrieved html document.

#### Example

![](/images/http/simple-get-request.png)

{% raw %}
~~~json
[{"id":"d88dd470.0ac7b8","type":"inject","z":"18c99b30.cf9d35","name":"make request","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"x":130,"y":180,"wires":[["874a3d4e.9b666"]]},{"id":"874a3d4e.9b666","type":"http request","z":"18c99b30.cf9d35","name":"","method":"GET","ret":"txt","url":"https://nodered.org","tls":"","x":294.5,"y":180,"wires":[["90243cc1.87edc"]]},{"id":"7403c68f.21d7c8","type":"debug","z":"18c99b30.cf9d35","name":"","active":true,"console":"false","complete":"false","x":650,"y":180,"wires":[]},{"id":"90243cc1.87edc","type":"html","z":"18c99b30.cf9d35","name":"","property":"","tag":".node-red-latest-version","ret":"text","as":"single","x":471.5,"y":180,"wires":[["7403c68f.21d7c8"]]}]
~~~
{: .flow}
{% endraw %}

To find content in a web page, the Chrome browser’s ‘Inspect Element’ can be a
useful tool.  Using the browser, right click on a page element to see the tags,
ids and classes applied to an element as shown.

In this example we retrieve the latest version of Node-RED from [https://nodered.org]().
Using the inspector we can see the version is located in a `<span>` tag with the
class `node-red-latest-version`.

The <code class="node">HTML</code> node can be configured with the CSS selector
`.node-red-latest-version` to return a message for each matching element.

![](/images/http/simple-get-request-example-page.png)
