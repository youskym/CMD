@echo
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
�@@powershell start-process "%~0" -verb runas
�@echo �Ǘ��Ҍ���������܂���B�Ǘ��Ҍ����Ŏ��s���܂�
�@exit
)
REM �������牺�Aexit�܂ł��Ǘ��҂Ƃ��Ď��s

set devmgr_show_nonpresent_devices=1
start devmgmt.msc
exit
