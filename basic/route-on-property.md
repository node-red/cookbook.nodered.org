---
layout: default
title: Route a message based on one of its properties
---

### Problem

You want to route a message to different flows according to the value of the
`msg.topic` property. For example, you have an <code class="node">MQTT</code> node
subscribed to multiple sensors and you want to pass the messages to different
Dashboard <code class="node">ui_gauge</code> nodes.

### Solution

Use the <code class="node">Switch</code> node to check the value of the property
against different values corresponding to different outputs of the node.

#### Example

![](/images/basic/route-on-property.png){:width="601px"}

{% raw %}
~~~json
[{"id":"3bc8e1d2.744abe","type":"switch","z":"ac14500e.2c57d","name":"Route ","property":"topic","propertyType":"msg","rules":[{"t":"eq","v":"temperature","vt":"str"},{"t":"eq","v":"humidity","vt":"str"},{"t":"eq","v":"pressure","vt":"str"}],"checkall":"true","repair":false,"outputs":3,"x":330,"y":420,"wires":[["907bf3b8.def45"],["fe425938.926838"],["ec261304.52f73"]]},{"id":"be3da36c.1c142","type":"inject","z":"ac14500e.2c57d","name":"","topic":"temperature","payload":"27","payloadType":"num","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":140,"y":380,"wires":[["3bc8e1d2.744abe"]]},{"id":"f271ceef.172b3","type":"inject","z":"ac14500e.2c57d","name":"","topic":"humidity","payload":"45","payloadType":"num","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":130,"y":420,"wires":[["3bc8e1d2.744abe"]]},{"id":"907bf3b8.def45","type":"debug","z":"ac14500e.2c57d","name":"Temperature","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","x":510,"y":380,"wires":[]},{"id":"fe425938.926838","type":"debug","z":"ac14500e.2c57d","name":"Humidity","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","x":500,"y":420,"wires":[]},{"id":"ec261304.52f73","type":"debug","z":"ac14500e.2c57d","name":"Pressure","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","x":500,"y":460,"wires":[]},{"id":"fca957dd.9d8078","type":"inject","z":"ac14500e.2c57d","name":"","topic":"pressure","payload":"1001","payloadType":"num","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":130,"y":460,"wires":[["3bc8e1d2.744abe"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

The <code class="node">Switch</code> node will send on messages it receives on the
outputs that corresponding to rules that match.

It can be configured to send on all rules that match, or only on the first one that
matches.
