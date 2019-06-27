---
layout: default
title: Set the URL of a request using a template
slug:
  - label: http
    url: /#http-requests
  - set url
---

### Problem

You want to dynamically set the URL of an HTTP request where only parts of the url change between requests.

### Solution

Configure the <code class="node">HTTP Request</code> node to generate a URL dynamically using a [mustache](http://mustache.github.io/mustache.5.html) URL template.

#### Example

![](/images/http/set-request-url-template.png)

{% raw %}
~~~json
[{"id":"41747a17.54ffd4","type":"http request","z":"c9a81b70.8abed8","name":"","method":"GET","ret":"txt","url":"https://jsonplaceholder.typicode.com/posts/{{post}}","tls":"","x":550,"y":480,"wires":[["d682318c.36823"]]},{"id":"d682318c.36823","type":"debug","z":"c9a81b70.8abed8","name":"","active":true,"console":"false","complete":"payload","x":710,"y":480,"wires":[]},{"id":"90bfea22.dd2b98","type":"inject","z":"c9a81b70.8abed8","name":"post id","topic":"","payload":"2","payloadType":"str","repeat":"","crontab":"","once":false,"x":250,"y":480,"wires":[["e67a0cc.596d4f"]]},{"id":"e67a0cc.596d4f","type":"change","z":"c9a81b70.8abed8","name":"","rules":[{"t":"set","p":"post","pt":"msg","to":"payload","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":390,"y":480,"wires":[["41747a17.54ffd4"]]}]
~~~
{: .flow}
{% endraw %}

In this flow, the <code class="node">Inject</code> node sends an id for a post we would like to request from an API.  The <code class="node">Change</code> node changes this to `msg.post`.  The <code class="node">HTTP Request</code> node generates a URL by substituting `msg.post` of the URL property configured as shown:

{% raw %}
~~~text
https://jsonplaceholder.typicode.com/posts/{{post}}
~~~
{% endraw %}

The JSON output from this API in the debug panel will look as follows:

{% raw %}
~~~text
{
  "userId": 1,
  "id": 2,
  "title": "qui est esse",
  "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
}
~~~
{% endraw %}

#### Discussion

By default, mustache will escape any HTML entities in the values it substitutes. To ensure HTML escaping is not used in your URL use `{% raw %}{{{triple}}}{% endraw %}` braces.
