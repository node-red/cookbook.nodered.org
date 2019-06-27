---
layout: default
title: Automatically retry an action after an error
slug:
  - label: error handling
    url: /#error-handling
  - retry
---

### Problem

You want to retry an action after an error is thrown.

### Solution

Use the <code class="node">Catch</code> node to receive the error and connect it
back to the node that needs to retry the action.

#### Example

![](/images/basic/retry-on-error.png){:width="610px"}

{% raw %}
~~~json
[{"id":"27e61f12.c1a15","type":"inject","z":"fc046f99.4be08","name":"","topic":"","payload":"","payloadType":"date","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":100,"y":320,"wires":[["d7d08440.31b678"]]},{"id":"d7d08440.31b678","type":"function","z":"fc046f99.4be08","name":"Random error","func":"// Randomly throw an error rather than\n// pass on message.\nif (Math.random() < 0.5) {\n   node.error(\"a random error\", msg);\n} else {\n    return msg;\n}","outputs":1,"noerr":0,"x":320,"y":320,"wires":[["f22b1e9a.5d89b"]]},{"id":"f22b1e9a.5d89b","type":"debug","z":"fc046f99.4be08","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":510,"y":320,"wires":[]},{"id":"2166290d.98d736","type":"delay","z":"fc046f99.4be08","name":"","pauseType":"delay","timeout":"2","timeoutUnits":"seconds","rate":"1","nbRateUnits":"1","rateUnits":"second","randomFirst":"1","randomLast":"5","randomUnits":"seconds","drop":false,"x":240,"y":380,"wires":[["d7d08440.31b678"]]},{"id":"139b836e.7950ed","type":"catch","z":"fc046f99.4be08","name":"","scope":["d7d08440.31b678"],"uncaught":false,"x":90,"y":380,"wires":[["2166290d.98d736","9c8ab214.0ecaa"]]},{"id":"9c8ab214.0ecaa","type":"debug","z":"fc046f99.4be08","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"error","targetType":"msg","x":240,"y":440,"wires":[]}]
~~~
{: .flow}
{% endraw %}

### Discussion

Some errors are transitory and an action simply needs to be retried in order to succeed.
Alternatively, there may be some remedial action needed before retrying.

In the example flow, a <code class="node">Function</code> simulates a random
error - there is a 50% chance it will throw an error rather than pass on the message.

The <code class="node">Catch</code> receives the error which passes the message
back to the <code class="node">Function</code> node to retry. It also includes
a <code class="node">Delay</code> node as, in some circumstances, it is suitable
to wait for a short interval before retrying.
