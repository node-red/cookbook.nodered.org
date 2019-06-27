---
layout: default
title: Work with cookies
slug:
  - label: http
    url: /#http-endpoints
  - cookies
---

### Problem

You want to create an HTTP flow that uses cookies.

### Solution

The messages sent by the <code class="node">HTTP In</code> node include the
`msg.req.cookies` property that lists the cookies set on the current request.

The <code class="node">HTTP Response</code> node will use the `msg.cookies` property
in order to set or clear cookies.

#### Example

![](/images/http/work-with-cookies.png)

{% raw %}
~~~json
[{"id":"c362b989.954ae8","type":"http in","z":"3045204d.cfbae","name":"","url":"/hello-cookie","method":"get","swaggerDoc":"","x":130,"y":1020,"wires":[["21ddf71f.d00518"]]},{"id":"21ddf71f.d00518","type":"function","z":"3045204d.cfbae","name":"Format cookies","func":"msg.payload = JSON.stringify(msg.req.cookies,null,4);\nreturn msg;","outputs":1,"noerr":0,"x":340,"y":1020,"wires":[["f3aa98c1.befc18"]]},{"id":"f3aa98c1.befc18","type":"template","z":"3045204d.cfbae","name":"page","field":"payload","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"<html>\n    <head></head>\n    <body>\n        <h1>Cookies</h1>\n        <p></p><a href=\"hello-cookie/add\">Add a cookie</a> &bull; <a href=\"hello-cookie/clear\">Clear cookies</a></p>\n        <pre>{{ payload }}</pre>\n    </body>\n</html>","x":530,"y":1020,"wires":[["f52e2880.180968"]]},{"id":"f52e2880.180968","type":"http response","z":"3045204d.cfbae","name":"","x":750,"y":1020,"wires":[]},{"id":"9a2a9a4.0fc0768","type":"change","z":"3045204d.cfbae","name":"Redirect to /hello-cookie","rules":[{"t":"set","p":"statusCode","pt":"msg","to":"302","tot":"num"},{"t":"set","p":"headers","pt":"msg","to":"{}","tot":"json"},{"t":"set","p":"headers.location","pt":"msg","to":"/hello-cookie","tot":"str"}],"action":"","property":"","from":"","to":"","reg":false,"x":550,"y":1080,"wires":[["f52e2880.180968"]]},{"id":"afefb90.53dcf48","type":"function","z":"3045204d.cfbae","name":"Add a cookie","func":"msg.cookies = { };\nmsg.cookies[\"demo-\"+(Math.floor(Math.random()*1000))] = Date.now();\nreturn msg;","outputs":1,"noerr":0,"x":330,"y":1060,"wires":[["9a2a9a4.0fc0768"]]},{"id":"d5205a2c.db9018","type":"function","z":"3045204d.cfbae","name":"Clear cookies","func":"// Find demo cookies and clear them\nvar cookieNames = Object.keys(msg.req.cookies).filter(function(cookieName) { return /^demo-/.test(cookieName);});\nmsg.cookies = {};\n\ncookieNames.forEach(function(cookieName) {\n    msg.cookies[cookieName] = null;\n});\n\nreturn msg;","outputs":1,"noerr":0,"x":340,"y":1100,"wires":[["9a2a9a4.0fc0768"]]},{"id":"fda60c66.04975","type":"http in","z":"3045204d.cfbae","name":"","url":"/hello-cookie/add","method":"get","swaggerDoc":"","x":140,"y":1060,"wires":[["afefb90.53dcf48"]]},{"id":"35285a76.1f8636","type":"http in","z":"3045204d.cfbae","name":"","url":"/hello-cookie/clear","method":"get","swaggerDoc":"","x":140,"y":1100,"wires":[["d5205a2c.db9018"]]}]
~~~
{: .flow}
{% endraw %}

This example provides three HTTP endpoints:

 - `/hello-cookie` returns a page that lists the cookies currently set
 - `/hello-cookie/add` adds a new cookie and redirects back to `/hello-cookie`
 - `/hello-cookie/clear` clears all cookies created by the example and redirects back to `/hello-cookie`

### Discussion

The `msg.req.cookies` property is an object of key/value pairs containing the cookies
set on the current request.

~~~javascript
var mySessionId = msg.req.cookies['sessionId'];
~~~

In order to set a cookie in the response, the `msg.cookies` property should be set
to a similar key/value object.

The value can be either a string to set the value of the cookie with default
options, or it can be an object of options.

The following example sets two cookies - one called `name` with a value of `Nick`, the other called `session` with a value of `1234` and an expiry set to 15 minutes.

~~~javascript
msg.cookies = {
    name: 'nick',
    session: {
        value: '1234',
        maxAge: 900000
    }
}
~~~

The valid options include:

- `domain` - (String) domain name for the cookie
- `expires` - (Date) expiry date in GMT. If not specified or set to 0, creates a session cookie
- `maxAge` - (String) expiry date as relative to the current time in milliseconds
- `path` - (String) path for the cookie. Defaults to /
- `value` - (String) the value to use for the cookie

To delete a cookie, set its value to null.
