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
[{"id":"2fcc167e.b6f18a","type":"inject","z":"eda2a949.74ea98","name":"make request","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"x":141,"y":102,"wires":[["68587eb0.051ad"]]},{"id":"68587eb0.051ad","type":"http request","z":"eda2a949.74ea98","name":"","method":"GET","ret":"txt","url":"https://www.google.com/finance","tls":"","x":305.5,"y":102,"wires":[["292a93f0.7f8fac"]]},{"id":"9835e7c5.d487a8","type":"debug","z":"eda2a949.74ea98","name":"","active":true,"console":"false","complete":"false","x":638,"y":102,"wires":[]},{"id":"292a93f0.7f8fac","type":"html","z":"eda2a949.74ea98","name":"","tag":"td.bld span","ret":"html","as":"single","x":472.5,"y":102,"wires":[["9835e7c5.d487a8"]]}]
~~~
{: .flow}
{% endraw %}

To find content in a web page, the Chrome browser’s ‘Inspect Element’ can be a useful tool.  Using the browser, right click on a page element to see the tags, ids and classes applied to an element.

In this example we want to extract the Dow Jones, S&P 500 and Nasdaq indexes from the Google finance page at [`http://www.google.com/finance`](http://www.google.com/finance) shown below.  Using the inspector we can see the indexes are in a `<span>` tag inside a `<td>` tag with the class `bld`. The appropriate CSS selector is `td.bld span`.

![](/images/http/http-flow-011-example-page.png)




