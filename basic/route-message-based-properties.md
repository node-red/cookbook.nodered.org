---
layout: default
title: Route a message based on one of its properties
---

### Problem

You want to route the message according to the property `msg.topic`.

### Solution

Use the <code class="node">Switch</code> node configured with the property to be checked against the rules

#### Example

![](/images/basic/basic-flow-008.png)

{% raw %}
~~~json
[{"id":"fa622608.7eb528","type":"tab","label":"Flow control","disabled":false,"info":"# **Route a message based on one of its properties**\n\n## **Problem**\nYou want to route the message according to the property msg.topic.\n\n## **Solution**\nUse the switch node configured with the property to be checked against the rules.\n\n## **Example**\n![messages](/ckbk/basic-flow-008.png)\n\n## **Discussion**\nYou can configure the switch node to check all rules or to stop after the first match.\nIf there is no match against any rule then the message will not be forwarded. Eventually a message can be forwarded to more than one output as long as the switch node is configured to check all rules and the check is positive for the concerned output."},{"id":"e6c3ea47.029c18","type":"comment","z":"fa622608.7eb528","name":"Route a message based on one of its properties","info":"","x":260,"y":60,"wires":[]},{"id":"68ab6205.19f70c","type":"switch","z":"fa622608.7eb528","name":"Route ","property":"topic","propertyType":"msg","rules":[{"t":"eq","v":"opened","vt":"str"},{"t":"eq","v":"closed","vt":"str"},{"t":"eq","v":"opened","vt":"str"}],"checkall":"true","repair":false,"outputs":3,"x":310,"y":180,"wires":[["c98156d3.a993d8"],["2b4d5184.24abae"],["8afac32e.6126c"]]},{"id":"d0657e30.19e0e","type":"inject","z":"fa622608.7eb528","name":"","topic":"opened","payload":"","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":130,"y":140,"wires":[["68ab6205.19f70c"]]},{"id":"691aba90.62d9d4","type":"inject","z":"fa622608.7eb528","name":"","topic":"closed","payload":"","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":130,"y":180,"wires":[["68ab6205.19f70c"]]},{"id":"c98156d3.a993d8","type":"debug","z":"fa622608.7eb528","name":"Display opened","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"topic","x":480,"y":140,"wires":[]},{"id":"2b4d5184.24abae","type":"debug","z":"fa622608.7eb528","name":"Display closed","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"topic","x":480,"y":180,"wires":[]},{"id":"8afac32e.6126c","type":"debug","z":"fa622608.7eb528","name":"Display opened","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"topic","x":480,"y":220,"wires":[]},{"id":"d0993657.d15078","type":"inject","z":"fa622608.7eb528","name":"","topic":"invalid","payload":"","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":130,"y":220,"wires":[["68ab6205.19f70c"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

You can configure the switch node to check all rules or to stop after the first match.
If there is no match against any rule then the message will not be forwarded. 
Eventually a message can be forwarded to more than one output as long as the switch node is configured to check all rules and the check is positive for the concerned output.
