---
layout: default
title: Connect to an MQTT broker with TLS encryption
slug:
  - label: mqtt
    url: /#mqtt
  - secure connect
---

### Problem

You want to have an encrypted connection to your Mosquitto MQTT broker.

### Solution

Create a valid set of certificates and keys for the broker to use.

Change the configuration of the broker to start a TLS encrypted port (`mqtts`) using the above.

Alter the <code class="node">MQTT Config</code> node, changing the "Server" name to start with `mqtts://`.

#### Example

**Valid Certificate Creation**

THe easiest approach for this is to use [Let's Encrypt](https://letsencrypt.org/getting-started/). This is beyond the scope of this article but there are plenty of examples and tutorials available on the Internet. For this to work successfully, you also need to be able to use a registered domain name on your internal network because you cannot use Let's Encrypt with IP addresses or non-public domain names.

Alternatively, you can create a self-signed set of certificates. Again, this is beyond the scope of the article. However, you may need to create a trusted root certificate and provide its public cert instead of the one that Debian provides that is listed in the configuration below.

**Mosquitto configuration**

This assumes that you are using Let's Encrypt or other certificates signed by a root CA already trusted by the Debian operating system.

Note the entries in `<...>` which need to be replaced with your own folders and files.

This goes into a file of any name of the form `*.conf` in the folder `/etc/mosquitto/conf.d/`. So you have to edit it with root privalages (e.g. using `sudo`).

{{ page.lcb }}% raw %}
~~~text
# Default Listener: 1883
port 1883
# Bind the default listener to localhost only if you want to force external connections to be TLS only
#bind_address localhost

# Secure listener
listener 8883
# TLS
## This is standard and should always be this when using Let's Encrypt
## If using a self-signed certificate, this needs to be your custom Root CA public certificate
cafile /etc/ssl/certs/DST_Root_CA_X3.pem
## These are from your installation of LE
certfile /<path-to-LE-cert-files>/<fullchain>.cer
keyfile /<path-to-LE-cert-files>/<private-key-name>.key
## Forces use of modern version of TLS to avoid security issues
tls_version tlsv1.2

## Forces ALL CLIENTs to provide a valid certificate - change the node config to allow this from NR
#require_certificate true
~~~
{: .shell}
{{ page.lcb }}% endraw %}

After making these changes, you have to restart the mosquitto broker using the command:

~~~text
[~]$ sudo systemctl restart mosquitto
~~~
{: .shell}

**<code class="node">MQTT Config</code> node configuration**

![](/images/mqtt/tls-connect-1.png)

Notes

* You need to use the IP name rather than IP address in the server name if using Let's Encrypt (otherwise the certificate isn't valid).
* You need to change the server name to a url, prefixed with `mqtts://`. This disables the port field, I change that first to `8883` to remind me what the correct port will be.
* You **do not** need to set the "Enable secure connection" flag. That lets you authenticate the Node-RED client connection to the broker (if you set the require_certificate to true for example).

### Discussion

Mosquitto allows you to create multiple ports for connectivity. This lets you use websockets and TLS encrypted connections in addition to the default connection.

The folder `/etc/mosquitto/conf.d/` can contain any number of config files which will all be applied so that you can split your custom changes into separate files if you like.

Just remember that once you use a custom file to set ports, the default port (1883) is no longer active so you have to specify that as well. The standard port for MQTT over TLS (MQTTS) is 8883. You can, however, use other ports if they are not in use. Make sure you use a port number greater than 1024 otherwise everything that wants to use that port has to have root privalages.

You can check which ports the broker has opened with the command:

~~~text
[~]$ sudo netstat -lptu | grep mosquitto
tcp        0      0 0.0.0.0:8883            0.0.0.0:*               LISTEN      17697/mosquitto
tcp        0      0 0.0.0.0:1883            0.0.0.0:*               LISTEN      17697/mosquitto
tcp6       0      0 [::]:8883               [::]:*                  LISTEN      17697/mosquitto
tcp6       0      0 [::]:1883               [::]:*                  LISTEN      17697/mosquitto
~~~
{: .shell}

You can test whether the server device is allowing connections on a port by using telnet from another device.

~~~text
[~]$ telnet <ip-name> 8883
~~~
{: .shell}

If the connection opens, then the target device is accepting connections on that port.

Note that the operating system automatically opens the required ports through the devices firewall.

If you want to monitor what the broker is doing, including seeing which clients connect to which ports, use the following command:

~~~text
[~]$ sudo tail /var/log/mosquitto/mosquitto.log -f
~~~
{: .shell}

