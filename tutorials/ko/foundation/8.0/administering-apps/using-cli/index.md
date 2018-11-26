---
layout: tutorial
title: 터미널을 통한 애플리케이션 관리
breadcrumb_title: Administrating using terminal
weight: 4
---
<!-- NLS_CHARSET=UTF-8 -->
## 개요
{: #overview }
**mfpadm** 프로그램을 통해 {{ site.data.keys.product_adj }} 애플리케이션을 관리할 수 있습니다.

>**8.0.0.0-MFPF-IF201701250919** 이후의 {{ site.data.keys.product_full }} SDK 버전은 업데이트된 앱 인증 지원을 제공합니다. 이 지원은 `dynamic` 또는 `static` 유효성 검증 간에 전환하고 이 유효성 검증을 재설정하는 `mfpadm` 명령입니다.
>
{{ site.data.keys.product_full }} 설치 디렉토리 `/MobilefirstPlatformServer/shortcuts`로 이동한 후 `mfpadm` 명령을 실행하십시오.
>
1.다음과 같이 유효성 검증 유형 간에 전환합니다.
```bash
	mfpadm --url=  --user=  --passwordfile= --secure=false app version [RUNTIME] [APPNAME] [ENVIRONMENT] [VERSION] set authenticity-validation TYPE
```  
*TYPE* 값은 `static` 또는 `dynamic`일 수 있습니다.
>
Android 예: 여기서는 유효성 검증 TYPE을 `dynamic`으로 설정합니다.
```bash
  mfpadm --url=http://localhost:8080/mfpadmin --user=admin --passwordfile="C:\userhome\mfppassword\MFP_password.txt" --secure=false app version mfp test android 1.0 set authenticity-validation dynamic
```
>
앱의 지문을 지우는 아래의 명령을 사용하여 데이터를 재설정합니다.
```bash
  mfpadm --url=  --user=  --passwordfile= --secure=false app version [RUNTIME] [APPNAME] [ENVIRONMENT] [VERSION] reset authenticity
```
예:
>
```bash
  mfpadm --url=http://localhost:8080/mfpadmin --user=admin --passwordfile="C:\userhome\mfppassword\MFP_password.txt" --secure=false app version mfp sample.com.pincodeandroid android 1.0 reset authenticity
```

#### 다음으로 이동
{: #jump-to }

* [다른 기능과 비교](#comparison-with-other-facilities)
* [전제조건](#prerequisites)

## 다른 기능과 비교
{: #comparison-with-other-facilities }
다음과 같은 방법으로 {{ site.data.keys.product_full }}을 사용해 관리 조작을 실행할 수 있습니다.

* 대화식 {{ site.data.keys.mf_console }}
* mfpadm Ant 태스크
* **mfpadm** 프로그램
* {{ site.data.keys.product_adj }} 관리 REST 서비스

**mfpadm** Ant 태스크, mfpadm 프로그램, REST 서비스는 다음 유스 케이스와 같이 조작을 자동으로 실행하거나 무인 실행하는 경우 유용합니다.

* 반복 조작에서 운영자 오류를 제거하는 경우 또는
* 운영자의 정상 근무 시간 외에 조작하는 경우 또는
* 테스트 또는 사전 프로덕션 서버와 동일한 설정을 사용하여 프로덕션 서버를 구성하는 경우

**mfpadm** 프로그램과 mfpadm Ant 태스크는 REST 서비스보다 사용이 간편하고 오류 보고 측면에서 우수합니다. mfpadm Ant 태스크에 비해 mfpadm 프로그램의 장점은 운영 체제 명령과 통합을 이미 사용할 수 있는 경우 통합이 보다 쉽다는 점입니다. 또한 대화식 사용에 더 적합합니다.

## 전제조건
{: #prerequisites }
**mfpadm** 도구는 {{ site.data.keys.mf_server }} 설치 프로그램을 사용해 설치됩니다. 이 페이지의 나머지 부분에서 **product\_install\_dir**은 {{ site.data.keys.mf_server }} 설치 프로그램의 설치 디렉토리를 표시합니다.

**mfpadm** 명령은 **product\_install\_dir/shortcuts/** 디렉토리에서 스크립트 세트로 제공됩니다.

* UNIX/Linux의 경우 mfpadm
* Windows의 경우 mfpadm.bat

이러한 스크립트는 실행 준비가 되어 있으며 이는 특정 환경 변수가 필요하지 않음을 의미합니다. 환경 변수 **JAVA_HOME**이 설정된 경우 스크립트에서 이를 승인합니다.  
**mfpadm** 프로그램을 사용하려면 **product\_install\_dir/shortcuts/** 디렉토리를 PATH 환경 변수에 넣거나 각 호출에서 해당 절대 파일 이름을 참조하십시오.

{{ site.data.keys.mf_server }} 설치 프로그램 실행에 대한 자세한 정보는 [IBM Installation Manager 실행](../../installation-configuration/production/installation-manager/)을 참조하십시오.

#### 다음으로 이동
{: #jump-to-1 }

* [**mfpadm** 프로그램 호출](#calling-the-mfpadm-program)
* [일반 구성에 대한 명령](#commands-for-general-configuration)
* [어댑터에 대한 명령](#commands-for-adapters)
* [앱에 대한 명령](#commands-for-apps)
* [디바이스에 대한 명령](#commands-for-devices)
* [문제점 해결에 대한 명령](#commands-for-troubleshooting)


### **mfpadm** 프로그램 호출
{: #calling-the-mfpadm-program }
**mfpadm** 프로그램을 사용하여 {{ site.data.keys.product_adj }} 애플리케이션을 관리할 수 있습니다.

#### 구문
{: #syntax }
다음과 같이 mfpadm 프로그램을 호출하십시오.

```bash
mfpadm --url= --user= ... [--passwordfile=...] [--secure=false] some command
```

**mfpadm** 프로그램의 옵션은 다음과 같습니다.

| 옵션	| 유형 | 설명 | 필수 여부 | 기본값 |
|-----------|------|-------------|----------|---------|
| --url | 	 | URL | 관리 서비스에 사용되는 {{ site.data.keys.product_adj }} 웹 애플리케이션의 기본 URL | 예 | |
| --secure	 | 부울 | 보안 위험이 있는 조작을 수행하지 않을지 여부 | 아니오 | true |
| --user	 | 이름 | {{ site.data.keys.product_adj }} 관리 서비스에 액세스하는 데 사용되는 사용자 이름 | 예 |  | 	 
| --passwordfile | 파일 | 사용자의 비밀번호가 있는 파일 | 아니오 |
| --timeout	     | 숫자  | 전체 REST 서비스 액세스의 제한시간(초) | 아니오 | 	 
| --connect-timeout | 숫자 | 네트워크 연결 설정의 제한시간(초) | 아니오 |
| --socket-timeout  | 숫자 | 네트워크 연결 끊어짐을 발견할 제한시간(초) | 아니오 |
| --connection-request-timeout | 숫자 연결 요청 풀에서 항목을 얻을 제한시간(초) | 아니오 |
| --lock-timeout | 숫자 | 잠금 획득 제한시간(초) | 아니오 | 2 |
| --verbose	     | 자세한 출력 | 아니오	| |  

**url**  
URL에서는 우선적으로 HTTPS 프로토콜을 사용합니다. 예를 들어, 기본 포트와 컨텍스트 루트를 사용하는 경우 다음 URL을 사용하십시오.

* WebSphere Application Server의 경우: https://server:9443/mfpadmin
* Tomcat의 경우: https://server:8443/mfpadmin

**secure**  
`--secure` 옵션은 기본적으로 true로 설정됩니다. 이 옵션을 `--secure=false`로 설정하면 다음과 같은 영향을 미칩니다.

* 암호화되지 않은 HTTP를 통해서도 사용자와 비밀번호가 안전하지 않은 방법으로 전송될 수 있습니다.
* 서버의 SSL 인증서가 자체 서명되었거나 서버의 호스트 이름과 다른 호스트 이름에 대해 작성된 경우에도 해당 인증서가 허용됩니다.

**비밀번호**  
`--passwordfile` 옵션으로 전달되는 별도의 파일에서 비밀번호를 지정합니다. 대화식 모드(대화식 모드 참조)에서 비밀번호를 대화식으로 지정할 수도 있습니다. 비밀번호는 민감한 정보이므로 보호되어야 합니다. 동일한 컴퓨터의 다른 사용자가 이 비밀번호를 알지 못하게 해야 합니다. 비밀번호에 대한 보안을 설정하려면 파일에 비밀번호를 입력하기 전에 자신이 아닌 다른 사용자의 파일 읽기 권한을 제거해야 합니다. 예를 들어, 다음 명령 중 하나를 사용할 수 있습니다.

* UNIX의 경우: `chmod 600 adminpassword.txt`
* Windows의 경우: `cacls adminpassword.txt /P Administrators:F %USERDOMAIN%\%USERNAME%:F`

이러한 이유로 명령행 인수를 통해 프로세스에 비밀번호를 전달하지 않도록 하십시오. 여러 운영 체제에서 다른 사용자가 사용자 프로세스의 명령행 인수를 조사할 수 있습니다.

mfpadm 호출은 명령을 포함합니다. 다음 명령이 지원됩니다.

| 명령                           | 설명 |
|-----------------------------------|-------------|
| show info	| 사용자 정보와 구성 정보를 표시합니다. |
| show global-config | 글로벌 구성 정보를 표시합니다. |
| show diagnostics | 진단 정보를 표시합니다. |
| show versions	| 버전 정보를 표시합니다. |
| unlock | 일반 용도의 잠금을 해제합니다. |
| list runtimes [--in-database] | 런타임을 나열합니다. |
| show runtime [runtime-name] | 런타임에 대한 정보를 표시합니다. |
| delete runtime [runtime-name] condition | 런타임을 삭제합니다. |
| show user-config [runtime-name] | 런타임의 사용자 구성을 표시합니다. |
| set user-config [runtime-name] file | 런타임의 사용자 구성을 지정합니다. |
| set user-config [runtime-name] property = value | 런타임의 사용자 구성에서 특성을 지정합니다. |
| show confidential-clients [runtime-name] | 런타임의 기밀 클라이언트 구성을 표시합니다. |
| set confidential-clients [runtime-name] file | 런타임의 기밀 클라이언트 구성을 지정합니다. |
| set confidential-clients-rule [runtime-name] id display-name secret allowed-scope | 런타임의 기밀 클라이언트 구성에 대한 규칙을 지정합니다. |
| list adapters [runtime-name] | 어댑터를 나열합니다. |
| deploy adapter [runtime-name] property = value | 어댑터를 배치합니다.|
| show adapter [runtime-name] adapter-name | 어댑터에 대한 정보를 표시합니다.|
| delete adapter [runtime-name] adapter-name | 어댑터를 삭제합니다.|
| adapter [runtime-name] adapter-name get binary [> tofile]	| 어댑터의 2진 데이터를 가져옵니다.|
| list apps [runtime-name] | 앱을 나열합니다.|
| deploy app [runtime-name] file | 앱을 배치합니다.|
| show app [runtime-name] app-name | 앱에 대한 정보를 표시합니다.|
| delete app [runtime-name] app-name | 앱을 삭제합니다. |
| show app version [runtime-name] app-name environment version | 앱 버전에 대한 정보를 표시합니다. |
| delete app version [runtime-name] app-name environment version | 앱 버전을 삭제합니다. |
| app [runtime-name] app-name show license-config | 앱의 토큰 라이센스 구성을 표시합니다. |
| app [runtime-name] app-name set license-config app-type license-type | 앱의 토큰 라이센스 구성을 지정합니다. |
| app [runtime-name] app-name delete license-config | 앱의 토큰 라이센스 구성을 제거합니다. |
| app version [runtime-name] app-name environment version get descriptor [> tofile]	| 앱 버전의 디스크립터를 가져옵니다. |
| app version [runtime-name] app-name environment version get web-resources [> tofile] | 앱 버전의 웹 자원을 가져옵니다. |
| app version [runtime-name] app-name environment version set web-resources file | 앱 버전의 웹 자원을 지정합니다. |
| app version [runtime-name] app-name environment version get authenticity-data [> tofile] | 앱 버전의 인증 데이터를 가져옵니다. |
| app version [runtime-name] app-name environment version set authenticity-data [file] | 앱 버전의 인증 데이터를 지정합니다. |
| app version [runtime-name] app-name environment version delete authenticity-data | 앱 버전의 인증 데이터를 삭제합니다. |
| app version [runtime-name] app-name environment version show user-config | 앱 버전의 사용자 구성을 표시합니다. |
| app version [runtime-name] app-name environment version set user-config file | 앱 버전의 사용자 구성을 지정합니다. |
| app version [runtime-name] app-name environment version set user-config property = value | 앱 버전의 사용자 구성에서 특성을 지정합니다. |
| list devices [runtime-name][--query query] | 디바이스를 나열합니다. |
| remove device [runtime-name] id | 디바이스를 제거합니다. |
| device [runtime-name] id set status new-status | 디바이스 상태를 변경합니다. |
| device [runtime-name] id set appstatus app-name new-status | 앱의 디바이스 상태를 변경합니다. |
| list farm-members [runtime-name] | 서버 팜 멤버인 서버를 나열합니다. |
| remove farm-member [runtime-name] server-id | 팜 멤버 목록에서 서버를 제거합니다. |

#### 대화식 모드
{: #interactive-mode }
다른 방법으로, 명령행에서 명령을 사용하지 않고 **mfpadm**을 호출할 수도 있습니다. 그런 다음 한 행에 하나씩 대화식으로 명령을 입력할 수 있습니다.
`exit` 명령 또는 표준 입력에서 파일의 끝(EOF)(UNIX 터미널의 **Ctrl-D**)은 mfpadm을 종료합니다.

`Help` 명령도 이 모드에서 사용할 수 있습니다. 예:

* help
* help show versions
* help device
* help device set status

#### 대화식 모드의 명령 히스토리
{: #command-history-in-interactive-mode }
일부 운영 체제에서 대화식 mfpadm 명령은 명령 히스토리를 저장합니다. 명령 히스토리에서 위로 화살표 키와 아래로 화살표 키를 사용하여 이전 명령을 선택해서 편집하고 실행할 수 있습니다.

**Linux의 경우**  
rlwrap 패키지가 설치되어 있고 PATH에 있으면 터미널 에뮬레이터 창에서 명령 히스토리를 사용할 수 있습니다. rlwrap 패키지를 설치하려면 다음을 실행하십시오.

* Red Hat Linux의 경우: `sudo yum install rlwrap`
* SUSE Linux의 경우: `sudo zypper install rlwrap`
* Ubuntu의 경우: `sudo apt-get install rlwrap`

**OS X의 경우**  
rlwrap 패키지가 설치되어 있고 PATH에 있으면 터미널 프로그램에서 명령 히스토리를 사용할 수 있습니다. rlwrap 패키지를 설치하려면 다음을 실행하십시오.

1. [www.macports.org](http://www.macports.org)에서 설치 프로그램을 사용하여 MacPorts를 설치하십시오.
2. `sudo /opt/local/bin/port install rlwrap` 명령을 실행하십시오.
3. 그런 다음 PATH에서 rlwrap 프로그램을 사용할 수 있도록 Bourne 호환 가능 쉘에서 `PATH=/opt/local/bin:$PATH` 명령을 사용하십시오.

**Windows의 경우**  
cmd.exe 콘솔 창에서 명령 히스토리를 사용할 수 있습니다.

rlwrap가 작동하지 않거나 필요 없는 환경에서는 `--no-readline` 옵션을 통해 사용 안함으로 설정할 수 있습니다.

#### 구성 파일
{: #the-configuration-file }
모든 호출에서 명령행에 옵션을 전달하는 대신 구성 파일에 옵션을 저장할 수도 있습니다. 구성 파일이 있으며 –configfile=file 옵션이 지정된 경우에는 다음 옵션을 생략할 수 있습니다.

* --url=URL
* --secure=boolean
* --user=name
* --passwordfile=file
* --timeout=seconds
* --connect-timeout=seconds
* --socket-timeout=seconds
* --connection-request-timeout=seconds
* --lock-timeout=seconds
* runtime-name

다음 명령을 사용하여 이러한 값을 구성 파일에 저장합니다.

| 명령 | 주석 |
|---------|---------|
| mfpadm [--configfile=file] config url URL | |
| mfpadm [--configfile=file] config secure boolean | |
| mfpadm [--configfile=file] config user name | |
| mfpadm [--configfile=file] config password | 비밀번호를 입력하도록 프롬프트를 표시합니다. |
| mfpadm [--configfile=file] config timeout seconds | |
| mfpadm [--configfile=file] config connect-timeout seconds | |
| mfpadm [--configfile=file] config socket-timeout seconds | |
| mfpadm [--configfile=file] config connection-request-timeout seconds | |
| mfpadm [--configfile=file] config lock-timeout seconds | |
| mfpadm [--configfile=file] config runtime runtime-name | |

구성 파일에 저장된 값을 나열하려면 다음 명령을 사용하십시오. `mfpadm [--configfile=file] config`

구성 파일은 Java **.properties** 구문에서 현재 로케일로 인코딩된 텍스트 파일입니다. 기본 구성 파일은 다음과 같습니다.

* UNIX: **${HOME}/.mfpadm.config**
* Windows: **{{ site.data.keys.prod_server_data_dir_win }}\mfpadm.config**

**참고:** `--configfile` 옵션을 지정하지 않는 경우 대화식 모드와 구성 명령에서만 기본 구성 파일이 사용됩니다. 기타 명령을 비대화식으로 사용하는 경우 구성 파일을 사용하려면 명시적으로 구성 파일을 지정해야 합니다.

> **중요:** 비밀번호는 잠시라도 보이지 않도록 비밀번호를 숨기는 난독화된 형식으로 저장됩니다. 그러나 이러한 난독화가 보안을 제공하지는 않습니다.

#### 일반 옵션
{: #generic-options }
일반적인 옵션도 있습니다.

| 옵션	| 설명 |
|-----------|-------------|
| --help	| 몇몇 사용법 도움말 표시 |
| --version	| 버전 표시 |

#### XML 형식
{: #xml-format }
서버에서 XML 응답을 받는 명령은 이 응답이 특정 스키마를 준수하는지 확인합니다. `--xmlvalidation=none`을 지정하여 이 검사를 사용 안함으로 설정할 수 있습니다.

#### 출력 문자 세트
{: #output-character-set }
mfpadm 프로그램에서 생성하는 일반 출력은 현재 로케일의 인코딩 형식으로 인코딩됩니다. Windows에서는 이 인코딩 형식을 "ANSI 코드 페이지"라고 합니다. 영향은 다음과 같습니다.

* 이 문자 세트 외부의 문자는 출력 시 물음표로 변환됩니다.
* 출력이 Windows 명령 프롬프트 창(cmd.exe)으로 이동하는 경우 해당 창에서는 문자가 "OEM 코드 페이지"에서 인코딩된다고 가정하므로 비ASCII 문자가 올바르지 않게 표시됩니다.

이 제한사항의 임시 해결책은 다음과 같습니다.

* Windows 이외의 운영 체제에서 인코딩이 UTF-8인 로케일을 사용하십시오. 이 형식은 Red Hat Linux와 OS X의 기본 로케일입니다. 기타 여러 운영 체제에는 `en_US.UTF-8` 로케일이 있습니다.
* 또는 `output="some file name"` 속성이 있는 mfpadm Ant 태스크를 사용하여 명령의 출력 경로를 파일로 재지정하십시오.

### 일반 구성에 대한 명령
{: #commands-for-general-configuration }
**mfpadm** 프로그램을 호출할 때 IBM {{ site.data.keys.mf_server }} 또는 런타임의 글로벌 구성에 액세스하는 여러 명령을 포함할 수 있습니다.

#### `show global-config` 명령
{: #the-show-global-config-command }
`show global-config` 명령은 글로벌 구성을 표시합니다.

구문: `show global-config`

여기서는 다음 옵션을 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| --xml    | 표 형식 출력 대신 XML 출력을 생성합니다. |

**예제**  

```bash
show global-config
```

이 명령은 [Global Configuration (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_global_configuration_get.html?view=kc#Global-Configuration--GET-) REST 서비스를 기반으로 합니다.

<br/>
#### `show user-config` 명령
{: #the-show-user-config-command }
`show user-config` 명령은 런타임의 사용자 구성을 표시합니다.

구문: `show user-config [--xml] [runtime-name]`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |

`show user-config` 명령에서는 verb 뒤에 다음 옵션을 사용합니다.

| 인수 | 설명 | 필수 여부 | 기본값 |
|----------|-------------|----------|---------|
| --xml | JSON 형식 대신 XML 형식으로 출력을 생성합니다. | 아니오 | 표준 출력 |

**예제**  

```bash
show user-config mfp
```

이 명령은 [Runtime Configuration (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_runtime_configuration_get.html?view=kc#Runtime-Configuration--GET-) REST 서비스를 기반으로 합니다.

<br/>
#### `set user-config` 명령
{: #the-set-user-config-command }
`set user-config` 명령은 런타임의 사용자 구성 또는 이 구성의 단일 특성을 지정합니다.

전체 구성의 구문: `set user-config [runtime-name] file`

여기서는 다음 인수를 사용합니다.

| 속성 | 설명 |
|-----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| 파일 | 새 구성이 포함된 JSON 또는 XML 파일의 이름입니다. |

단일 특성의 구문: `set user-config [runtime-name] property = value`

`set user-config` 명령에서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| property | JSON 특성의 이름입니다. 중첩된 특성의 경우 구문 prop1.prop2.....propN을 사용하십시오. JSON 배열 요소의 경우 특성 이름 대신 색인을 사용하십시오. |
| value | 특성의 값입니다. |

**예제**  

```bash
set user-config mfp myconfig.json
```

```bash
set user-config mfp timeout = 240
```

이 명령은 [Runtime configuration (PUT)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_runtime_configuration_put.html?view=kc#Runtime-configuration--PUT-) REST 서비스를 기반으로 합니다.

<br/>
#### `show confidential-clients` 명령
{: #the-show-confidential-clients-command }
`show confidential-clients` 명령은 런타임에 액세스할 수 있는 기밀 클라이언트의 구성을 표시합니다. 기밀 클라이언트에 대한 자세한 정보는 [기밀 클라이언트](../../authentication-and-security/confidential-clients)를 참조하십시오.

구문: `show confidential-clients [--xml] [runtime-name]`

여기서는 다음 인수를 사용합니다.

| 속성 | 설명 |
|-----------|-------------|
| runtime-name | 런타임의 이름입니다. |

`show confidential-clients` 명령에서는 verb 뒤에 다음 옵션을 사용합니다.

| 인수 | 설명 | 필수 여부 | 기본값 |
|----------|-------------|----------|---------|
| --xml | JSON 형식 대신 XML 형식으로 출력을 생성합니다. | 아니오 | 표준 출력 |

**예제**

```bash
show confidential-clients --xml mfp
```

이 명령은 [Confidential Clients (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_confidential_clients_get.html?view=kc#Confidential-Clients--GET-) REST 서비스를 기반으로 합니다.

<br/>
#### `set confidential-clients` 명령
{: #the-set-confidential-clients-command }
`set confidential-clients` 명령은 런타임에 액세스할 수 있는 기밀 클라이언트의 구성을 지정합니다. 기밀 클라이언트에 대한 자세한 정보는 [기밀 클라이언트](../../authentication-and-security/confidential-clients)를 참조하십시오.

구문: `set confidential-clients [runtime-name] file`

여기서는 다음 인수를 사용합니다.

| 속성 | 설명 |
|-----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| 새 구성이 포함된 JSON 또는 XML 파일의 파일 이름입니다. |

**예제**

```bash
set confidential-clients mfp clients.xml
```

이 명령은 [Confidential Clients (PUT)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_confidential_clients_put.html?view=kc#Confidential-Clients--PUT-) REST 서비스를 기반으로 합니다.

<br/>
#### `set confidential-clients-rule` 명령
{: #the-set-confidential-clients-rule-command }
`set confidential-clients-rule` 명령은 런타임에 액세스할 수 있는 기밀 클라이언트의 구성에 규칙을 지정합니다. 기밀 클라이언트에 대한 자세한 정보는 [기밀 클라이언트](../../authentication-and-security/confidential-clients)를 참조하십시오.

구문: `set confidential-clients-rule [runtime-name] id displayName secret allowedScope`

여기서는 다음 인수를 사용합니다.

| 속성	| 설명 |
|-----------|-------------|
| runtime | 런타임의 이름입니다. |
| id | 규칙 ID입니다. |
| displayName | 규칙의 표시 이름입니다. |
| secret | 규칙의 시크릿입니다. |
| allowedScope | 규칙의 범위입니다. 공백으로 구분된 토큰 목록입니다. 둘 이상의 토큰 목록을 전달하려면 큰따옴표를 사용하십시오. |

**예제**

```bash
set confidential-clients-rule mfp push Push lOa74Wxs "**"
```

이 명령은 [Confidential Clients (PUT)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_confidential_clients_put.html?view=kc#Confidential-Clients--PUT-) REST 서비스를 기반으로 합니다.

### 어댑터에 대한 명령
{: #commands-for-adapters }
**mfpadm** 프로그램을 호출할 때 어댑터에 대한 여러 명령을 포함할 수 있습니다.

### `list adapters` 명령
{: #the-list-adapters-command }
`list adapters` 명령은 런타임에 사용하도록 배치되는 어댑터의 목록을 리턴합니다.

구문: `list adapters [runtime-name]`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |

`list adapters` 명령에서는 오브젝트 뒤에 다음 옵션을 사용합니다.

| 옵션 | 설명 |
|--------|-------------|
| --xml | 표 형식 출력 대신 XML 출력을 생성합니다. |

**예제**  

```xml
list adapters mfp
```

이 명령은 [Adapter (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_adapters_get.html?view=kc#Adapters--GET-) REST 서비스를 기반으로 합니다.

<br/>
#### `deploy adapter` 명령
{: #the-deploy-adapter-command }
`deploy adapter` 명령은 런타임에 어댑터를 배치합니다.

구문: `deploy adapter [runtime-name] file`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| 파일 | 2진 어댑터 파일입니다(.adapter). |

**예제**

```bash
deploy adapter mfp MyAdapter.adapter
```

이 명령은 [Adapter (POST)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_adapter_post.html?view=kc#Adapter--POST-) REST 서비스를 기반으로 합니다.

<br/>
#### `show adapter` 명령
{: #the-show-adapter-command }
`show adapter` 명령은 어댑터에 대한 세부사항을 표시합니다.

구문: `show adapter [runtime-name] adapter-name`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| adapter-name | 어댑터의 이름입니다. |

`show adapter` 명령에서는 오브젝트 뒤에 다음 옵션을 사용합니다.

| 옵션 | 설명 |
|--------|-------------|
| --xml | 표 형식 출력 대신 XML 출력을 생성합니다. |

**예제**

```bash
show adapter mfp MyAdapter
```

이 명령은 [Adapter (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_adapter_get.html?view=kc#Adapter--GET-) REST 서비스를 기반으로 합니다.

<br/>
#### `delete adapter` 명령
{: #the-delete-adapter-command }
`delete adapter` 명령은 런타임에서 어댑터를 제거(배치 취소)합니다.

구문: `delete adapter [runtime-name] adapter-name`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| adapter-name | 어댑터의 이름입니다. |

**예제**

```bash
delete adapter mfp MyAdapter
```

이 명령은 [Adapter (DELETE)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_adapter_delete.html?view=kc#Adapter--DELETE-) REST 서비스를 기반으로 합니다.

<br/>
#### `adapter` 명령 접두부
{: #the-adapter-command-prefix }
`adapter` 명령 접두부에서는 verb 앞에 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| adapter-name | 어댑터의 이름입니다. |

<br/>
#### `adapter get binary` 명령
{: #the-adapter-get-binary-command }
`adapter get binary` 명령은 2진 어댑터 파일을 리턴합니다.

구문: `adapter [runtime-name] adapter-name get binary [> tofile]`

여기서는 verb 뒤에 다음 옵션을 사용합니다.

| 옵션 | 설명 | 필수 여부 | 기본값 |
|--------|-------------|----------|---------|
| > tofile | 출력 파일의 이름입니다. | 아니오 | 표준 출력 |

**예제**

```bash
adapter mfp MyAdapter get binary > /tmp/MyAdapter.adapter
```

이 명령은 [Export runtime resources (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_export_runtime_resources_get.html?view=kc) REST 서비스를 기반으로 합니다.

<br/>
#### `adapter show user-config` 명령
{: #the-adapter-show-user-config-command }
`adapter show user-config` 명령은 어댑터의 사용자 구성을 표시합니다.

구문: `adapter [runtime-name] adapter-name show user-config [--xml]`

여기서는 verb 뒤에 다음 옵션을 사용합니다.

| 옵션 | 설명 |
|--------|-------------|
| --xml | JSON 형식 대신 XML 형식으로 출력을 생성합니다. |

**예제**

```bash
adapter mfp MyAdapter show user-config
```

이 명령은 [Adapter Configuration (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_adapter_configuration_get.html?view=kc#Adapter-Configuration--GET-) REST 서비스를 기반으로 합니다.

<br/>
#### `adapter set user-config` 명령
{: #the-adapter-set-user-config-command }
`adapter set user-config` 명령은 어댑터의 사용자 구성 또는 이 구성의 단일 특성을 지정합니다.

전체 구성의 구문: `adapter [runtime-name] adapter-name set user-config file`

여기서는 verb 뒤에 다음 인수를 사용합니다.

| 옵션 | 설명 |
|--------|-------------|
| 파일 | 새 구성이 포함된 JSON 또는 XML 파일의 이름입니다. |

단일 특성의 구문: `adapter [runtime-name] adapter-name set user-config property = value`

여기서는 verb 뒤에 다음 인수를 사용합니다.

| 옵션 | 설명 |
|--------|-------------|
| property | JSON 특성의 이름입니다. 중첩된 특성의 경우 구문 prop1.prop2.....propN을 사용하십시오. JSON 배열 요소의 경우 특성 이름 대신 색인을 사용하십시오. |
| value | 특성의 값입니다. |

**예제**

```bash
adapter mfp MyAdapter set user-config myconfig.json
```

```bash
adapter mfp MyAdapter set user-config timeout = 240
```

이 명령은 [어댑터 구성(PUT)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_adapter_configuration_put.html?view=kc) REST 서비스를 기반으로 합니다.

### 앱에 대한 명령
{: #commands-for-apps }
**mfpadm** 프로그램을 호출할 때 앱에 대한 여러 명령을 포함할 수 있습니다.

#### `list apps` 명령
{: #the-list-apps-command }
`list apps` 명령은 런타임에 배치되는 앱의 목록을 리턴합니다.

구문: `list apps [runtime-name]`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |

`list apps` 명령에서는 오브젝트 뒤에 다음 옵션을 사용합니다.

| 옵션 | 설명 |
|--------|-------------|
| --xml | 표 형식 출력 대신 XML 출력을 생성합니다. |

**예제**

```bash
list apps mfp
```

이 명령은 [Application (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_applications_get.html?view=kc#Applications--GET-) REST 서비스를 기반으로 합니다.

#### `deploy app` 명령
{: #the-deploy-app-command }
`deploy app` 명령은 런타임에 앱 버전을 배치합니다.

구문: `deploy app [runtime-name] file`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| 파일 | 애플리케이션 디스크립터입니다(JSON 파일). |

**예제**

```bash
deploy app mfp MyApp/application-descriptor.json
```

이 명령은 [Application (POST)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_application_post.html?view=kc#Application--POST-) REST 서비스를 기반으로 합니다.

#### `show app` 명령
{: #the-show-app-command }
`show app` 명령은 런타임에서 앱에 대한 세부사항(특히 해당 환경과 버전)을 표시합니다.

구문: `show app [runtime-name] app-name`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| app-name | 앱의 이름입니다. |

`show app` 명령에서는 오브젝트 뒤에 다음 옵션을 사용합니다.

| 옵션 | 설명 |
|--------|-------------|
| --xml	 | 표 형식 출력 대신 XML 출력을 생성합니다. |

**예제**

```bash
show app mfp MyApp
```

이 명령은 [Application (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_application_get.html?view=kc#Application--GET-) REST 서비스를 기반으로 합니다.

#### `delete app` 명령
{: #the-delete-app-command }
`delete app` 명령은 런타임의 모든 환경과 모든 버전에서 앱을 제거(배치 취소)합니다.

구문: `delete app [runtime-name] app-name`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| app-name | 앱의 이름입니다. |

**예제**

```bash
delete app mfp MyApp
```

이 명령은 [Application Version (DELETE)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_application_version_delete.html?view=kc#Application-Version--DELETE-) REST 서비스를 기반으로 합니다.

#### `show app version` 명령
{: #the-show-app-version-command }
`show app version` 명령은 런타임에 앱 버전에 대한 세부사항을 표시합니다.

구문: `show app version [runtime-name] app-name environment version`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| app-name | 앱의 이름입니다. |
| environment | 모바일 플랫폼입니다. |
| version | 앱의 버전입니다. |

`show app version` 명령에서는 오브젝트 뒤에 다음 옵션을 사용합니다.

| 인수 | 설명 |
| ---------|-------------|
| -- xml | 표 형식 출력 대신 XML 출력을 생성합니다. |

**예제**

```bash
show app version mfp MyApp iPhone 1.1
```

이 명령은 [Application Version (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_application_version_get.html?view=kc#Application-Version--GET-) REST 서비스를 기반으로 합니다.

#### `delete app version` 명령
{: #the-delete-app-version-command }
`delete app version` 명령은 런타임에서 앱 버전을 제거(배치 취소)합니다.

구문: `delete app version [runtime-name] app-name environment version`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| app-name | 앱의 이름입니다. |
| environment | 모바일 플랫폼입니다. |
| version | 앱의 버전입니다. |

**예제**

```bash
delete app version mfp MyApp iPhone 1.1
```

이 명령은 [Application Version (DELETE)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_application_version_delete.html?view=kc#Application-Version--DELETE-) REST 서비스를 기반으로 합니다.

#### `app` 명령 접두부
{: #the-app-command-prefix }
`app` 명령 접두부에서는 verb 앞에 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| app-name | 앱의 이름입니다. |

#### `app show license-config` 명령
{: #the-app-show-license-config-command }
`app show license-config` 명령은 앱의 토큰 라이센스 구성을 표시합니다.

구문: `app [runtime-name] app-name show license-config`

여기서는 오브젝트 뒤에 다음 옵션을 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| --xml | 표 형식 출력 대신 XML 출력을 생성합니다. |

**예제**

```bash
app mfp MyApp show license-config
```

이 명령은 [Application license configuration (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_application_license_configuration_get.html?view=kc) REST 서비스를 기반으로 합니다.

#### `app set license-config` 명령
{: #the-app-set-license-config-command }
`app set license-config` 명령은 앱의 토큰 라이센스 구성을 지정합니다.

구문: `app [runtime-name] app-name set license-config app-type license-type`

여기서는 verb 뒤에 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| appType | 앱의 유형입니다(B2C 또는 B2E). |
| licenseType | 애플리케이션의 유형입니다(APPLICATION, ADDITIONAL_BRAND_DEPLOYMENT 또는 NON_PRODUCTION). |

**예제**

```bash
app mfp MyApp iPhone 1.1 set license-config B2E APPLICATION
```

이 명령은 [Application License Configuration (POST)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_application_license_configuration__post.html?view=kc) REST 서비스를 기반으로 합니다.

#### `app delete license-config` 명령
{: #the-app-delete-license-config-command }
`app delete license-config` 명령은 앱의 토큰 라이센스 구성을 재설정하여 초기 상태로 되돌립니다.

구문: `app [runtime-name] app-name delete license-config`

**예제**

```bash
app mfp MyApp iPhone 1.1 delete license-config
```

이 명령은 [License configuration (DELETE)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_license_configuration_delete.html?view=kc#License-configuration--DELETE-) REST 서비스를 기반으로 합니다.

#### `app version` 명령 접두부
{: #the-app-version-command-prefix }
`app version` 명령 접두부에서는 verb 앞에 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| app-name | 앱의 이름입니다. |
| environment | 모바일 플랫폼입니다. |
| version | 앱의 버전입니다. |

#### `app version get descriptor` 명령
{: #the-app-version-get-descriptor-command }
`app version get descriptor` 명령은 앱 버전의 애플리케이션 디스크립터를 리턴합니다.

구문: `app version [runtime-name] app-name environment version get descriptor [> tofile]`

여기서는 verb 뒤에 다음 인수를 사용합니다.

| 인수 | 설명 | 필수 여부 | 기본값 |
|----------|-------------|----------|---------|
| > tofile | 출력 파일의 이름입니다. | 아니오 | 표준 출력 |

**예제**

```bash
app version mfp MyApp iPhone 1.1 get descriptor > /tmp/MyApp-application-descriptor.json
```

이 명령은 [Application Descriptor (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_application_descriptor_get.html?view=kc#Application-Descriptor--GET-) REST 서비스를 기반으로 합니다.

#### `app version get web-resources` 명령
{: #the-app-version-get-web-resources-command }
`app version get web-resources` 명령은 앱 버전의 웹 자원을 .zip 파일로 리턴합니다.

구문: `app version [runtime-name] app-name environment version get web-resources [> tofile]`

여기서는 verb 뒤에 다음 인수를 사용합니다.

| 인수 | 설명 | 필수 여부 | 기본값 |
|----------|-------------|----------|---------|
| > tofile | 출력 파일의 이름입니다. | 아니오 | 표준 출력 |

**예제**

```bash
app version mfp MyApp iPhone 1.1 get web-resources > /tmp/MyApp-web.zip
```

이 명령은 [Retrieve Web Resource (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_retrieve_web_resource_get.html?view=kc#Retrieve-Web-Resource--GET-) REST 서비스를 기반으로 합니다.

#### `app version set web-resources` 명령
{: #the-app-version-set-web-resources-command }
`app version set web-resources` 명령은 앱 버전의 웹 자원을 지정합니다.

구문: `app version [runtime-name] app-name environment version set web-resources file`

여기서는 verb 뒤에 다음 인수를 사용합니다.

| 인수 | 설명 |
| file | 입력 파일의 이름입니다(.zip 파일이어야 함). |

**예제**

```bash
app version mfp MyApp iPhone 1.1 set web-resources /tmp/MyApp-web.zip
```

이 명령은 [Deploy a web resource (POST)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_deploy_a_web_resource_post.html?view=kc#Deploy-a-web-resource--POST-) REST 서비스를 기반으로 합니다.

#### `app version get authenticity-data` 명령
{: #the-app-version-get-authenticity-data-command }
`app version get authenticity-data` 명령은 앱 버전의 인증 데이터를 리턴합니다.

구문: `app version [runtime-name] app-name environment version get authenticity-data [> tofile]`

여기서는 verb 뒤에 다음 인수를 사용합니다.

| 인수 | 설명 | 필수 여부 | 기본값 |
| > tofile | 출력 파일의 이름입니다. | 아니오 | 표준 출력 |

**예제**

```bash
app version mfp MyApp iPhone 1.1 get authenticity-data > /tmp/MyApp.authenticity_data
```

이 명령은 [Export runtime resources (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_export_runtime_resources_get.html?view=kc) REST 서비스를 기반으로 합니다.

#### `app version set authenticity-data` 명령
{: #the-app-version-set-authenticity-data-command }
`app version set authenticity-data` 명령은 앱 버전의 인증 데이터를 지정합니다.

구문: `app version [runtime-name] app-name environment version set authenticity-data file`

여기서는 verb 뒤에 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| 파일 | 입력 파일의 이름입니다.<ul><li>.authenticity_data 파일</li><li>또는 디바이스 파일(.ipa, .apk 또는 .appx)이며 여기에서 인증 데이터를 추출합니다.</li></ul>|

**예제**

```bash
app version mfp MyApp iPhone 1.1 set authenticity-data /tmp/MyApp.authenticity_data
```

```bash
app version mfp MyApp iPhone 1.1 set authenticity-data MyApp.ipa
```

```bash
app version mfp MyApp android 1.1 set authenticity-data MyApp.apk
```

이 명령은 [Deploy Application Authenticity Data (POST)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_deploy_application_authenticity_data_post.html?view=kc) REST 서비스를 기반으로 합니다.

#### `app version delete authenticity-data` 명령
{: #the-app-version-delete-authenticity-data-command }
`app version delete authenticity-data` 명령은 앱 버전의 인증 데이터를 삭제합니다.

구문: `app version [runtime-name] app-name environment version delete authenticity-data`

**예제**

```bash
app version mfp MyApp iPhone 1.1 delete authenticity-data
```

이 명령은 [Application Authenticity (DELETE)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_application_authenticity_delete.html?view=kc) REST 서비스를 기반으로 합니다.

#### `app version show user-config` 명령
{: #the-app-version-show-user-config-command }
`app version show user-config` 명령은 앱 버전의 사용자 구성을 표시합니다.

구문: `app version [runtime-name] app-name environment version show user-config [--xml]`

여기서는 verb 뒤에 다음 옵션을 사용합니다.

| 인수 | 설명 | 필수 여부 | 기본값 |
|----------|-------------|----------|---------|
| [--xml] | JSON 형식 대신 XML 형식으로 출력을 생성합니다. | 아니오 | 표준 출력 |

**예제**

```bash
app version mfp MyApp iPhone 1.1 show user-config
```

이 명령은 [Application Configuration (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_application_configuration_get.html?view=kc#Application-Configuration--GET-) REST 서비스를 기반으로 합니다.

### `app version set user-config` 명령
{: #the-app-version-set-user-config-command }
`app version set user-config` 명령은 앱 버전의 사용자 구성 또는 이 구성의 단일 특성을 지정합니다.

전체 구성의 구문: `app version [runtime-name] app-name environment version set user-config file`

여기서는 verb 뒤에 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| 파일 | 새 구성이 포함된 JSON 또는 XML 파일의 이름입니다. |

단일 특성의 구문: `app version [runtime-name] app-name environment version set user-config property = value`

`app version set user-config` 명령에서는 verb 뒤에 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| property | JSON 특성의 이름입니다. 중첩된 특성의 경우 구문 prop1.prop2.....propN을 사용하십시오. JSON 배열 요소의 경우 특성 이름 대신 색인을 사용하십시오. |
| value | 특성의 값입니다. |

**예제**

```bash
app version mfp MyApp iPhone 1.1 set user-config /tmp/MyApp-config.json
```

```bash
app version mfp MyApp iPhone 1.1 set user-config timeout = 240
```

이 명령은 [Application Configuration (PUT)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_application_configuration_put.html?view=kc) REST 서비스를 기반으로 합니다.

### 디바이스에 대한 명령
{: #commands-for-devices }
**mfpadm** 프로그램을 호출할 때 디바이스에 대한 여러 명령을 포함할 수 있습니다.

#### `list devices` 명령
{: #the-list-devices-command }
`list devices` 명령은 런타임의 앱에 접속한 디바이스의 목록을 리턴합니다.

구문: `list devices [runtime-name] [--query query]`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| query | 검색할 친숙한 이름 또는 사용자 ID입니다. 이 매개변수는 검색할 문자열을 지정합니다. 이 문자열(대소문자 구분 없이 일치)을 포함하는 친숙한 이름 또는 사용자 ID를 사용하는 모든 디바이스가 리턴됩니다. |

`list devices` 명령에서는 오브젝트 뒤에 다음 옵션을 사용합니다.

| 옵션 | 설명 |
|--------|-------------|
| --xml | 표 형식 출력 대신 XML 출력을 생성합니다. |

**예제**

```bash
list-devices mfp
```

```bash
list-devices mfp --query=john
```

이 명령은 [Devices (GET) REST](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_devices_get.html?view=kc#Devices--GET-) 서비스를 기반으로 합니다.

#### `remove device` 명령
{: #the-remove-device-command }
`remove device` 명령은 런타임의 앱에 접속한 디바이스에 대한 레코드를 지웁니다.

구문: `remove device [runtime-name] id`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| id | 고유 디바이스 ID입니다. |

**예제**

```bash
remove device mfp 496E974CCEDE86791CF9A8EF2E5145B6
```

이 명령은 [Device (DELETE)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_device_delete.html?view=kc#Device--DELETE-) REST 서비스를 기반으로 합니다.

#### `device` 명령 접두부
{: #the-device-command-prefix }
`device` 명령 접두부에서는 verb 앞에 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| id | 고유 디바이스 ID입니다. |

#### `device set status` 명령
{: #the-device-set-status-command }
`device set status` 명령은 런타임의 범위에서 디바이스의 상태를 변경합니다.

구문: `device [runtime-name] id set status new-status`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| new-status | 새 상태입니다. |

상태의 값은 다음 중 하나입니다.

* ACTIVE
* LOST
* STOLEN
* EXPIRED
* DISABLED

**예제**

```bash
device mfp 496E974CCEDE86791CF9A8EF2E5145B6 set status EXPIRED
```

이 명령은 [Device Status (PUT)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_device_status_put.html?view=kc#Device-Status--PUT-) REST 서비스를 기반으로 합니다.

#### `device set appstatus` 명령
{: #the-device-set-appstatus-command }
`device set appstatus` 명령은 런타임에 애플리케이션과 관련하여 디바이스의 상태를 변경합니다.

구문: `device [runtime-name] id set appstatus app-name new-status`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| app-name | 앱의 이름입니다. |
| new-status | 새 상태입니다. |

상태의 값은 다음 중 하나입니다.

* ENABLED
* DISABLED


**예제**

```xml
device mfp 496E974CCEDE86791CF9A8EF2E5145B6 set appstatus MyApp DISABLED
```

이 명령은 [Device Application Status (PUT)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_device_application_status_put.html?view=kc#Device-Application-Status--PUT-) REST 서비스를 기반으로 합니다.

### 문제점 해결에 대한 명령
{: #commands-for-troubleshooting }
**mfpadm** 프로그램을 호출할 때 문제점 해결에 대한 여러 명령을 포함할 수 있습니다.

#### `show info` 명령
{: #the-show-info-command }
`show info` 명령은 런타임 또는 데이터베이스에 액세스하지 않고 리턴할 수 있는 {{ site.data.keys.product_adj }} 관리 서비스에 대한 기본 정보를 표시합니다. 이 명령을 사용하여 {{ site.data.keys.product_adj }} 관리 서비스가 실행 중인지 여부를 테스트할 수 있습니다.

구문: `show info`

여기서는 오브젝트 뒤에 다음 옵션을 사용합니다.

| 옵션 | 설명 |
|--------|-------------|
| --xml | 표 형식 출력 대신 XML 출력을 생성합니다. |

**예제**

```bash
show info
```

#### `show versions` 명령
{: #the-show-versions-command }
`show versions` 명령은 여러 컴포넌트의 {{ site.data.keys.product_adj }} 버전을 표시합니다.

* **mfpadmVersion**: **mfp-ant-deployer.jar**를 가져온 정확한 {{ site.data.keys.mf_server }} 버전 번호입니다.
* **productVersion**: **mfp-admin-service.war**를 가져온 정확한 {{ site.data.keys.mf_server }} 버전 번호입니다.
* **mfpAdminVersion**: **mfp-admin-service.war**의 정확한 빌드 버전 번호입니다.

구문: `show versions`

여기서는 오브젝트 뒤에 다음 옵션을 사용합니다.

| 옵션 | 설명 |
|--------|-------------|
| --xml | 표 형식 출력 대신 XML 출력을 생성합니다. |

**예제**

```bash
show versions
```

#### `show diagnostics` 명령
{: #the-show-diagnostics-command }
`show diagnostics` 명령은 {{ site.data.keys.product_adj }} 관리 서비스의 올바른 조작에 필요한 여러 컴포넌트의 상태를 표시합니다(예: 데이터베이스와 보조 서비스의 사용 가능성).

구문: `show diagnostics`

여기서는 오브젝트 뒤에 다음 옵션을 사용합니다.

| 옵션 | 설명 |
|--------|-------------|
| --xml | 표 형식 출력 대신 XML 출력을 생성합니다. |

**예제**

```bash
show diagnostics
```

#### `unlock` 명령
{: #the-unlock-command }
`unlock` 명령은 일반 용도의 잠금을 해제합니다. 일부 안전하지 않은 조작에서는 동일한 구성 데이터가 동시에 수정되지 않도록 하기 위해 이 잠금을 사용합니다. 드물게 해당 조작이 인터럽트되는 경우 안전하지 않은 조작을 더 이상 수행할 수 없도록 잠금이 잠금 상태로 유지됩니다. 이런 경우 unlock 명령을 사용하여 잠금을 해제하십시오.

**예제**

```bash
unlock
```

#### `list runtimes` 명령
{: #the-list-runtimes-command }
`list runtimes` 명령은 배치된 런타임의 목록을 리턴합니다.

구문: `list runtimes [--in-database]`

여기서는 다음 옵션을 사용합니다.

| 옵션 | 설명 |
|--------|-------------|
| --in-database	| MBean을 사용하는 대신 데이터베이스에서 찾을 것인지 여부 |
| --xml | 표 형식 출력 대신 XML 출력을 생성합니다. |

**예제**

```bash
list runtimes
```

```bash
list runtimes --in-database
```

이 명령은 [Runtime (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_runtimes_get.html?view=kc#Runtimes--GET-) REST 서비스를 기반으로 합니다.

#### `show runtime` 명령
{: #the-show-runtime-command }
`show runtime` 명령은 주어진 배치된 런타임에 대한 정보를 표시합니다.

구문: `show runtime [runtime-name]`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |

`show runtime` 명령에서는 오브젝트 뒤에 다음 옵션을 사용합니다.

| 옵션 | 설명 |
|--------|-------------|
| --xml | 표 형식 출력 대신 XML 출력을 생성합니다. |

이 명령은 [Runtime (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_runtime_get.html?view=kc#Runtime--GET-) REST 서비스를 기반으로 합니다.

**예제**

```bash
show runtime mfp
```

#### `delete runtime` 명령
{: #the-delete-runtime-command }
`delete runtime` 명령은 데이터베이스에서 해당 앱과 어댑터를 비롯한 런타임을 삭제합니다. 해당 웹 애플리케이션이 중지된 경우에만 런타임을 삭제할 수 있습니다.

구문: `delete runtime [runtime-name] condition`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| condition | 삭제 조건입니다(비어 있음 또는 항상). **주의:** 항상 옵션은 위험합니다. |

**예제**

```bash
delete runtime mfp empty
```

이 명령은 [Runtime (DELETE)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_runtime_delete.html?view=kc#Runtime--DELETE-) REST 서비스를 기반으로 합니다.

#### `list farm-members` 명령
{: #the-list-farm-members-command }
`list farm-members` 명령은 주어진 런타임이 배치되는 팜 멤버 서버의 목록을 리턴합니다.

구문: `list farm-members [runtime-name]`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |

`list farm-members` 명령에서는 오브젝트 뒤에 다음 옵션을 사용합니다.

| 옵션 | 설명 |
|--------|-------------|
| --xml | 표 형식 출력 대신 XML 출력을 생성합니다. |

**예제**

```bash
list farm-members mfp
```

이 명령은 [Farm topology members (GET)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_farm_topology_members_get.html?view=kc#Farm-topology-members--GET-) REST 서비스를 기반으로 합니다.

#### `remove farm-member` 명령
{: #the-remove-farm-member-command }
`remove farm-member` 명령은 지정된 런타임이 배치된 팜 멤버의 목록에서 서버를 제거합니다. 서버를 사용할 수 없거나 연결이 끊어진 경우 이 명령을 사용하십시오.

구문: `remove farm-member [runtime-name] server-id`

여기서는 다음 인수를 사용합니다.

| 인수 | 설명 |
|----------|-------------|
| runtime-name | 런타임의 이름입니다. |
| server-id | 서버의 ID입니다. |

`remove farm-member` 명령에서는 오브젝트 뒤에 다음 옵션을 사용합니다.

| 옵션 | 설명 |
|--------|-------------|
| --force | 사용 가능하거나 연결되어 있는 경우에도 팜 멤버의 제거를 강제 실행합니다. |

**예제**

```bash
remove farm-member mfp srvlx15
```

이 명령은 [Farm topology members (DELETE)](http://www.ibm.com/support/knowledgecenter/en/SSHS8R_8.0.0/com.ibm.worklight.apiref.doc/apiref/r_restapi_farm_topology_members_delete.html?view=kc) REST 서비스를 기반으로 합니다.
