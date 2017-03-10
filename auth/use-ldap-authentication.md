---
layout: default
title: Use LDAP authentication
---

### Problem

You want to use LDAP authentication when Node-RED users login to Node-RED editor.

### Solution

Install LDAP authentication modue, [node-red-auth-contrib-ldap](https://www.npmjs.com/package/node-red-auth-contrib-ldap) and configure LDAP server information in settings.js.

#### Example

After the setup, you can use LDAP authentication when you access to Node-RED editor.
![](/images/auth/auth-login.png)


#### Configration

(1) Install LDAP authentication module
```
sudo npm install -g node-red-auth-contrib-ldap
```

(2) Add LDAP server information into settings.js
```
vi ~/.node-red/settings.js
```
Add adminAuth block in module.exports block as follows.
```
module.exports = {
...
    adminAuth: require("node-red-auth-contrib-ldap").init({
        url: "ldap://<hostname>:389",
        dn: "uid=%username%,ou=people,o=example,c=jp"
    }),
...
}
```

(3) Run Node-RED
```
node-red
```

### Discussion

You can modify dn(distinguished name) which corresponds with your LDAP server.
%username% is reserved word which dn string has as user name.

