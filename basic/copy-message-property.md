---
layout: default
title: Set a message property to another property
slug:
  - label: messages
    url: /#messages
  - copy property
---
*** Not published ***

### Problem

You want to copy a property of a message to another property.

### Solution

Use the <code class="node">Change</code> node to set the property of the message.

#### Example

![](/images/basic/copy-message-property.png){:width="616px"}

{% raw %}
~~~json
[]
~~~
{: .flow}
{% endraw %}

### Discussion

The <code class="node">Change</code> node can be used to set properties of a message.

The node supports setting various JavaScript types as well as some Node-RED specific

 - strings: `"hello world"`
 - numbers: `42`
 - boolean: `true`/`false`
 - timestamp: the current time, in milliseconds, since epoch (January 1st, 1970)
 - JSON: a JSON string that will be parsed to its Object representation

It also supports setting a property to a value based on the value of context properties,
other message properties or an JSONata expression. These are each explored more in the
following recipes:

 - [Set a message property to a context value]()
 - [Set a message property to another message property]()
