
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
�@@powershell start-process "%~0" -verb runas
�@echo �Ǘ��Ҍ���������܂���B�Ǘ��Ҍ����Ŏ��s���܂�
�@exit
)
REM �������牺�Aexit�܂ł��Ǘ��҂Ƃ��Ď��s

echo �e�L�X�g�G�f�B�^���G�ۂɂ��܂��B
pause
echo �{���ɂ���ėǂ��H
pause


rem .txt
ftype txtfile="%%ProgramFiles%%\Hidemaru\Hidemaru.exe" "%%1"
reg add "HKCR\SystemFileAssociations\text\shell\edit\command" /ve /t REG_EXPAND_SZ /d "\"^%%ProgramFiles^%%\Hidemaru\Hidemaru.exe\" \"^%%1\"" /f

rem .bat Windows Batch File
reg add "HKCR\batfile\shell\edit\command" /ve /t REG_EXPAND_SZ /d "\"^%%ProgramFiles^%%\Hidemaru\Hidemaru.exe\" \"^%%1\"" /f

rem .cmd Windows Command Script
reg add "HKCR\cmdfile\shell\edit\command" /ve /t REG_EXPAND_SZ /d "\"^%%ProgramFiles^%%\Hidemaru\Hidemaru.exe\" \"^%%1\"" /f

rem .JSE JScript Encoded File
reg add "HKCR\JSEFile\shell\edit\command" /ve /t REG_EXPAND_SZ /d "\"^%%ProgramFiles^%%\Hidemaru\Hidemaru.exe\" \"^%%1\"" /f

rem .js JavaScript File
reg add "HKCR\JSFile\shell\edit\command" /ve /t REG_EXPAND_SZ /d "\"^%%ProgramFiles^%%\Hidemaru\Hidemaru.exe\" \"^%%1\"" /f

rem .reg Registration Entries
reg add "HKCR\regFile\shell\edit\command" /ve /t REG_EXPAND_SZ /d "\"^%%ProgramFiles^%%\Hidemaru\Hidemaru.exe\" \"^%%1\"" /f

rem .VBE VBScript Encoded File
reg add "HKCR\VBEFile\shell\edit\command" /ve /t REG_EXPAND_SZ /d "\"^%%ProgramFiles^%%\Hidemaru\Hidemaru.exe\" \"^%%1\"" /f

rem .vbs VBScript Script File
reg add "HKCR\VBSFile\shell\edit\command" /ve /t REG_EXPAND_SZ /d "\"^%%ProgramFiles^%%\Hidemaru\Hidemaru.exe\" \"^%%1\"" /f

rem .xaml Windows Markup File
reg add "HKCR\Windows.XamlDocument\shell\edit\Command" /ve /t REG_EXPAND_SZ /d "\"^%%ProgramFiles^%%\Hidemaru\Hidemaru.exe\" \"^%%1\"" /f

rem .xbap XAML Browser Application
reg add "HKCR\Windows.Xbap\shell\edit\Command" /ve /t REG_EXPAND_SZ /d "\"^%%ProgramFiles^%%\Hidemaru\Hidemaru.exe\" \"^%%1\"" /f

rem .WSF Windows Script File
reg add "HKCR\WSFFile\shell\edit\command" /ve /t REG_EXPAND_SZ /d "\"^%%ProgramFiles^%%\Hidemaru\Hidemaru.exe\" \"^%%1\"" /f

pause

exit

rem �ȉ���Office�̓���Ɉُ�𗈂��\������B
rem .rels,.xml XML Document
rem reg add "HKCR\xmlfile\shell\edit\Command" /ve /t REG_EXPAND_SZ /d "\"^%%ProgramFiles^%%\Hidemaru\Hidemaru.exe\" \"^%%1\"" /f
