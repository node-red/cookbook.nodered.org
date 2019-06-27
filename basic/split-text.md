---
layout: default
title: Split text into one message per line
slug:
  - label: formats
    url: /#working-with-data-formats
  - text
---

### Problem

You want to perform an operation on every line in a block text. For example,
you want to add the line number to the beginning of each line.

### Solution

The <code class="node">Split</code> node can be used to split the message into
one message per line. It can be followed by the nodes needed to operate on the
individual lines of text, followed by a <code class="node">Join</code> node to
recombine them back into a single block of text.


#### Example

![](/images/basic/split-text.png){:width="717px"}

{% raw %}
~~~json
[{"id":"df6514f0.029748","type":"inject","z":"64133d39.bb0394","name":"inject","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":"","x":110,"y":900,"wires":[["11f53f61.2f7be1"]]},{"id":"11f53f61.2f7be1","type":"template","z":"64133d39.bb0394","name":"","field":"payload","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"one\ntwo\nthree\nfour\nfive","x":240,"y":900,"wires":[["760c1d71.c29744"]]},{"id":"760c1d71.c29744","type":"split","z":"64133d39.bb0394","name":"","splt":"\\n","x":190,"y":960,"wires":[["3e427aac.9b9596"]]},{"id":"3e427aac.9b9596","type":"change","z":"64133d39.bb0394","name":"Prepend line number","rules":[{"t":"set","p":"payload","pt":"msg","to":"(parts.index+1) & \": \" & payload","tot":"jsonata"}],"action":"","property":"","from":"","to":"","reg":false,"x":360,"y":960,"wires":[["d44d4767.945fd8"]]},{"id":"d44d4767.945fd8","type":"join","z":"64133d39.bb0394","name":"","mode":"auto","build":"string","property":"payload","propertyType":"msg","key":"topic","joiner":"\\n","timeout":"","count":"","x":530,"y":960,"wires":[["bfe3e43b.85fa88"]]},{"id":"bfe3e43b.85fa88","type":"debug","z":"64133d39.bb0394","name":"debug","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","x":650,"y":960,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

In the example, the <code class="node">Inject</code> and <code class="node">Template</code>
nodes are used to inject a block of text with multiple lines.

~~~text
one
two
three
four
five
~~~

The <code class="node">Split</code> node's default behaviour when passed a string
is to split it into one message per line.

The <code class="node">Change</code> node modifies each message payload using
a JSONata expression: `(parts.index+1) & ": " & payload` - which uses `msg.parts.index`
to get the line number and prepends it to the existing `msg.payload`.

Finally the <code class="node">Join</code> node reassembles the messages into
a single block of text:

~~~text
1: one
2: two
3: three
4: four
5: five
~~~
