---
layout: tutorial
title: iOS 애플리케이션에서 로깅
breadcrumb_title: Logging in iOS
relevantTo: [ios]
weight: 2
---
<!-- NLS_CHARSET=UTF-8 -->
## 개요
{: #overview }
이 학습서는 iOS 애플리케이션에 로깅 기능을 추가하는 데 필요한 필수 코드 스니펫을 제공합니다.

**전제조건:** [클라이언트 측 로그 콜렉션 개요](../)를 읽으십시오.

> **참고:** Swift에서 `OCLogger`를 사용하려면 다음 `OCLogger` 확장 클래스(이 클래스는 별도의 Swift 파일 또는 현재 Swift 파일의 확장일 수 있음)를 작성해야 합니다.

```swift
extension OCLogger {
    //Log methods with no metadata

    func logTraceWithMessages(message:String, _ args: CVarArgType...) {
        logWithLevel(OCLogger_TRACE, message: message, args:getVaList(args), userInfo:Dictionary<String, String>())
    }

    func logDebugWithMessages(message:String, _ args: CVarArgType...) {
        logWithLevel(OCLogger_DEBUG, message: message, args:getVaList(args), userInfo:Dictionary<String, String>())
    }

    func logInfoWithMessages(message:String, _ args: CVarArgType...) {
        logWithLevel(OCLogger_INFO, message: message, args:getVaList(args), userInfo:Dictionary<String, String>())
    }

    func logWarnWithMessages(message:String, _ args: CVarArgType...) {
        logWithLevel(OCLogger_WARN, message: message, args:getVaList(args), userInfo:Dictionary<String, String>())
    }

    func logErrorWithMessages(message:String, _ args: CVarArgType...) {
        logWithLevel(OCLogger_ERROR, message: message, args:getVaList(args), userInfo:Dictionary<String, String>())
    }

    func logFatalWithMessages(message:String, _ args: CVarArgType...) {
        logWithLevel(OCLogger_FATAL, message: message, args:getVaList(args), userInfo:Dictionary<String, String>())
    }

    func logAnalyticsWithMessages(message:String, _ args: CVarArgType...) {
        logWithLevel(OCLogger_ANALYTICS, message: message, args:getVaList(args), userInfo:Dictionary<String, String>())
    }

    //Log methods with metadata

    func logTraceWithUserInfo(userInfo:Dictionary<String, String>, message:String, _ args: CVarArgType...) {
        logWithLevel(OCLogger_TRACE, message: message, args:getVaList(args), userInfo:userInfo)
    }

    func logDebugWithUserInfo(userInfo:Dictionary<String, String>, message:String, _ args: CVarArgType...) {
        logWithLevel(OCLogger_DEBUG, message: message, args:getVaList(args), userInfo:userInfo)
    }

    func logInfoWithUserInfo(userInfo:Dictionary<String, String>, message:String, _ args: CVarArgType...) {
        logWithLevel(OCLogger_INFO, message: message, args:getVaList(args), userInfo:userInfo)
    }

    func logWarnWithUserInfo(userInfo:Dictionary<String, String>, message:String, _ args: CVarArgType...) {
        logWithLevel(OCLogger_WARN, message: message, args:getVaList(args), userInfo:userInfo)
    }

    func logErrorWithUserInfo(userInfo:Dictionary<String, String>, message:String, _ args: CVarArgType...) {
        logWithLevel(OCLogger_ERROR, message: message, args:getVaList(args), userInfo:userInfo)
    }

    func logFatalWithUserInfo(userInfo:Dictionary<String, String>, message:String, _ args: CVarArgType...) {
        logWithLevel(OCLogger_FATAL, message: message, args:getVaList(args), userInfo:userInfo)
    }

    func logAnalyticsWithUserInfo(userInfo:Dictionary<String, String>, message:String, _ args: CVarArgType...) {
        logWithLevel(OCLogger_ANALYTICS, message: message, args:getVaList(args), userInfo:userInfo)
    }
}
```

이제 확장 클래스가 포함되어 Swift에서 `OCLogger`를 사용할 수 있습니다.

## 로그 캡처 사용
{: #enabling-log-capture }
로그 캡처는 기본적으로 사용됩니다. 로그 캡처는 클라이언트에 로그를 저장하며 프로그래밍 방식으로 사용 또는 사용 안함으로 설정될 수 있습니다. 로그는 명시적 전송 호출 또는 자동 로그를 사용하여 서버로 전송됩니다.

> **참고:** 상세 레벨에서 로그 캡처를 사용하도록 설정하면 클라이언트가 네트워크를 통해 로그를 전송하는 경우 디바이스 CPU 이용량, 파일 시스템 공간 및 페이로드 크기에 영향을 줄 수 있습니다.

로그 캡처를 사용 안함으로 설정하려면 다음을 수행하십시오.

**Objective-C**

```objc
[OCLogger setCapture:NO];
```

**Swift**

```swift
OCLogger.setCapture(false);
```

## 캡처된 로그 전송
{: #sending-captured-logs }
애플리케이션 로직에 따라 {{ site.data.keys.product_adj }}에 로그를 전송하십시오. 자동 로그 전송을 사용하여 로그를 자동으로 전송할 수도 있습니다. 최대 크기에 도달하기 전에 로그가 전송되지 않으면 새 로그를 전송하도록 로그 파일이 제거됩니다.

> **참고:** 로그 데이터를 수집할 때 다음 패턴을 채택하십시오. 주기적으로 데이터를 전송하면 {{ site.data.keys.mf_analytics_console }}에 거의 실시간으로 로그 데이터가 표시됩니다.

**Objective-C**

```objc
[NSTimer scheduledTimerWithTimeInterval:60
  target:[OCLogger class]
  selector:@selector(send)
  userInfo:nil
  repeats:YES];
```

**Swift**

```swift
var timer = NSTimer.scheduledTimerWithTimeInterval(60,
  target:OCLogger.self,
  selector: #selector(OCLogger.send),
  userInfo: nil,
  repeats: true)
```

캡처된 모든 로그가 전송되도록 하려면 다음 전략 중 하나를 고려하십시오.

* 일정한 시간 간격으로 `send` 메소드를 호출합니다.
* 앱 라이프사이클 이벤트 콜백 내에서 `send` 메소드를 호출합니다.
* 지속적 로그 버퍼의 최대 파일 크기(바이트)를 늘립니다.

**Objective-C**

```objc
[OCLogger setMaxFileSize:150000];

```

**Swift**

```swift
OCLogger.setMaxFileSize(150000);
```

## 자동 로그 전송
{: #auto-log-sending }
자동 로그 전송은 기본적으로 사용됩니다. 올바른 자원 요청이 서버에 전송될 때마다 전송 간에 최소 60초의 간격을 두고 캡처된 로그도 전송됩니다. 클라이언트에서 자동 로그 전송을 사용 또는 사용 안함으로 설정할 수 있습니다. 자동 로그 전송은 기본적으로 사용됩니다.

**Objective-C**

사용으로 설정하려면 다음을 수행하십시오.

```objc
[OCLogger setAutoSendLogs:YES];
```

사용 안함으로 설정하려면 다음을 수행하십시오.

```objc
[OCLogger setAutoSendLogs:NO];
```

**Swift**

사용으로 설정하려면 다음을 수행하십시오.

```swift
OCLogger.setAutoSendLogs(true);
```

사용 안함으로 설정하려면 다음을 수행하십시오.

```swift
OCLogger.setAutoSendLogs(false);
```

## 로거 API를 사용한 미세 튜닝
{: #fine-tuning-with-the-logger-api }
{{ site.data.keys.product_adj }} 클라이언트 SDK는 로거 API를 내부적으로 사용합니다. SDK에서 작성하는 로그 항목은 기본적으로 캡처됩니다. 로그 콜렉션을 미세 튜닝하려면 로거 인스턴스를 패키지 이름과 함께 사용하십시오. 서버 측 필터를 사용하여 분석을 통해 캡처할 로깅 레벨을 제어할 수도 있습니다.

### Objective-C
{: #objective-c}
예를 들어 패키지 이름 `myApp`에 대해 레벨이 `ERROR`인 로그만 캡처하려면 다음 단계를 수행하십시오.

1. `logger` 인스턴스를 패키지 이름 `myApp`과 함께 사용하십시오.

   ```objc
   OCLogger *logger = [OCLogger getInstanceWithPackage:@"MyApp"];
   ```

2. **선택사항:** 로그 캡처 및 로그 출력을 프로그래밍 방식으로 지정된 레벨 및 패키지로만 제한하는 필터를 지정하십시오.

   ```objc
   [OCLogger setFilters:@{@"MyApp": @(OCLogger_ERROR)}];
   ```

3. **선택사항:** 서버 구성 프로파일을 페치하여 원격으로 필터를 제어하십시오.

### Swift
{: #swift }
1. 개요에 설명된 대로 확장을 사용하여 패키지의 로거 인스턴스를 작성하십시오.

   ```swift
   let logger : OCLogger = OCLogger.getInstanceWithPackage("MyTestLoggerPackage");
   ```

2. **선택사항:** 로깅 레벨을 지정하십시오.

   ```swift
   OCLogger.setLevel(OCLogger_DEBUG);
   ```

3. **선택사항:** 서버 구성 프로파일을 페치하여 원격으로 필터를 제어하십시오.

## 서버 구성 프로파일 페치
{: #fetching-server-configuration-profiles }
로깅 레벨은 클라이언트가 설정하거나 서버에서 구성 프로파일을 검색하여 설정할 수 있습니다. {{ site.data.keys.mf_analytics_console }}에서 로그 레벨을 글로벌로 설정하거나(모든 로거 인스턴스) 특정 패키지에 대해 설정할 수 있습니다. {{ site.data.keys.mf_analytics_console }}에서 필터를 구성하는 데 대한 정보는 [로그 필터 구성](../../../analytics/console/log-filters/)을 참조하십시오. 클라이언트가 서버에서 구성을 페치하려면 앱 라이프사이클 콜백과 같이 정기적으로 실행되는 코드의 한 위치에서 `updateConfigFromServer` 메소드를 호출해야 합니다.

**Objective-C**

```objc
[OCLogger updateConfigFromServer];
```

**Swift**

```swift
 OCLogger.updateConfigFromServer();
 ```

## 로깅 예제
{: #logging-example }
브라우저 JavaScript 콘솔, LogCat 또는 Xcode 콘솔에 대한 출력

#### Objective-C
{: #objective-c-example }

```objc
#import "OCLogger.h"
+ (int) sum:(int) a with:(int) b{
    int sum = a + b;
    [OCLogger setLevel:DEBUG];
    OCLogger* mathLogger = [OCLogger getInstanceWithPackage:@"MathUtils"];
    NSString* logMessage = [NSString stringWithFormat:@"sum called with args %d and %d. Returning %d", a, b, sum];
    [mathLogger debug:logMessage];
    return sum;
}
```

### Swift
{: #swift-logging }

```swift
func sum(a: Int, b: Int) -> Int{
    var sum = a + b;
    let logger = OCLogger.getInstanceWithPackage("MathUtils");

    logger.logInfoWithMessages("sum called with args /(a) and /(b). Returning /(sum)");
    return sum;
}
```
