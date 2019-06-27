---
layout: default
title: Set the URL of a request
slug:
  - label: http
    url: /#http-requests
  - set url
---

### Problem

You want to set the URL of an HTTP request node dynamically.

### Solution

Set the URL property of the <code class="node">HTTP Request</code> node.

#### Example

![](/images/http/set-request-url.png)

{% raw %}
~~~json
[{"id":"b36aa30.3a7276","type":"http request","z":"c9a81b70.8abed8","name":"","method":"GET","ret":"txt","url":"","x":470,"y":300,"wires":[["1ef9987c.956c78"]]},{"id":"11167f67.5d5031","type":"inject","z":"c9a81b70.8abed8","name":"cars on craigslist","topic":"","payload":"http://vancouver.craigslist.org/search/sss?format=rss&query=cars","payloadType":"str","repeat":"","crontab":"","once":false,"x":140,"y":300,"wires":[["70154cd4.de1444"]]},{"id":"70154cd4.de1444","type":"change","z":"c9a81b70.8abed8","name":"","rules":[{"t":"set","p":"url","pt":"msg","to":"payload","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":310,"y":300,"wires":[["b36aa30.3a7276"]]},{"id":"1ef9987c.956c78","type":"debug","z":"c9a81b70.8abed8","name":"","active":true,"console":"false","complete":"false","x":630,"y":300,"wires":[]}]
~~~
{: .flow}
{% endraw %}

The <code class="node">Inject</code> node generates a string URL, and the <code class="node">Change</code> node sets the msg.URL property.  In this flow the URL is set to:

{% raw %}
~~~text
http://vancouver.craigslist.org/search/sss?format=rss&query=cars
~~~
{% endraw %}

To return an RSS feed for cars for sale in Vancouver on Craigslist.  It returns something like the following XML content in the debug window:

{% raw %}
~~~text
<?xml version="1.0" encoding="UTF-8"?>

<rdf:RDF
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
 xmlns="http://purl.org/rss/1.0/"
 xmlns:enc="http://purl.oclc.org/net/rss_2.0/enc#"
 xmlns:ev="http://purl.org/rss/1.0/modules/event/"
 xmlns:content="http://purl.org/rss/1.0/modules/content/"
 xmlns:dcterms="http://purl.org/dc/terms/"
 xmlns:syn="http://purl.org/rss/1.0/modules/syndication/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:taxo="http://purl.org/rss/1.0/modules/taxonomy/"
 xmlns:admin="http://webns.net/mvcb/"
>

<channel rdf:about="https://vancouver.craigslist.ca/search/sss?format=rss&#x26;query=cars">
<title>craigslist vancouver, BC | for sale search "cars"</title>
<link>https://vancouver.craigslist.ca/search/sss?query=cars</link>
<description></description>
<dc:language>en-us</dc:language>
<dc:rights>copyright 2017 craiglist</dc:rights>
<dc:publisher>robot@craigslist.org</dc:publisher>
<dc:creator>robot@craigslist.org</dc:creator>
<dc:source>https://vancouver...
~~~
{% endraw %}

#### Discussion

An <code class="node">XML</code> node can be added after the <code class="node">HTTP Request</code> to change the XML RSS content returned to a JavaScript object for easy access to the data.
