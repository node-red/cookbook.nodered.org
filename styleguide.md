---
layout: default
title: Cookbook Style Guide
---

The cookbook recipes are intended to be task-focused guides to solving specific
problems.

They should follow a standard structure. Lines beginning with `>` are comments
that should be removed:

~~~~~markdown
---
layout: default
title: A short (<10 words) summary of the task addressed
---

### Problem
> A description of the problem solved by this recipe. It should be phrased as:
You want to do X.

### Solution
> A description of the solution (the 'how') without going into too much detail (the 'why').
Use the <code class="node">Inject</code> node to do X.

#### Example
> The recipe should provide an example of the solution to illustrate it in action.

![](/images/flow-image.png)

> Paste a sample flow json that can be imported by the reader
~~~json
[{"id":"7c87b536.83784c","type":"inject","z":"55635136.aa9cb","name":"","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"x":100,"y":80,"wires":[["7de918a6.8216e8"]]}]
~~~
{: .flow}

> If the recipe can be meaningfully demonstrated in action via static text, add it here.

### Discussion
> A more detailed discussion of the solution and additional relevant information
> that will help the reader apply it to their own scenario.
The <code class="node">Inject</code> node code can be configured to do X. This
means it can...

~~~~~

The following styles should be used consistently.

#### Message properties

Message properties should be enclosed in back-ticks:

~~~~~markdown
Use the `msg.payload` property to ...
~~~~~

#### Node types

When a specific node type is mentioned, it should be styled as:

~~~~~markdown
Use the <code class="node">HTTP In</code> node to ...
~~~~~

#### Example flows

~~~~~markdown
~~~json
> insert flow json here. It should be minified and on a single line.
~~~
{: .flow}
~~~~~

#### Terminal output

~~~~~markdown
~~~text
[~]$ date
Mon 28 Nov 2016 10:55:48 GMT
~~~
{: .shell}
~~~~~

#### JavaScript samples

~~~~~markdown
~~~javascript
var name = msg.payload.name;
~~~
~~~~~

#### JSON samples

~~~~~markdown
~~~json
{
    "name": "Nick"
}
~~~
~~~~~
