---
layout: tutorial
title: Handling SMS Notifications in iOS
breadcrumb_title: Handling SMS in iOS
relevantTo: [ios]
downloads:
  - name: Download Xcode project
    url: https://github.com/MobileFirst-Platform-Developer-Center/SMSNotificationsSwift/tree/release80
weight: 9
---
<!-- NLS_CHARSET=UTF-8 -->
## Overview
{: #overview }
SMS notifications are a sub-set of Push Notification, as such make sure to first [go through the Push notifications in iOS](../../) tutorials.

**Prerequisites:**

* Make sure you have read the following tutorials:
  * [Notifications Overview](../../)
  * [Setting up your {{ site.data.keys.product_adj }} development environment](../../../installation-configuration/#installing-a-development-environment)
  * [Adding the {{ site.data.keys.product }} SDK to iOS applications](../../../application-development/sdk/ios)
* {{ site.data.keys.mf_server }} to run locally, or a remotely running {{ site.data.keys.mf_server }}.
* {{ site.data.keys.mf_cli }} installed on the developer workstation

#### Jump to:
{: #jump-to }
* [Notifications API](#notifications-api)   
* [Using an SMS subscribe servlet](#using-an-sms-subscribe-servlet)     
* [Sample Application](#sample-application)

## Notifications API
{: #notifications-api }
In SMS notifications, when registering the device, a phone number value is passed.

#### Challenge Handlers
{: #challenge-handlers }
If the `push.mobileclient` scope is mapped to a **security check**, you need to make sure matching **challenge handlers** exist and are registered before using any of the Push APIs.

#### Initialization
{: #initialization }
Required for the client application to connect to MFPPush service with the right application context.

* The API method should be called first before using any other MFPPush APIs.
* Registers the callback function to handle received push notifications.

```swift
MFPPush.sharedInstance().initialize()
```

#### Register Device
{: #register-device }
Register the device to the push notifications service.

```swift
MFPPush.sharedInstance().registerDevice(jsonOptions){ (response, error) -> Void in
     if error == nil {
         // Successfully registered
     } else {
         // Registration failed with error
     }
 })
```

* **optionObject**: an `jsonOptions` containing the phone number to register the device with. For example:

```swift
let phoneNumber: String = self.phoneNumberTF.text!

let jsonOptions: [AnyHashable: Any] = [
    "phoneNumber": phoneNumber
]

if JSONSerialization.isValidJSONObject(jsonOptions) {
    // JSON is valid and can be sent with registerDevice request
}

```

> You can also register a device using the [Push Device Registration (POST) REST API](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/rest_runtime/r_restapi_push_device_registration_post.html)

#### Unregister Device
{: #unregister-device }
Unregister the device from push notification service instance.

```swift
MFPPush.sharedInstance().unregisterDevice { (response, error)  -> Void in
    if error == nil {
        // Unregistered successfully
    } else {
        // Failed to unregister
    }
})
```

## Using an SMS subscribe servlet
{: #using-an-sms-subscribe-servlet }
REST APIs are used to send notifications to the registered devices. All forms of notifications can be sent: tag &amp; broadcast notifications, and authenticated notifications

To send a notification, a request is made using POST to the REST endpoint: `imfpush/v1/apps/<application-identifier>/messages`.  
Example URL:

```bash
https://myserver.com:443/imfpush/v1/apps/com.sample.sms/messages
```

> To review all Push Notifications REST APIs, see the <a href="https://www.ibm.com/support/knowledgecenter/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/rest_runtime/c_restapi_runtime.html">REST API runtime services</a> topic in the user documentation.

To send a notification, see the [sending notifications](../../sending-notifications) tutorial.

<img alt="Image of the sample application" src="sample-app.png" style="float:right"/>
## Sample application
{: #sample-application }
[Click to download](https://github.com/MobileFirst-Platform-Developer-Center/SMSNotificationsSwift/tree/release80) the Xcode project.

### Sample usage
{: #sample-usage }
Follow the sample's README.md file for instructions.
