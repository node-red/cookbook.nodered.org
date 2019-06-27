---
layout: default
title: Convert to/from XML
slug:
  - label: formats
    url: /#working-with-data-formats
  - xml
---

### Problem

You want to convert a message property between an XML string and the JavaScript object
it represents.

### Solution

The <code class="node">XML</code> node can be used to convert between the two
formats.

#### Example

![](/images/basic/convert-xml.png){:width="684px"}

{% raw %}
~~~json
[{"id":"1b546d47.9474e3","type":"inject","z":"64133d39.bb0394","name":"XML String","topic":"","payload":"{\"a\":1}","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":100,"y":260,"wires":[["d72b2bfd.77d068"]]},{"id":"1adf407d.6c4fe","type":"debug","z":"64133d39.bb0394","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":590,"y":260,"wires":[]},{"id":"46638890.8ae758","type":"inject","z":"64133d39.bb0394","name":"Object","topic":"","payload":"{\"note\":{\"$\":{\"priority\":\"high\"},\"to\":[\"Nick\"],\"from\":[\"Dave\"],\"heading\":[\"Reminder\"],\"body\":[\"Update the website\"]}}","payloadType":"json","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":90,"y":300,"wires":[["dae1d291.de0d2"]]},{"id":"6fefca67.3669e4","type":"debug","z":"64133d39.bb0394","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":430,"y":300,"wires":[]},{"id":"d72b2bfd.77d068","type":"template","z":"64133d39.bb0394","name":"","field":"payload","fieldType":"msg","format":"text","syntax":"plain","template":"<note priority=\"high\">\n  <to>Nick</to>\n  <from>Dave</from>\n  <heading>Reminder</heading>\n  <body>Update the website</body>\n</note>","output":"str","x":280,"y":260,"wires":[["1746464a.87aa4a"]]},{"id":"1746464a.87aa4a","type":"xml","z":"64133d39.bb0394","name":"","property":"payload","attr":"","chr":"","x":430,"y":260,"wires":[["1adf407d.6c4fe"]]},{"id":"dae1d291.de0d2","type":"xml","z":"64133d39.bb0394","name":"","property":"payload","attr":"","chr":"","x":250,"y":300,"wires":[["6fefca67.3669e4"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

In the example, the first flow injects the XML:

~~~xml
<note priority="high">
  <to>Nick</to>
  <from>Dave</from>
  <heading>Reminder</heading>
  <body>Update the website</body>
</note>
~~~

The <code class="node">XML</code> node then converts it to the equivalent JavaScript
object:

~~~json
{
    "note": {
        "$": {
            "priority":"high"
        },
        "to": ["Nick"],
        "from": ["Dave"],
        "heading": ["Reminder"],
        "body": ["Update the website"]
    }
}
~~~

Note how the attributes of the `<note>` tag have been added under the `$` property
of the `note` object.

The second flow does the reverse, injecting that object and converting it to XML.

When a particular XML output format is required, it can be easier to start by
injecting that into the <code class="node">XML</code> node to see the necessary
JavaScript object required to generate it when fed back the other way.
