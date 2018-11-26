---
layout: tutorial
title: Using MobileFirst Server to Eclipse
weight: 2
---
<!-- NLS_CHARSET=UTF-8 -->
## Overview
{: #overview }
The {{ site.data.keys.mf_server }} can be integrated into the Eclipse IDE. This can help in creating a unified development experience.

* You can also expose CLI functionality in Eclipse, see the [Using the {{ site.data.keys.mf_server }} in Eclipse](../../../../application-development/using-mobilefirst-cli-in-eclipse) tutorial.
* Additionally, you can develop adapters in Eclipse, see the [Developing Adapters in Eclipse](../../../../adapters/developing-adapters) tutorial.

### Adding the server to Eclipse
{: #adding-the-server-to-eclipse }
1. From the **Servers** view in Eclipse, select **New → Server**.
2. If an IBM folder option does not exist, click on "Download additional server adapters".
3. Select **WebSphere Application Server Liberty Tools** and follow the on-screen instructions.
4. From the **Servers** view in Eclipse, select **New → Server**.
5. Select **IBM → WebSphere Application Server Liberty**.
6. Provide a server **name** and **hostname** and click **Next**.
7. Provide the path to the server's root directory, and select a JRE version to use. When using the {{ site.data.keys.mf_dev_kit }}, the root directory is **[installation directory]/mfp-server** folder.
8. Click **Next** followed by clicking **Finish**.

You can now start and stop the {{ site.data.keys.mf_server }} from the Eclipse IDE "servers" view.
