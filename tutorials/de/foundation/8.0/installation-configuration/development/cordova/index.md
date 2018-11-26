---
layout: tutorial
title: Setting up the Cordova development environment
breadcrumb_title: Cordova
relevantTo: [cordova]
weight: 2
---
<!-- NLS_CHARSET=UTF-8 -->
## Übersicht
{: #overview }
Der erste grundlegendende Schritt für die [Cordova-Entwicklung (PhoneGap)](https://cordova.apache.org/) ist die Installation der Cordova-CLI. Diese CLI ist Ihr Tool für die Erstellung von Cordova-Anwendungen. Sie können diese Anwendungen mit verschiedenen Frameworks anderer Anbieter wie Ionic, AngularJS, jQuery Mobile und vielen anderen erweitern. 
Für die Implementierung Ihrer Cordova-Anwendungen und -Adapter können Sie Ihren bevorzugten Codeeditor nutzen, z. B.
Atom.io, Visual Studio Code, Eclipse, IntelliJ und andere.

**Voraussetzung:** Wenn Sie Ihre Cordova-Entwicklungsumgebung
einrichten, müssen Sie das Lernprogramm [MobileFirst-Entwicklungsumgebung einrichten](../mobilefirst/) durchgearbeitet haben.

## Cordova-CLI installieren
{: #installing-the-cordova-cli }
{{ site.data.keys.product }} supports Apache [Cordova CLI 6.x](https://www.npmjs.com/package/cordova) or greater.  
Gehen Sie für die Installation wie folgt vor:

1. Sie müssen [NodeJS](https://nodejs.org/en/) herunterladen und installieren.
2. Führen Sie in einem **Befehlszeilenfenster** den Befehl `npm install -g cordova` aus.

## Nächste Schritte
{: #next-steps }
Wenn Sie mit der {{ site.data.keys.product_adj }}-Entwicklung von Cordova-Anwendungen fortfahren möchten,
muss das {{ site.data.keys.product_adj }}-Cordova-SDK (die zugehörigen Plug-ins) zu den Cordova-Anwendungen hinzugefügt werden.

* Informieren Sie sich darüber, wie das [{{ site.data.keys.product_adj }}-SDK zu
Cordova-Anwendungen hinzugefügt wird](../../../application-development/sdk/cordova/).
* For applications development, refer to the [Using the {{ site.data.keys.product }} SDK](../../../application-development/) tutorials.
* For adapters develpment, refer to the [Adapters](../../../adapters/) category.
