@echo off
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
　echo 管理者権限がありません。管理者権限で実行します
　@powershell start-process \"%~0\" -verb runas
　exit
)
REM ここから下、exitまでを管理者として実行

set devmgr_show_nonpresent_devices=1
start devmgmt.msc
exit
