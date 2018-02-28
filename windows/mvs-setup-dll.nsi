; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Metaverse"
!define PRODUCT_VERSION "0.7.4"
!define PRODUCT_PUBLISHER "Metaverse Foundation"
!define PRODUCT_WEB_SITE "https://mvs.org"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\mvstray.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; Set Source Path
!define BINARY_DIR "C:\compile\metaverse\builds\msvc-140\x64\Release"
!define HTMLS_DIR "E:\mvs-htmls"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
;!insertmacro MUI_PAGE_LICENSE "..\..\..\..\path\to\licence\YourSoftwareLicence.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
;!define MUI_FINISHPAGE_RUN "$INSTDIR\mvstray.exe"
;!define MUI_FINISHPAGE_RUN_PARAMETERS "--ui=true"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "SimpChinese"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "mvs-win64-v${PRODUCT_VERSION}.exe"
InstallDir "$PROGRAMFILES\Metaverse"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show
Icon "logo.ico"

Function CheckVC
   Push $R0
   ClearErrors
   ReadRegDword $R0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{FF66E9F6-83E7-3A3E-AF14-8DE9A809A6A4}" "Version"

   ; ��⺬��vc��ע�����Ϣ�Ƿ����
   IfErrors 0 VSRedistInstalled
   Exec "$INSTDIR\vcredist_x64.exe /q"   ;�������ڣ�ִ�о�Ĭ��װ
   StrCpy $R0 "-1"
   ; MessageBox MB_OK  $R0

VSRedistInstalled:
   ; MessageBox MB_OK  "�Ѱ�װ"
   Exch $R0
   Delete "$INSTDIR\vcredist_x64.exe."
FunctionEnd

Function un.onInit
!insertmacro MUI_UNGETLANGUAGE
  ;MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "��ȷʵҪ��ȫ�Ƴ� $(^Name) ���估���е������" IDYES +2
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are your sure to completely remove $(^Name) ��and all its modules��" IDYES +2
  Abort
FunctionEnd

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
  Call CheckVC
FunctionEnd

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "${BINARY_DIR}\mvstray.exe"
  CreateDirectory "$SMPROGRAMS\Metaverse"
  CreateShortCut "$DESKTOP\Metaverse Wallet.lnk" "$INSTDIR\mvstray.exe" "--ui=true"
  ;File "${BINARY_DIR}\mvstray.pdb"
  ;File "${BINARY_DIR}\mvs-cli.pdb"
  File "${BINARY_DIR}\mvs-cli.exe"
  ;File "${BINARY_DIR}\mvsd.pdb"
  File "${BINARY_DIR}\mvsd.exe"
  File "${BINARY_DIR}\vcredist_x64.exe"
; depend dll
  File "D:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\Remote Debugger\x64\api-ms-win-crt-runtime-l1-1-0.dll"
  File "D:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\Remote Debugger\x64\api-ms-win-crt-math-l1-1-0.dll"
  File "D:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\Remote Debugger\x64\api-ms-win-crt-stdio-l1-1-0.dll"
  File "D:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\Remote Debugger\x64\api-ms-win-crt-locale-l1-1-0.dll"
  File "D:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\Remote Debugger\x64\api-ms-win-crt-heap-l1-1-0.dll"
  File "D:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\Remote Debugger\x64\vcruntime140.dll"
  SetOutPath "$DESKTOP"
  ;File "D:\�ؿ���Ԫ��Ǯ����װ˵��.txt"
  SetOutPath "$INSTDIR\mvs-htmls\fonts"
  SetOverwrite try
  File "${HTMLS_DIR}\fonts\fontawesome-webfont.eot"
  File "${HTMLS_DIR}\fonts\fontawesome-webfont.svg"
  File "${HTMLS_DIR}\fonts\fontawesome-webfont.ttf"
  File "${HTMLS_DIR}\fonts\fontawesome-webfont.woff"
  File "${HTMLS_DIR}\fonts\fontawesome-webfont.woff2"
  File "${HTMLS_DIR}\fonts\FontAwesome.otf"
  File "${HTMLS_DIR}\fonts\glyphicons-halflings-regular.eot"
  File "${HTMLS_DIR}\fonts\glyphicons-halflings-regular.svg"
  File "${HTMLS_DIR}\fonts\glyphicons-halflings-regular.ttf"
  File "${HTMLS_DIR}\fonts\glyphicons-halflings-regular.woff"
  File "${HTMLS_DIR}\fonts\glyphicons-halflings-regular.woff2"
  SetOutPath "$INSTDIR\mvs-htmls\home\account"
  File "${HTMLS_DIR}\home\account\details.view.0.7.4.html"
  File "${HTMLS_DIR}\home\account\export.view.0.7.4.html"
  File "${HTMLS_DIR}\home\account\index.view.0.7.4.html"
  File "${HTMLS_DIR}\home\account\privatekey.view.0.7.4.html"
  ;File "${HTMLS_DIR}\home\account\subscribe.view.0.7.4.html"
  SetOutPath "$INSTDIR\mvs-htmls\home\addresses"
  File "${HTMLS_DIR}\home\addresses\createmultisignature.view.0.7.4.html"
  File "${HTMLS_DIR}\home\addresses\index.view.0.7.4.html"
  File "${HTMLS_DIR}\home\addresses\multisigaddresses.view.0.7.4.html"
  File "${HTMLS_DIR}\home\addresses\myaddresses.view.0.7.4.html"
  SetOutPath "$INSTDIR\mvs-htmls\home\assets"
  File "${HTMLS_DIR}\home\assets\all.view.0.7.4.html"
  File "${HTMLS_DIR}\home\assets\create.view.0.7.4.html"
  File "${HTMLS_DIR}\home\assets\details.view.0.7.4.html"
  File "${HTMLS_DIR}\home\assets\index.view.0.7.4.html"
  File "${HTMLS_DIR}\home\assets\myassets.view.0.7.4.html"
  SetOutPath "$INSTDIR\mvs-htmls\home"
  File "${HTMLS_DIR}\home\console.view.0.7.4.html"
  File "${HTMLS_DIR}\home\deposit.view.0.7.4.html"
  SetOutPath "$INSTDIR\mvs-htmls\home\explorer"
  File "${HTMLS_DIR}\home\explorer\address.view.0.7.4.html"
  File "${HTMLS_DIR}\home\explorer\block.view.0.7.4.html"
  File "${HTMLS_DIR}\home\explorer\index.view.0.7.4.html"
  File "${HTMLS_DIR}\home\explorer\noresult.view.0.7.4.html"
  File "${HTMLS_DIR}\home\explorer\search.view.0.7.4.html"
  File "${HTMLS_DIR}\home\explorer\transaction.view.0.7.4.html"
  SetOutPath "$INSTDIR\mvs-htmls\home"
  File "${HTMLS_DIR}\home\home.view.0.7.4.html"
  File "${HTMLS_DIR}\home\index.view.0.7.4.html"
  SetOutPath "$INSTDIR\mvs-htmls\home\transfer"
  ;File "${HTMLS_DIR}\home\transfer\createmultisignature.view.0.7.4.html"
  File "${HTMLS_DIR}\home\transfer\multisignature.view.0.7.4.html"
  File "${HTMLS_DIR}\home\transfer\sign.view.0.7.4.html"
  File "${HTMLS_DIR}\home\transfer\transferasset.view.0.7.4.html"
  File "${HTMLS_DIR}\home\transfer\transferetp.view.0.7.4.html"
  SetOutPath "$INSTDIR\mvs-htmls\images"
  File "${HTMLS_DIR}\images\add.png"
  File "${HTMLS_DIR}\images\add2.png"
  File "${HTMLS_DIR}\images\background_login.png"
  File "${HTMLS_DIR}\images\bg.png"
  File "${HTMLS_DIR}\images\checkbx.png"
  File "${HTMLS_DIR}\images\copy-address.png"
  File "${HTMLS_DIR}\images\de.png"
  File "${HTMLS_DIR}\images\en.png"
  File "${HTMLS_DIR}\images\favicon-old.png"
  File "${HTMLS_DIR}\images\favicon.jpg"
  File "${HTMLS_DIR}\images\icon-account-on.png"
  File "${HTMLS_DIR}\images\icon-account.png"
  File "${HTMLS_DIR}\images\icon-arrow-on.png"
  File "${HTMLS_DIR}\images\icon-arrow.png"
  File "${HTMLS_DIR}\images\icon-assets-on.png"
  File "${HTMLS_DIR}\images\icon-assets.png"
  File "${HTMLS_DIR}\images\icon-console-on.png"
  File "${HTMLS_DIR}\images\icon-console.png"
  File "${HTMLS_DIR}\images\icon-deposit.png"
  File "${HTMLS_DIR}\images\icon-explorer.png"
  File "${HTMLS_DIR}\images\icon-home-on.png"
  File "${HTMLS_DIR}\images\icon-home.png"
  File "${HTMLS_DIR}\images\icon-mining-on.png"
  File "${HTMLS_DIR}\images\icon-mining.png"
  File "${HTMLS_DIR}\images\icon-settings-on.png"
  File "${HTMLS_DIR}\images\icon-settings.png"
  File "${HTMLS_DIR}\images\icon-transfer-on.png"
  File "${HTMLS_DIR}\images\icon-transfer.png"
  File "${HTMLS_DIR}\images\icon-x.png"
  File "${HTMLS_DIR}\images\icon.png"
  File "${HTMLS_DIR}\images\icon_1.jpg"
  File "${HTMLS_DIR}\images\icon_1.jpg.png"
  File "${HTMLS_DIR}\images\icon_1.png"
  File "${HTMLS_DIR}\images\icon_2.png"
  File "${HTMLS_DIR}\images\icon_4.jpg"
  File "${HTMLS_DIR}\images\icon_4.jpg.png"
  File "${HTMLS_DIR}\images\icon_5.jpg"
  File "${HTMLS_DIR}\images\icon_5.jpg.png"
  File "${HTMLS_DIR}\images\install.png"
  File "${HTMLS_DIR}\images\ka_1.jpg"
  File "${HTMLS_DIR}\images\ka_2.jpg"
  File "${HTMLS_DIR}\images\ka_3.jpg"
  File "${HTMLS_DIR}\images\ka_4.jpg"
  File "${HTMLS_DIR}\images\ka_5.jpg"
  File "${HTMLS_DIR}\images\loading-spinner.png"
  File "${HTMLS_DIR}\images\logo-black.png"
  File "${HTMLS_DIR}\images\logo.png"
  File "${HTMLS_DIR}\images\l_1.jpg"
  File "${HTMLS_DIR}\images\metaverse_logo.png"
  File "${HTMLS_DIR}\images\metaverse_logo_old.jpg"
  File "${HTMLS_DIR}\images\own.png"
  File "${HTMLS_DIR}\images\qrcode.png"
  File "${HTMLS_DIR}\images\receive.png"
  File "${HTMLS_DIR}\images\receiveBig.png"
  File "${HTMLS_DIR}\images\right.png"
  File "${HTMLS_DIR}\images\send.png"
  File "${HTMLS_DIR}\images\sendBig.png"
  File "${HTMLS_DIR}\images\signal.png"
  File "${HTMLS_DIR}\images\spinner.gif"
  File "${HTMLS_DIR}\images\transfer.png"
  File "${HTMLS_DIR}\images\T_1.png"
  File "${HTMLS_DIR}\images\T_2.png"
  File "${HTMLS_DIR}\images\viewfin_logo.png"
  File "${HTMLS_DIR}\images\warning.png"
  File "${HTMLS_DIR}\images\zh.png"
  SetOutPath "$INSTDIR\mvs-htmls\audio"
  File "${HTMLS_DIR}\audio\message.mp3"
  SetOutPath "$INSTDIR\mvs-htmls\icon"
  File "${HTMLS_DIR}\icon\default.png"
  File "${HTMLS_DIR}\icon\ETP.png"
  File "${HTMLS_DIR}\icon\ETP-blue.png"
  File "${HTMLS_DIR}\icon\META.png"
  File "${HTMLS_DIR}\icon\MVS.HUG.png"
  File "${HTMLS_DIR}\icon\MVS.ZDC.png"
  File "${HTMLS_DIR}\icon\MVS.ZGC.png"
  File "${HTMLS_DIR}\icon\SDG.png"  
  SetOutPath "$INSTDIR\mvs-htmls"
  File "${HTMLS_DIR}\index.html"
  SetOutPath "$INSTDIR\mvs-htmls\lang"
  File "${HTMLS_DIR}\lang\de.0.7.4.json"
  File "${HTMLS_DIR}\lang\en.0.7.4.json"
  File "${HTMLS_DIR}\lang\zh.0.7.4.json"
  SetOutPath "$INSTDIR\mvs-htmls\login"
  File "${HTMLS_DIR}\login\login.view.0.7.4.html"
  SetOutPath "$INSTDIR\mvs-htmls\min"
  File "${HTMLS_DIR}\min\app.0.7.4.css"
  File "${HTMLS_DIR}\min\app.0.7.4.js"
  File "${HTMLS_DIR}\min\app.min.0.7.4.js"
  File "${HTMLS_DIR}\min\framework.min.0.7.4.js"
  File "${HTMLS_DIR}\min\libs.min.0.7.4.js"
  ;File "${HTMLS_DIR}\min\pingfang.eot"
  ;File "${HTMLS_DIR}\min\pingfang.svg"
  ;File "${HTMLS_DIR}\min\pingfang.ttf"
  ;File "${HTMLS_DIR}\min\pingfang.woff"
  SetOutPath "$INSTDIR\mvs-htmls\register"
  File "${HTMLS_DIR}\register\register.view.0.7.4.html"
  ExecWait "$INSTDIR\mvsd.exe -i"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\mvstray.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\mvstray.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

Function un.onUninstSuccess
  HideWindow
  ;MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) �ѳɹ��ش���ļ�����Ƴ���"
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) has been completely removed from your computer��"
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\mvs-htmls\register\register.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\min\libs.min.0.7.4.js"
  Delete "$INSTDIR\mvs-htmls\min\framework.min.0.7.4.js"
  Delete "$INSTDIR\mvs-htmls\min\app.min.0.7.4.js"
  Delete "$INSTDIR\mvs-htmls\min\app.0.7.4.js"
  Delete "$INSTDIR\mvs-htmls\min\app.0.7.4.css"
  Delete "$INSTDIR\mvs-htmls\login\login.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\lang\zh.0.7.4.json"
  Delete "$INSTDIR\mvs-htmls\lang\en.0.7.4.json"
  Delete "$INSTDIR\mvs-htmls\lang\de.0.7.4.json"
  Delete "$INSTDIR\mvs-htmls\index.html"
  Delete "$INSTDIR\mvs-htmls\images\warning.png"
  Delete "$INSTDIR\mvs-htmls\images\T_2.png"
  Delete "$INSTDIR\mvs-htmls\images\T_1.png"
  Delete "$INSTDIR\mvs-htmls\images\transfer.png"
  Delete "$INSTDIR\mvs-htmls\images\spinner.gif"
  Delete "$INSTDIR\mvs-htmls\images\signal.png"
  Delete "$INSTDIR\mvs-htmls\images\sendBig.png"
  Delete "$INSTDIR\mvs-htmls\images\send.png"
  Delete "$INSTDIR\mvs-htmls\images\right.png"
  Delete "$INSTDIR\mvs-htmls\images\receiveBig.png"
  Delete "$INSTDIR\mvs-htmls\images\receive.png"
  Delete "$INSTDIR\mvs-htmls\images\own.png"
  Delete "$INSTDIR\mvs-htmls\images\l_1.jpg"
  Delete "$INSTDIR\mvs-htmls\images\logo.png"
  Delete "$INSTDIR\mvs-htmls\images\logo-black.png"
  Delete "$INSTDIR\mvs-htmls\images\ka_5.jpg"
  Delete "$INSTDIR\mvs-htmls\images\ka_4.jpg"
  Delete "$INSTDIR\mvs-htmls\images\ka_3.jpg"
  Delete "$INSTDIR\mvs-htmls\images\ka_2.jpg"
  Delete "$INSTDIR\mvs-htmls\images\ka_1.jpg"
  Delete "$INSTDIR\mvs-htmls\images\install.png"
  Delete "$INSTDIR\mvs-htmls\images\icon_5.jpg.png"
  Delete "$INSTDIR\mvs-htmls\images\icon_5.jpg"
  Delete "$INSTDIR\mvs-htmls\images\icon_4.jpg.png"
  Delete "$INSTDIR\mvs-htmls\images\icon_4.jpg"
  Delete "$INSTDIR\mvs-htmls\images\icon_2.png"
  Delete "$INSTDIR\mvs-htmls\images\icon_1.png"
  Delete "$INSTDIR\mvs-htmls\images\icon_1.jpg.png"
  Delete "$INSTDIR\mvs-htmls\images\icon_1.jpg"
  Delete "$INSTDIR\mvs-htmls\images\icon.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-x.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-transfer.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-transfer-on.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-settings.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-settings-on.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-mining.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-mining-on.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-home.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-home-on.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-explorer.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-deposit.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-console.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-console-on.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-assets.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-assets-on.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-arrow.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-arrow-on.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-account.png"
  Delete "$INSTDIR\mvs-htmls\images\icon-account-on.png"
  Delete "$INSTDIR\mvs-htmls\images\bg.png"
  Delete "$INSTDIR\mvs-htmls\images\add2.png"
  Delete "$INSTDIR\mvs-htmls\images\add.png"
  Delete "$INSTDIR\mvs-htmls\home\transfer.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\mining.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\index.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\explorer\transaction.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\explorer\search.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\explorer\index.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\deposit.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\console.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\assets.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\assets\transfer.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\assets\index.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\assets\details.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\assets\create.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\assets\all.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\account\index.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\account\details.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\home\account\addresses.view.0.7.4.html"
  Delete "$INSTDIR\mvs-htmls\fonts\glyphicons-halflings-regular.woff2"
  Delete "$INSTDIR\mvs-htmls\fonts\glyphicons-halflings-regular.woff"
  Delete "$INSTDIR\mvs-htmls\fonts\glyphicons-halflings-regular.ttf"
  Delete "$INSTDIR\mvs-htmls\fonts\glyphicons-halflings-regular.svg"
  Delete "$INSTDIR\mvs-htmls\fonts\glyphicons-halflings-regular.eot"
  Delete "$INSTDIR\mvs-htmls\fonts\FontAwesome.otf"
  Delete "$INSTDIR\mvs-htmls\fonts\fontawesome-webfont.woff2"
  Delete "$INSTDIR\mvs-htmls\fonts\fontawesome-webfont.woff"
  Delete "$INSTDIR\mvs-htmls\fonts\fontawesome-webfont.ttf"
  Delete "$INSTDIR\mvs-htmls\fonts\fontawesome-webfont.svg"
  Delete "$INSTDIR\mvs-htmls\fonts\fontawesome-webfont.eot"
  Delete "$INSTDIR\mvs-htmls\audio\message.mp3"
  Delete "$INSTDIR\mvs-htmls\icon\default.png"
  Delete "$INSTDIR\mvs-htmls\icon\ETP.png"
  Delete "$INSTDIR\mvs-htmls\icon\ETP-blue.png"
  Delete "$INSTDIR\mvs-htmls\icon\META.png"
  Delete "$INSTDIR\mvs-htmls\icon\MVS.HUG.png"
  Delete "$INSTDIR\mvs-htmls\icon\MVS.ZDC.png"
  Delete "$INSTDIR\mvs-htmls\icon\MVS.ZGC.png"
  Delete "$INSTDIR\mvs-htmls\icon\SDG.png"  
  Delete "$INSTDIR\mvsd.exe"
  ;Delete "$INSTDIR\mvsd.pdb"
  Delete "$INSTDIR\mvs-cli.exe"
  ;Delete "$INSTDIR\mvs-cli.pdb"
  ;Delete "$INSTDIR\mvstray.pdb"
  Delete "$INSTDIR\mvstray.exe"

  ;Delete "$SMPROGRAMS\Metaverse\mvstray.lnk"
  ;Delete "$DESKTOP\mvsd.lnk"
  Delete "$DESKTOP\Metaverse Wallet.lnk"

  RMDir "$SMPROGRAMS\My application"
  RMDir "$INSTDIR\mvs-htmls\register"
  RMDir "$INSTDIR\mvs-htmls\min"
  RMDir "$INSTDIR\mvs-htmls\login"
  RMDir "$INSTDIR\mvs-htmls\lang"
  RMDir "$INSTDIR\mvs-htmls\images"
  RMDir "$INSTDIR\mvs-htmls\home\transfer"
  RMDir "$INSTDIR\mvs-htmls\home\explorer"
  RMDir "$INSTDIR\mvs-htmls\home\assets"
  RMDir "$INSTDIR\mvs-htmls\home\addresses"
  RMDir "$INSTDIR\mvs-htmls\home\account"
  RMDir "$INSTDIR\mvs-htmls\home"
  RMDir "$INSTDIR\mvs-htmls\fonts"
  RMDir "$INSTDIR\mvs-htmls"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd