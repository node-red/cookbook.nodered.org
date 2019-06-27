---
layout: default
title: Serve a local file
slug:
  - label: http
    url: /#http-endpoints
  - serve file
---

### Problem

You want to create an HTTP endpoint that responds to GET requests with content
from a local file, such an png image.

### Solution

Use the <code class="node">File In</code> node to load the required content and
set the `Content-Type` to the appropriate value for the file type being returned.

#### Example

![](/images/http/serve-a-local-file.png)

{% raw %}
~~~json
[{"id":"c7e341a0.381cc","type":"http in","z":"3045204d.cfbae","name":"","url":"/hello-file","method":"get","swaggerDoc":"","x":110,"y":720,"wires":[["2fb1c354.d04e3c"]]},{"id":"2fb1c354.d04e3c","type":"file in","z":"3045204d.cfbae","name":"","filename":"/tmp/node-red.png","format":"","x":290,"y":720,"wires":[["c9e28681.361d78"]]},{"id":"c9e28681.361d78","type":"change","z":"3045204d.cfbae","name":"Set Headers","rules":[{"t":"set","p":"headers","pt":"msg","to":"{}","tot":"json"},{"t":"set","p":"headers.content-type","pt":"msg","to":"image/png","tot":"str"}],"action":"","property":"","from":"","to":"","reg":false,"x":470,"y":720,"wires":[["88974243.7768c"]]},{"id":"88974243.7768c","type":"http response","z":"3045204d.cfbae","name":"","x":610,"y":720,"wires":[]}]
~~~
{: .flow}
{% endraw %}

~~~text
[~]$ curl  http://localhost:1880/hello-file > file.png
~~~
{: .shell}

### Discussion

When loading a non-text file such as an image, the <code class="node">File In</code>
node must be configured to return a `Buffer` object.

So that the receiver knows how to handle the file, the `Content-Type` header must
be set to the appropriate mime type. The example above, which returns a `.png` file
sets the `Content-Type` header to `image/png`.
