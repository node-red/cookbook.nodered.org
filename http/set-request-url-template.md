---
layout: default
title: Set the URL of a request using a template
---

### Problem

You want to set the URL of an HTTP request using a <code class="node">Template</code> node to change part of the URL.

### Solution

Configure the <code class="node">Template</code> node to generate a `message.url` property.  The <code class="node">Template</code> node can then be used to generate the URL dynamically using message properties.

#### Example

![](/images/http/http-flow-013.png)

{% raw %}
~~~json
[{"id":"70e33d82.3d16a4","type":"template","z":"c9a81b70.8abed8","name":"generate url","field":"url","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"https://jsonplaceholder.typicode.com/posts/{{post}}","x":390,"y":360,"wires":[["9092c409.cfcfd8"]]},{"id":"9092c409.cfcfd8","type":"http request","z":"c9a81b70.8abed8","name":"","method":"GET","ret":"txt","url":"","x":550,"y":360,"wires":[["800e85b4.346968"]]},{"id":"800e85b4.346968","type":"debug","z":"c9a81b70.8abed8","name":"","active":true,"console":"false","complete":"payload","x":710,"y":360,"wires":[]},{"id":"efd08b9c.086e48","type":"inject","z":"c9a81b70.8abed8","name":"post id","topic":"","payload":"2","payloadType":"str","repeat":"","crontab":"","once":false,"x":90,"y":360,"wires":[["22bf350f.d1b29a"]]},{"id":"22bf350f.d1b29a","type":"change","z":"c9a81b70.8abed8","name":"","rules":[{"t":"set","p":"post","pt":"msg","to":"payload","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":230,"y":360,"wires":[["70e33d82.3d16a4"]]}]
~~~
{: .flow}
{% endraw %}

In this flow, the <code class="node">Inject</code> node sends an id for a post we would like to request from an API.  The <code class="node">Change</code> node changes this to `msg.post`.  The <code class="node">Template</code> node generates a URL by substituting `msg.post` in the URL using [mustache templating](http://mustache.github.io/mustache.5.html).

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
