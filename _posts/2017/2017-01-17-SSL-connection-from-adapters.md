---
title: Connecting to a SSL back-end from a Java or Javascript MobileFirst Adapter
date: 2017-01-17
tags:
- MobileFirst_Foundation
- Mobile_Foundation
- Mobile_Foundation_Service
- IBM_Cloud
- Bluemix
version: 8.0
author:
  name: Ajay Chebbi
additional_authors:
- Prashanth Bhat
---

## Overview
Often you have to use SSL (HTTPS) to connect to a back-end REST server from code running in an adapter. For this SSL handshake to happen, you need to add the *Client* certificate of the back-end server into the MobileFirst Server keystore. This establishes the trust relationship between the **Client** (the MobileFirst Server adapter in this case) and the **Server** (the back-end server you are connecting to).

When creating a MobileFirst Server using the [Mobile Foundation on IBM Cloud service](https://console.bluemix.net/catalog/services/mobile-foundation) or using scripts, the `mybluemix.net` domain's Client certificate is added by default.The following procedure is not needed to connect to back-ends that are in the `mybluemix.net` domain.

The client certificate is added to a keystore that's specific to your organization. Following steps describe the procedure to add the certificate to the MobileFirst Server. See the [MobileFirst server keystore documentation]({{site.baseurl}}/tutorials/en/foundation/8.0/authentication-and-security/configuring-the-mobilefirst-server-keystore/) before changing the keystore as it can have breaking implications.

> **Note:** To complete the following steps, you will need a third-party utility. For example, you can generate a JKS keystore file by running the [Java keytool](http://docs.oracle.com/javase/6/docs/technotes/tools/solaris/keytool.html) utility


## Part 1: Get the Client certificate from the back-end server
If you have access to the back-end server infrastructure, export the public certificate from the back-end server keystore using the following command:

```bash
keytool -export -alias backend -keystore backend.keystore -rfc -file backend.crt
```

If you do not have access to the keystore of the backend server, then you can get the public certificate using the openssl tool as follows:

```bash
echo -n | openssl s_client -connect <back-end-server-IP>:<back-end-server-Port> | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > ./backend.crt
```

Alternately, you can use Firefox browser to download the public certificate from the back-end server

1. Navigate to the back-end server URL and click on the SSL certificate icon at the top on the Address bar / Padlock icon.
2. Click View Certificate or the '> icon and More Information Tab
3. Click on View Certificate -> Details
4. Chose which certificate you want from the hierarchy & click Export
5. Save the certificate in the PEM format

You will need this PEM certificate later in the process.

## Part 2: Add the Client certificate to the keystore
The MobileFirst Server keystore defines the identity of the MobileFirst Server instance. The keystore is used to digitally sign OAuth tokens and Direct Update packages, and validate them by using the defined server identity. In addition, when a MobileFirst adapter communicates with a back-end server by using mutual HTTPS (SSL) authentication, the keystore is used to validate the SSL-client identity of the MobileFirst Server instance.

Out of the box,  MobileFirst Server comes with a default keystore. For security reasons, you **must** create your own keystore and add your certificates to that keystore and upload it to the MobileFirst Server.

### 1. Create the Keystore
If you don't have one, create a Java keystore (JKS) or PKCS 12 keystore file. Each keystore entry is accessed via unique aliases. Aliases are case-insensitive; the aliases "backEnd" and "backend" would refer to the same keystore entry. If you are adding the certificate to an already existing keystore, skip to the next step.

The following instructions explain how to create the key store with the Java keytool utility.

```bash
keytool -keystore <keystore name> -genkey -alias <alias name> -keyalg RSA
```

* `<keystore name>` is the name of your keystore file name  
* `<alias name>` is your selected alias for the default self signed certificate that is created during creation of a new keystore). This becomes the "Identity" of this MobileFirst Server.
*
> Note: Make sure that the `-keyalg` is always set to `RSA`

The following sample command generates a **insurance_mfpserver.keystore** JKS file with a master_alias alias:

```bash
keytool -keystore insurance_mfpserver.keystore -genkey -alias master_alias -keyalg RSA
```

The utility will prompt you to enter **keystore password** and the **alias password** along with few other parameters. Note down keystore password and the password for the alias.

### 2. Add the certificate to the keystore
Import the certificate that you have created from the back-end into this newly created keystore using the following command

```bash
keytool -importcert -keystore  <keystore name> -file <certificate_file_path>
```

For example:

```bash
keytool -importcert -keystore  insurance_mfpserver.keystore -file ./backend.crt
```

You will be prompted for the keystore password. Use the password you specified while creating the keystore.

### 3. Configure the MobileFirst Server to use your keystore

Follow the steps below to configure {{ site.data.keys.mf_server }} to use your keystore:

   * **Javascript adapter**
     In the {{ site.data.keys.mf_console }} navigation sidebar, select **Runtime Settings**, and then select the **Keystore** tab. Follow the instructions on this tab to configure your user-defined {{ site.data.keys.mf_server }} keystore. The steps include uploading your keystore file, indicating its type and providing your keystore password, the name of your {{ site.data.keys.mf_server }} identity alias, and the alias password.
     When configured successfully, the **Status** changes to *User Defined*, else an error is displayed and the status remains *Default*.
     The SSL-client identity alias (if used) and its password are configured in the descriptor file of the relevant adapter, within the `<sslCertificateAlias>` and `<sslCertificatePassword>` subelements of the `<connectionPolicy>` element. See [HTTP adapter connectionPolicy element]({{site.baseurl}}/tutorials/en/foundation/8.0/adapters/javascript-adapters/js-http-adapter/#the-xml-file).

   * **Java adapter**
     To configure mutual SSL authentication for Java adapter the server's keystore needs to be updated. This can be done by following the steps below:

     * Copy the keystore file to `<ServerInstallation>/mfp-server/usr/servers/mfp/resources/security`

     * Edit `server.xml` file `<ServerInstallation>/mfp-server/usr/servers/mfp/server.xml`.

     * Update the keysore configuration with the right file name, password and type
     `<keyStore id=“defaultKeyStore” location=<Keystore name> password=<Keystore password> type=<Keystore type> />`

If you are deploying using {{ site.data.keys.mf_bm_short}} service on Bluemix, you can upload the keystore file under **Advanced settings** before deploying the server.

## (Optional) Setting up the back-end server with a new self signed certificate
If you want to add a self-signed certificate to your backend server for testing

### 1. Create a back-end server keystore
Create the keystore with a private certificate for 365 days.

```bash
keytool -genkey -alias backend -keyalg RSA -validity 365 -keystore backend.keystore -storetype JKS
```

> Note: The First and Last Name field contains your server URL, which you use in the adapter.xml configuration file, for example mydomain.com or localhost.

### 2. Configure your back-end server to work with the keystore.
For example, in Apache Tomcat, you change the server.xml file:

```xml
<Connector port="443" SSLEnabled="true" maxHttpHeaderSize="8192"
maxThreads="150" minSpareThreads="25" maxSpareThreads="200"
enableLookups="false" disableUploadTimeout="true"         
acceptCount="100" scheme="https" secure="true"
clientAuth="false" sslProtocol="TLS"
keystoreFile="backend.keystore" keystorePass="password" keystoreType="JKS"
keyAlias="backend"/>
```
