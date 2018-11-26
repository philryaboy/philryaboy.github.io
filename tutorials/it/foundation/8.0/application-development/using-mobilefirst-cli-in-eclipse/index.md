---
layout: tutorial
title: Using the MobileFirst CLI in Eclipse
relevantTo: [ios,android,windows,cordova]
breadcrumb_title: MobileFirst Eclipse plug-in
weight: 3
---
<!-- NLS_CHARSET=UTF-8 -->
## Overview
{: #overview }
Using the Cordova CLI you can create and manage your Cordova applications. You can also achieve the same in the Eclipse IDE by using the [THyM](https://www.eclipse.org/thym/) plug-in.

THyM provides support for importing and managing Cordova projects in Eclipse. You can create new Cordova projects, as well as import existing Cordova projects. You can also install Cordova plug-ins into your project through this plug-in.

Learn more about THyM in its [official website](https://www.eclipse.org/thym/).

The {{ site.data.keys.mf_studio }} plug-in for Eclipse exposes the various {{ site.data.keys.product_adj }} commands in the Eclipse IDE.
Specifically, it provides the following commands: Open Server Console, Preview App, Register App, Encrypt App, Pull App, Push App, Update App.

This tutorial walks you through installing the THyM and MobileFirst Eclipse plug-ins.

**Prerequisites:**

* {{ site.data.keys.mf_server }} to run locally, or a remotely running {{ site.data.keys.mf_server }}.
* {{ site.data.keys.mf_cli }} installed on the developer workstation

#### Jump to:
{: #jump-to }
* [Installing the {{ site.data.keys.mf_studio }} plug-in](#installing-the-mobilefirst-studio-plug-in)
* [Installing the THyM plug-in](#installing-the-thym-plug-in)
* [Creating a Cordova project](#creating-a-cordova-project)
* [Importing an existing Cordova project](#importing-an-existing-cordova-project)
* [Adding the {{ site.data.keys.product_adj }} SDK to Cordova project](#adding-the-mobilefirst-sdk-to-cordova-project)
* [{{ site.data.keys.product_adj }} Commands](#mobilefirst-commands)
* [Tips and Tricks](#tips-and-tricks)


## Installing the {{ site.data.keys.mf_studio }} plug-in
{: #installing-the-mobilefirst-studio-plug-in}
1. While in Eclipse click **Help → Eclipse Marketplace...**
2. In the find field search "{{ site.data.keys.product_adj }}" then click "Go"
3. Click "Install"

	![Image of {{ site.data.keys.mf_studio }} installation](mff_install.png)

4. Complete the installation process
5. Restart Eclipse for the installation to take affect.


## Installing the THyM plug-in
{: #installing-the-thym-plug-in }
**Note:** To run THyM you must be running Eclipse Mars or later

1. While in Eclipse click **Help → Eclipse Marketplace...**
2. In the find field search "thym" then click "Go"
3. Click "Install" for Eclipse Thym

	![Image of THyM installation](Thym_install.png)

4. Complete the installation process
5. Restart Eclipse for the installation to take affect.

## Creating a Cordova project
{: #creating-a-cordova-project }
In this section we will discuss how to create a new Cordova project using THyM.

1. While in Eclipse click **File → New → Other...**
2. Narrow options by searching for "Cordova" and select **Hybrid Mobile (Cordova) Application Project** in the **Mobile** directory and click **Next**

	![Image of new Cordova wizard](New_cordova_wizard.png)

3. Name the project, and click **Next**

	![Image of new Cordova naming](New_cordova_naming.png)

4. Add the desired platform for your project and click **Finish**

**Note**: If you need additional platforms after creation see [Adding platforms](#adding-platforms)

## Importing an existing Cordova project
{: #importing-an-existing-cordova-project }
In this section we will discuss how to import an existing Cordova project that has already been created using the Cordova CLI.

1. While in Eclipse click **File → Import...**
2. Select **Import Cordova Project** in the **Mobile** directory and click **Next >**
3. Click **Browse...** and select the root directory of the existing Cordova project.
4. Ensure the project is checked in the "Projects:" sections and click **Finish**
	![Image of importing Cordova project](Import_cordova.png)

If you import a project without any platforms you will see the following error, please see the [adding platforms](#adding-platforms) section on how to resolve this error.
![No platforms error image](no-platforms-error.png)

**Note**: If you need to additional platforms after an import see [adding platforms](#adding-platforms)

## Adding the {{ site.data.keys.product_adj }} SDK to Cordova project
{: #adding-the-mobilefirst-sdk-to-cordova-project }
Once you have [installed THyM](#installing-the-thym-plug-in) and the [{{ site.data.keys.mf_cli }} plugin](#installing-the-mobilefirst-studio-plug-in) into Eclipse and have either [created a Cordova project](#creating-a-cordova-project) or [imported a Cordova project](#importing-an-existing-cordova-project) you can then follow the below steps to install the {{ site.data.keys.product_adj }} SDK via Cordova plugin.

1. In the Project Explorer right click the **plugins** directory and select **Install Cordova Plug-in**
2. In the Registry tab of the presented dialog box search **mfp** and select **cordova-plugin-mfp** and click **Finish**

	![Image of new Cordova plugin install](New_installing_cordova_plugin.png)

## {{ site.data.keys.product_adj }} Commands
{: #mobilefirst-commands }
To access {{ site.data.keys.product }} shortcuts, right-click the root project directory and navigate to **IBM MobileFirst Foundation**.

Here you will be able to select from the following commands:

| Menu option         | Action                                                                                                                                       | MobileFirst command-line interface equivalent |
|---------------------|----------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| Open Server Console | When the server definition exists, opens the console so you can view the actions of the specified server.                                    | mfpdev server console                         |
| Preview App         | Opens the app in the browser preview mode.                                                                                                   | Opens the app in the browser preview mode.    |
| Register App        | Registers the app with the server that is specified in your server definitions.                                                              | mfpdev app register                           |
| Encrypt App         | Runs the web resource encryption tool on your app.                                                                                           | mfpdev app webencrypt                         |
| Pull App            | Retrieves the existing app configuration from the server that is specified in the server definition.                                         | mfpdev app pull                               |
| Push App            | Sends the app configuration of your current app to the server that is specified in the build definition so you can reuse it for another app. | mfpdev app push                               |
| Updated App         | Packages the contents of the www folder in a .zip file, and replaces the version on the server with the package.                             | mfpdev app webupdate                          |


## Tips and Tricks
{: #tips-and-tricks }
<img src="runAsContextMenu.png" alt="context-menu in Eclipse to open in External IDEs" style="float:right;width:35%;margin-left: 10px"/>
### External IDE's
{: #external-ides }
If you would like to test or deploy to a device via an External IDE (Android Studio or Xcode) this can be accomplished via the the context menu.

**Note**:  Please be sure to manually import your project into Android Studio to set up the gradle configuration before launching from Eclipse.  Otherwise you might run into unnecessary steps or errors.  From Android Studio select import **Import project (Eclipse ADT Gradle, etc.)** and navigate to your project and select the **android** directory within the **platforms** directory.

In the Eclipse project explorer right click the desired platform (i.e. **android** or **ios** in the **platforms** directory) → hover over **Run As** in the context menu → select the appropriate external IDE.

### Adding platforms
{: #adding-platforms }

Adding additional platforms is a simple process that the THyM plugin does not make intuitive. You have two options to accomplish the same task, and they are as follows.

1. Via Properties
	1. Right click your project and select **properties** from the context menu.
	1. In the presented dialog select **Hybrid Mobile Engine** from the left hand menu.
	1. In this pane you will be able to select or download the desired platforms.

1. Via Terminal
	1. Right click your project and hover over **Show In** and select **Terminal** from the context menu.
	1. This should add a tab to next to the console in Eclipse
	1. Here you will be able to manually add platforms using the Cordova CLI commands
		*  `cordova platform ls` will list the installed and available platforms
		*  `cordova platform add <platform>`  where *<platform>* equals your desired platform, will add the specified platform to the project.
		*  For more information on Cordova platform specific commands see <a href="https://cordova.apache.org/docs/en/latest/reference/cordova-cli/#cordova-platform-command" target="blank">Cordova platform command documentation</a>.

### Debug mode
{: #debug-mode }
Enabling debug mode will show debug level logs in the Eclipse console, while previewing the application in a browser.  To enable debug mode do the following:

1. Open Eclipse's Preferences.
2. Select **MobileFirst Studio Plugins** to show the plug-ins preferences page.
3. Ensure the **Enable debug mode** check bocks is selected, then click **Apply → OK**

### Live update
{: #live-update }
While previewing an application live update is available. You can make updates and save you changes and watch them auto refresh in the preview.

### Integrating {{ site.data.keys.mf_server }} into Eclipse
{: #integrating-mobilefirst-server-into-eclipse }
Using the {{ site.data.keys.mf_dev_kit }}, You can couple together the above with [running the {{ site.data.keys.mf_server }} in Eclipse](../../installation-configuration/development/mobilefirst/using-mobilefirst-server-in-eclipse) to create a more integrated development environment.

### Demo Video
{: #demo-video }
<div class="sizer">
	<div class="embed-responsive embed-responsive-16by9">
   		<iframe src="https://www.youtube.com/embed/yRe2AprnUeg"></iframe>
	</div>
</div>
