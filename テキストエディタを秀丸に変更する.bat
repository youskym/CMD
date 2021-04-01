
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
　@powershell start-process "%~0" -verb runas
　echo 管理者権限がありません。管理者権限で実行します
　exit
)
REM ここから下、exitまでを管理者として実行

echo テキストエディタを秀丸にします。
pause
echo 本当にやって良い？
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

rem 以下はOfficeの動作に異常を来す可能性あり。
rem .rels,.xml XML Document
rem reg add "HKCR\xmlfile\shell\edit\Command" /ve /t REG_EXPAND_SZ /d "\"^%%ProgramFiles^%%\Hidemaru\Hidemaru.exe\" \"^%%1\"" /f
