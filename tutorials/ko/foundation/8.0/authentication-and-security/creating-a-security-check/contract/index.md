---
layout: tutorial
title: 보안 검사 규약
breadcrumb_title: security check contract
relevantTo: [android,ios,windows,javascript]
weight: 1
---
<!-- NLS_CHARSET=UTF-8 -->
## 개요
{: #overview }
모든 보안 검사는 `com.ibm.mfp.server.security.external.SecurityCheck` 인터페이스(보안 검사 인터페이스)를 구현해야 합니다. 이 인터페이스가 보안 검사와 {{ site.data.keys.product_adj }}
보안 프레임워크 사이의 기본 규약을 구성하게 됩니다. 보안 검사를 구현하려면
다음과 같은 요구사항을 충족해야 합니다.

* **기능**: 보안 검사는 클라이언트 `authorization` 및 `introspection` 기능을 제공해야 합니다.
* **상태 관리**: 보안 검사는 작성, 폐기, 현재 상태 관리를 포함하여 상태를 관리해야 합니다.
* **구성**: 보안 검사는 지원되는 보안 검사 구성 특성을 정의하고 기본 구성의 사용자 정의 유형과 값을 유효성 검증하는 보안 검사 구성 오브젝트를 작성해야 합니다.

보안 검사 인터페이스의 전체 내용은 [API 참조에서 `SecurityCheck`를 참조하십시오.](../../../api/server-side-api/java/)

## 보안 검사 기능
{: #securityc-check-functions }
보안 검사가 보안 프레임워크에 제공하는 두 가지 기본 기능은 다음과 같습니다.

### 권한 부여
{: #authorization }
프레임워크는 `SecurityCheck.authorize` 메소드를 사용하여 클라이언트 요청에
권한을 부여합니다. 클라이언트가 특정 OAuth 범위에 대한 액세스 권한을 요청할 때 프레임워크는 범위 요소를 보안 검사에 맵핑합니다. 범위에 속한 각 보안 검사에 대해 프레임워크에서
`authorize` 메소드를 호출하여 이 보안 검사에 맵핑된 범위 요소를 포함하는
범위에 대한 권한 부여를 요청합니다. 이 범위는 메소드의 **scope** 매개변수에서 제공됩니다.

보안 검사는 응답 매개변수 내에서 전달된 [`AuthorizationResponse` 오브젝트](../../../api/server-side-api/java/)에 응답을 추가합니다. 응답은 보안 검사 이름 및 응답 유형(성공, 실패 또는 인증 확인)을 포함합니다([`AuthorizationResponse.ResponseType`](../../../api/server-side-api/java/) 참조).

응답에 인증 확인 오브젝트나 사용자 정의 성공 또는 실패 데이터가 있으면
프레임워크에서 이 데이터를 JSON 오브젝트 내에 있는 클라이언트의
보안 검사 인증 확인 핸들러로
전달합니다. 성공의 경우, 응답에 권한 부여가 요청된 범위(**scope** 변수에
설정됨), 그리고 부여된 권한의 만기 시간도 포함되어
있습니다. 요청된 범위에 대한 액세스 권한을 클라이언트에 부여하려면
개별 범위 보안 검사의 `authorize` 메소드가 성공을 리턴하고,
모든 만기 시간이 현재 시간 이후여야 합니다.

### 자체 점검
{: #introspection }
프레임워크에서 `SecurityCheck.introspect` 메소드를 사용하여
자원 서버의 자체 점검 데이터를 검색할 수 있습니다. 이 메소드는 자체 점검이 요청된 범위에
포함되어 있는 각 보안 검사마다
호출됩니다. `authorize` 메소드와 마찬가지로,
`introspect` 메소드는 이 보안 검사에 맵핑된 범위 요소를 포함하는
**scope** 매개변수를 검색합니다. 자체 점검 데이터를 리턴하기 전에 이 메소드는 보안 검사의 현재 상태가
이전에 이 범위에 부여된 권한을 여전히 지원하는지
확인합니다. 권한이 여전히 유효하면, `introspect` 메소드는 **response**
매개변수 내에 전달된 [IntrospectionResponse 오브젝트](../../../api/server-side-api/java/)에 해당 응답을 추가합니다.

응답에는 보안 검사의 이름, 권한 부여가 요청된
범위(**scope** 매개변수에 설정됨), 부여된 권한의 만기 시간, 그리고 요청된
사용자 정의 자체 점검 데이터가 포함되어 있습니다. 권한을 더 이상 부여할 수 없는 경우(예:
이전 성공 상태의 만기 시간이 경과함) 메소드가 응답 추가 없이
리턴됩니다.

**참고:**

* 보안 프레임워크는 보안 검사에서 처리 결과를 수집하고, 관련 데이터를
클라이언트로 전달합니다. 프레임워크 처리에서 보안 검사의 상태는
전적으로 무시됩니다.
* `authorize` 또는 `introspect` 메소드를 호출하면
현재 상태의 만기 시간이 경과하지 않았더라도 보안 검사의 현재 상태가
변경될 수 있습니다.

> [ExternalizableSecurityCheck](../../externalizable-security-check) 학습서에서 `authorize` 및 `introspect` 메소드에 대해 자세히 알아보십시오.

### 보안 검사 상태 관리
{: #security-check-state-management }
보안 검사는 Stateful이므로, 해당 상호작용 상태를 추적하고 유지할 수 있습니다. 개별 권한 부여 또는 자체 점검 요청 시, 보안 프레임워크는 외부
스토리지(일반적으로, 분배된 캐시)에서 관련 보안 검사의 상태를
검색합니다. 요청 처리 종료 시, 프레임워크는 보안 검사 상태를 외부
스토리지에 다시 저장합니다.

보안 검사 규약은 보안 검사가 다음과 같을 것을 요구합니다.

* `java.io.Externalizable` 인터페이스를 구현합니다. 보안 검사는 이 인터페이스를 사용하여 해당 상태의 직렬화 및 직렬화 해제를
관리합니다.
* 해당 현재 상태에 대해 비활성 제한시간 및 만기 시간을 정의합니다. 보안 검사의 상태는 권한 부여 프로세스의 스테이지를 나타내며 무제한일 수
없습니다. 상태의 유효성 및 최대 비활성 시간에 대한 특정 기간은 구현된 로직에
따라 보안 검사 구현에서 설정됩니다. 보안 검사는 `getExpiresAt`의 구현과 SecurityCheck 인터페이스의 `getInactivityTimeoutSec`
메소드를 통해 해당 선택한 만기 시간 및 비활성 제한시간의 프레임워크에게 알립니다.

### 보안 검사 구성
{: #security-check-configuration }
보안 검사는 어댑터 레벨과 애플리케이션 레벨에서 모두 값을 사용자 정의할 수 있는
구성 특성을 표시할 수 있습니다. 특정 클래스의 보안 검사 정의에 따라
표시할 수 있는 이 클래스의 구성 특성이 결정되고, 클래스 정의에서 기본값을 사용자
정의할 수 있습니다. 특성 값은 보안 검사를 정의하는
어댑터와 검사를 사용하는 각 애플리케이션에 대해 모두 동적으로
추가 사용자 정의할 수 있습니다.

보안 검사 클래스는 `com.ibm.mfp.server.security.external.SecurityCheckConfiguration`
인터페이스(보안 검사 구성 인터페이스)를 구현하는 보안 검사 구성 클래스의
인스턴스를 작성하는 `createConfiguration` 메소드를 구현하여
지원되는 특성을 표시합니다. 이 인터페이스는 `SecurityCheck` 인터페이스를
보완하는 동시에 보안 검사 계약의 일부가 됩니다. 보안 검사에서 아무 특성도 표시하지 않는 구성 오브젝트를 작성할 수 있지만,
`createConfiguration` 메소드는 유효한 구성 오브젝트를 리턴해야 하고 null을 리턴할 수 없습니다. 보안 검사 구성 인터페이스의 전체 내용은 [`SecurityCheckConfiguration`](../../../api/server-side-api/java/)을 참조하십시오.

어댑터 또는 애플리케이션 구성을 변경하는 경우,
보안 프레임워크는 배치 동안 보안 검사의 `createConfiguration`
메소드를 호출합니다. 이 메소드의 properties
매개변수에는 어댑터의 보안 검사 정의에 정의된 특성과 현재 사용자 정의된
값(또는 사용자 정의가 없는 경우에는 기본값)이 포함되어 있습니다. 보안 검사 구성을 구현할 때 수신된 특성 값의 유효성을
검증하고, 유효성 검증 결과를 리턴하는 메소드를
제공해야 합니다.

보안 검사 구성은 `getErrors`, `getWarnings`, 및 `getInfo` 메소드를 구현해야 합니다. 또한 abstract 보안 검사 구성 기본 클래스 [`SecurityCheckConfigurationBase`](../../../api/server-side-api/java/)는 `getStringProperty`, `getIntProperty`, 및 `addMessage` 메소드를 정의하고 구현합니다. 자세한 정보는 이 클래스의 코드 문서를 참조하십시오.

**참고:** 보안 검사 정의 및 어댑터 또는 애플리케이션 사용자 정의에 있는 구성 특성의 이름 및 값은 구성 클래스에서 정의된 대로 지원 특성 및 허용 값과 일치해야 합니다.

> 보안 검사의 [사용자 정의 특성 작성](../#security-check-configuration)에 대해 자세히 알아보십시오.
