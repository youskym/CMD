@echo off
echo システムの自動ロックを外します。普段使いのPCには絶対に使用しないでください。
echo 意図せず開いた場合はキーボードの操作を行わずにウィンドウを閉じて退出して下さい。
pause
echo 通常利用するPCで使用しないようにしてください。
pause
echo 設定完了後に強制的に再起動が発生します。
pause
echo 何かキーを押すと設定を開始します。
pause

rem ディスプレイの電源を切る
powercfg -x monitor-timeout-ac 0
powercfg -x monitor-timeout-dc 15

rem コンピュータをスリープ状態にする
powercfg -x standby-timeout-ac 0
powercfg -x standby-timeout-dc 30

rem 電源ボタンを押したときの動作(シャットダウン)
powercfg -setacvalueindex scheme_balanced sub_buttons pbuttonaction 3
powercfg -setdcvalueindex scheme_balanced sub_buttons pbuttonaction 3

rem カバーを閉じた時の動作(何もしない)
powercfg -setacvalueindex scheme_balanced sub_buttons lidaction 0
powercfg -setdcvalueindex scheme_balanced sub_buttons lidaction 0

rem 時間経過でロックしない
powercfg -setdcvalueindex scheme_balanced sub_none consolelock 0
powercfg -setacvalueindex scheme_balanced sub_none consolelock 0

rem スクリーンセーバーによるロックを止めます。
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveActive" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveTimeOut" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaverIsSecure" /t REG_SZ /d "0" /f

rem 高速スタートアップをOFFにする。
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f

rem 隠しファイルとドライブ表示、拡張子表示、プロセス分割、エクスプローラの表示デフォルトはPC。
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideDrivesWithNoMedia" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f

rem タスクバーの結合をしない
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d "2" /f
rem タスクビュー ボタンの非表示
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "0" /f
rem Cortanaボタンの非表示
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f
rem Peopleの非表示
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /t REG_DWORD /d "1" /f
rem 検索枠の非表示
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
rem Windows Ink ワークスペースの非表示
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /v "PenWorkspaceButtonDesiredVisibility" /t REG_DWORD /d "0" /f
rem 未インストールのユニバーサルWindowsプラットフォーム向けクラウドコンテンツを無効化する
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f
rem タスクバーのウィンドウプレビューを抑止する
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisablePreviewDesktop" /t "REG_DWORD" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ExtendedUIHoverTime" /t REG_DWORD /d "0x0FFFFFFF" /f


rem シフトキーを押しながら右クリックしたときに「コマンドウィンドウをここで開く」を有効にする。
reg add "HKCU\Software\Classes\Directory\Background\shell\cmd" /v "HideBasedOnVelocityId" /t REG_DWORD /d "0x0" /f
reg add "HKCU\Software\Classes\Directory\Background\shell\cmd" /v "ShowBasedOnVelocityId" /t REG_DWORD /d "0x639bc8" /f
reg add "HKCU\Software\Classes\Drive\shell\cmd" /v "HideBasedOnVelocityId" /t REG_DWORD /d "0x0" /f
reg add "HKCU\Software\Classes\Drive\shell\cmd" /v "ShowBasedOnVelocityId" /t REG_DWORD /d "0x639bc8" /f

rem シフトキーを押しながら右クリックしたときに「PowerShellウィンドウをここに開く」を隠す。
reg add "HKCU\Software\Classes\Directory\Background\shell\Powershell" /v "HideBasedOnVelocityId" /t REG_DWORD /d "0x639bc8" /f
reg add "HKCU\Software\Classes\Directory\Background\shell\Powershell" /v "ShowBasedOnVelocityId" /t REG_DWORD /d "0x0" /f
reg add "HKCU\Software\Classes\Drive\shell\Powershell" /v "HideBasedOnVelocityId" /t REG_DWORD /d "0x639bc8" /f
reg add "HKCU\Software\Classes\Drive\shell\Powershell" /v "ShowBasedOnVelocityId" /t REG_DWORD /d "0x0" /f

rem テキストエディタをサクラエディタに変更する。
ftype txtfile="C:\PortableApps\sakura\sakura.exe %%1"
rem .txt
reg add "HKCR\SystemFileAssociations\text\shell\edit\command" /ve /t REG_SZ /d "C:\PortableApps\sakura\sakura.exe %%1" /f
rem .js
reg add "HKCR\JSFile\Shell\Edit\Command" /ve /t REG_SZ /d "C:\PortableApps\sakura\sakura.exe %%1" /f
rem .bat
reg add "HKCR\batfile\shell\edit\command" /ve /t REG_SZ /d "C:\PortableApps\sakura\sakura.exe %%1" /f
rem .reg
reg add "HKCR\regfile\shell\edit\command" /ve /t REG_SZ /d "C:\PortableApps\sakura\sakura.exe %%1" /f



rem 壁紙を適当に変更
echo F | xcopy /E /V %~dp0wallpaper.jpg %USERPROFILE%\Pictures\wallpaper\wallpaper.jpg
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "Wallpaper" /t REG_SZ /d %USERPROFILE%\Pictures\wallpaper\wallpaper.jpg /f

echo ドライバのダウンロード
bitsadmin /transfer NFCdriverDL http://www.sony.co.jp/Products/felica/consumer/download/driver/PaSoRiDriver/NFCPortWithDriver.exe %USERPROFILE%\Downloads\NFCPortWithDriver.exe

echo インストーラの操作をお願いします。
call %USERPROFILE%\Downloads\NFCPortWithDriver.exe

echo 再起動します。
pause

shutdown /r /t 0
