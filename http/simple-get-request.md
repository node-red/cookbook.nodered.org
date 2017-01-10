---
layout: default
title: Simple GET request
---

### Problem

You want to make a simple GET request to a web site and extract useful information.

### Solution

Use the <code class="node">HTTP Request</code> node to make HTTP requests and an <code class="node">HTML</code> node to extract elements from the retrieved html document.

#### Example

![](/images/http/http-flow-011.png)

{% raw %}
~~~json
[{"id":"a2c86463.3ee328","type":"inject","z":"17b2d76b.532c39","name":"make request","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"x":125,"y":107,"wires":[["1700e626.f9ceea"]]},{"id":"1700e626.f9ceea","type":"http request","z":"17b2d76b.532c39","name":"","method":"GET","ret":"txt","url":"http://finance.yahoo.com/market-overview/","tls":"","x":289.5,"y":107,"wires":[["7bfc150f.5b5eec"]]},{"id":"6472f825.6d6b38","type":"debug","z":"17b2d76b.532c39","name":"","active":true,"console":"false","complete":"false","x":584,"y":107,"wires":[]},{"id":"7bfc150f.5b5eec","type":"html","z":"17b2d76b.532c39","name":"","tag":".l84","ret":"html","as":"single","x":436.5,"y":107,"wires":[["6472f825.6d6b38"]]}]
~~~
{: .flow}
{% endraw %}

To find content in a web page, the Chrome browser’s ‘Inspect Element’ can be a useful tool.  Using the browser, right click on a page element to see the CSS that is applied to an element.

In this example we find all elements in the page with the class `.l84` (that’s a lowercase ‘L’ as in ‘look’) to extract the current market performance values from the page `http://finance.yahoo.com/market-overview/` shown.  

![](/images/http/http-flow-011-example-page.png)




