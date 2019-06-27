---
layout: default
title: Generate CSV output
slug:
  - label: formats
    url: /#working-with-data-formats
  - csv
---

### Problem

You want to generate valid CSV output from a message containing key/value pairs of
data.

### Solution

The <code class="node">CSV</code> node can be used to generate well-formatted CSV
strings.

#### Example

![](/images/basic/generate-csv.png){:width="688px"}

{% raw %}
~~~json
[{"id":"457d9ad6.b737b4","type":"inject","z":"64133d39.bb0394","name":"single","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":90,"y":640,"wires":[["1e05fafd.887b05"]]},{"id":"1e05fafd.887b05","type":"change","z":"64133d39.bb0394","name":"Generate single payload","rules":[{"t":"set","p":"payload","pt":"msg","to":"{ \"a\":$floor(100*$random()),\"b\":$floor(100*$random()),\"c\":$floor(100*$random())}","tot":"jsonata"}],"action":"","property":"","from":"","to":"","reg":false,"x":270,"y":640,"wires":[["e9546682.b39898"]]},{"id":"e9546682.b39898","type":"csv","z":"64133d39.bb0394","name":"","sep":",","hdrin":"","hdrout":false,"multi":"one","ret":"\\n","temp":"a,b,c","skip":"0","x":450,"y":640,"wires":[["f83ad3b0.78d32"]]},{"id":"f83ad3b0.78d32","type":"debug","z":"64133d39.bb0394","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":590,"y":640,"wires":[]},{"id":"ae242f2c.d1c8a","type":"inject","z":"64133d39.bb0394","name":"array","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":90,"y":700,"wires":[["7535f521.4a88bc"]]},{"id":"7535f521.4a88bc","type":"change","z":"64133d39.bb0394","name":"Generate array payload","rules":[{"t":"set","p":"payload","pt":"msg","to":"[\t    { \"a\":$floor(100*$random()),\"b\":$floor(100*$random()),\"c\":$floor(100*$random())},\t    { \"a\":$floor(100*$random()),\"b\":$floor(100*$random()),\"c\":$floor(100*$random())},\t    { \"a\":$floor(100*$random()),\"b\":$floor(100*$random()),\"c\":$floor(100*$random())},\t    { \"a\":$floor(100*$random()),\"b\":$floor(100*$random()),\"c\":$floor(100*$random())}\t]","tot":"jsonata"}],"action":"","property":"","from":"","to":"","reg":false,"x":270,"y":700,"wires":[["f4e0465f.ef0338"]]},{"id":"f4e0465f.ef0338","type":"csv","z":"64133d39.bb0394","name":"","sep":",","hdrin":"","hdrout":true,"multi":"one","ret":"\\n","temp":"a,b,c","skip":"0","x":450,"y":700,"wires":[["6eb67fdf.58626"]]},{"id":"6eb67fdf.58626","type":"debug","z":"64133d39.bb0394","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":590,"y":700,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

In the example, the first flow injects a payload containing a single object with three
properties containing randomly generated values.

```javascript
{
    a: 10,
    b: 20,
    c: 30
}
```

The <code class="node">CSV</code> has been configured with the desired column names
and uses the corresponding object properties to fill in those columns.

The resulting message contains the well-formatted CSV string for that single row
of data - including a newline character at the end.

```javascript
"10,20,30\n"
```

This is suitable for passing to a <code class="node">File Out</code> node to
append to an existing CSV file.

The second flow injects an array of objects with randomly generated values:

```javascript
[
    { a: 80, b: 18, c: 2},
    { a: 52, b: 36, c: 10},
    { a: 91, b: 18, c: 61},
    { a: 32, b: 47, c: 65},
]
```

Again the CSV node has been configured with the column names to use. It has also
been configured to include the column names as the first row of output.

```javascript
a,b,c
80,18,2
52,36,10
91,18,61
32,47,65
```
