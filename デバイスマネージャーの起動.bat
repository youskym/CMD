@echo
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
　@powershell start-process "%~0" -verb runas
　echo 管理者権限がありません。管理者権限で実行します
　exit
)
REM ここから下、exitまでを管理者として実行

set devmgr_show_nonpresent_devices=1
start devmgmt.msc
exit
