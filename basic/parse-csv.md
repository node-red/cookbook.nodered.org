---
layout: default
title: Parse CSV input
slug:
  - label: formats
    url: /#working-with-data-formats
  - csv
---

### Problem

You want to parse CSV data to work with the values it contains.

### Solution

The <code class="node">CSV</code> node can be used to parse CSV and generate
JavaScript objects from it.


#### Example

![](/images/basic/parse-csv.png){:width="660px"}

{% raw %}
~~~json
[{"id":"73e4e16.4d9742","type":"inject","z":"64133d39.bb0394","name":"Inject","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":110,"y":780,"wires":[["2bef78fd.ae70f8"]]},{"id":"90ed51dc.dcc71","type":"csv","z":"64133d39.bb0394","name":"","sep":",","hdrin":true,"hdrout":false,"multi":"mult","ret":"\\n","temp":"","skip":"1","x":410,"y":780,"wires":[["9aace6e7.adc538"]]},{"id":"9aace6e7.adc538","type":"debug","z":"64133d39.bb0394","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":570,"y":780,"wires":[]},{"id":"2bef78fd.ae70f8","type":"template","z":"64133d39.bb0394","name":"CSV data","field":"payload","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"# This is some random data\na,b,c\n80,18,2\n52,36,10\n91,18,61\n32,47,65","output":"str","x":260,"y":780,"wires":[["90ed51dc.dcc71"]]}]
~~~
{: .flow}
{% endraw %}

### Discussion

In the example, the flow injects a payload containing CSV data:

```javascript
# This is some random data
a,b,c
80,18,2
52,36,10
91,18,61
32,47,65
```

The <code class="node">CSV</code> has been configured to ignore the first line of
the input so it ignores the initial comment line. It then uses the next line to
get the column names, and the remaining rows for the data.


In this particular example, the node has also been configured to send a single
message with all of the data. This results in a message with the payload:

```javascript
[
    { a: 80, b: 18, c: 2},
    { a: 52, b: 36, c: 10},
    { a: 91, b: 18, c: 61},
    { a: 32, b: 47, c: 65},
]
```

It is also possible to configure the node to emit one message for each row of data.
In this mode, the messages will also include the `msg.parts` property that allows
them to be passed to a <code class="node">Join</code> node to reassemble them back
into a single array.
