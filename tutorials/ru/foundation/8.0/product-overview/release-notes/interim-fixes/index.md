---
layout: tutorial
title: What's new in Interim Fixes
breadcrumb_title: Interim iFixes
weight: 2
---
<!-- NLS_CHARSET=UTF-8 -->
<br/>
Interim fixes provide patches and updates to correct problems and keep {{ site.data.keys.product_full }} current for new releases of mobile operating systems.

Interim fixes are cumulative. When you download the latest v8.0 interim fix, you get all of the fixes from earlier interim fixes.

Download and install the latest interim fix to obtain all of the fixes that are described in the following sections. If you install earlier fixes, you might not get all of the fixes described here.

> For a list of iFix releases of {{ site.data.keys.product }} 8.0, [see these blog posts]({{site.baseurl}}/blog/tag/iFix_8.0/).

Where an APAR number is listed, you can confirm that an interim fix has that feature by searching the interim fix README file for that APAR number.

### Licensing
{: #licensing }
#### PVU licensing
{: #pvu-licensing }
A new offering, {{ site.data.keys.product }} Extension V8.0.0, is available through PVU (processor value unit) licensing. For more information on PVU licensing for {{ site.data.keys.product }} Extension, see [Licensing {{ site.data.keys.product_adj }}](../../licensing).

### Web applications
{: #web-applications }
#### Registering web applications from the {{ site.data.keys.mf_cli }} (APAR PI65327)
{: #registering-web-applications-from-the-mobilefirst-cli-apar-pi65327 }
You can now register client web applications to {{ site.data.keys.mf_server }} by using the {{ site.data.keys.mf_cli }} (mfpdev) as an alternative to registration from the {{ site.data.keys.mf_console }}. For more information, see Registering web applications from the {{ site.data.keys.mf_cli }}.

### Cordova applications
{: #cordova-applications }
#### Opening the native IDE for a Cordova project from Eclipse with the Studio plug-in
{: #opening-the-native-ide-for-a-cordova-project-from-eclipse-with-the-studio-plug-in }
With the Studio plug-in installed in your Eclipse IDE, you can open an existing Cordova project in Android Studio or Xcode from the Eclipse interface to build and run the project.

#### Added *projectName* directory as an option when you use the Migration Assistance tool
{: #added-projectname-directory-as-an-option-when-you-use-the-migration-assistance-tool }
You can specify a name for your Cordova project directory when you migrate projects with the migration assistance tool. If you do not provide a name, the default name is *app_name-app_id-version*.

#### Usability improvements to the Migration Assistance tool
{: #usability-improvements-to-the-migration-assistance-tool }
Made the following changes to improve the usability of the Migration Assistance tool:

* The Migration Assistance tool scans HTML files and JavaScript files.
* The scan report opens in your default browser automatically after the scan is finished.
* The *--out* flag is optional. The working directory is used if it is not specified.
* When the *--out* flag is specified and the directory does not exist, the directory is created.

### Adapters
{: #adapters }
#### Added `mfpdev push` and `pull` commands for Java and JavaScript adapter configurations
{: #added-mfpdev-push-and-pull-commands-for-java-and-javascript-adapter-configurations }
You can use {{ site.data.keys.mf_cli }} to push Java and JavaScript adapter configurations to the {{ site.data.keys.mf_server }} and pull adapter configurations from the {{ site.data.keys.mf_server }}.

### Application Center
{: #application-center}

Cordova based application center client is now available for iOS and Android.
