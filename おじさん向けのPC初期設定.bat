@echo off
echo �V�X�e���̎������b�N���O���܂��B���i�g����PC�ɂ͐�΂Ɏg�p���Ȃ��ł��������B
echo �Ӑ}�����J�����ꍇ�̓L�[�{�[�h�̑�����s�킸�ɃE�B���h�E����đޏo���ĉ������B
pause
echo �ʏ험�p����PC�Ŏg�p���Ȃ��悤�ɂ��Ă��������B
pause
echo �ݒ芮����ɋ����I�ɍċN�����������܂��B
pause
echo �����L�[�������Ɛݒ���J�n���܂��B
pause

rem �f�B�X�v���C�̓d����؂�
powercfg -x monitor-timeout-ac 0
powercfg -x monitor-timeout-dc 15

rem �R���s���[�^���X���[�v��Ԃɂ���
powercfg -x standby-timeout-ac 0
powercfg -x standby-timeout-dc 30

rem �d���{�^�����������Ƃ��̓���(�V���b�g�_�E��)
powercfg -setacvalueindex scheme_balanced sub_buttons pbuttonaction 3
powercfg -setdcvalueindex scheme_balanced sub_buttons pbuttonaction 3

rem �J�o�[��������̓���(�������Ȃ�)
powercfg -setacvalueindex scheme_balanced sub_buttons lidaction 0
powercfg -setdcvalueindex scheme_balanced sub_buttons lidaction 0

rem ���Ԍo�߂Ń��b�N���Ȃ�
powercfg -setdcvalueindex scheme_balanced sub_none consolelock 0
powercfg -setacvalueindex scheme_balanced sub_none consolelock 0

rem �X�N���[���Z�[�o�[�ɂ�郍�b�N���~�߂܂��B
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveActive" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveTimeOut" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaverIsSecure" /t REG_SZ /d "0" /f

rem �����X�^�[�g�A�b�v��OFF�ɂ���B
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f

rem �B���t�@�C���ƃh���C�u�\���A�g���q�\���A�v���Z�X�����A�G�N�X�v���[���̕\���f�t�H���g��PC�B
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideDrivesWithNoMedia" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f

rem �^�X�N�o�[�̌��������Ȃ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d "2" /f
rem �^�X�N�r���[ �{�^���̔�\��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "0" /f
rem Cortana�{�^���̔�\��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f
rem People�̔�\��
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /t REG_DWORD /d "1" /f
rem �����g�̔�\��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
rem Windows Ink ���[�N�X�y�[�X�̔�\��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /v "PenWorkspaceButtonDesiredVisibility" /t REG_DWORD /d "0" /f
rem ���C���X�g�[���̃��j�o�[�T��Windows�v���b�g�t�H�[�������N���E�h�R���e���c�𖳌�������
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f
rem �^�X�N�o�[�̃E�B���h�E�v���r���[��}�~����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisablePreviewDesktop" /t "REG_DWORD" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ExtendedUIHoverTime" /t REG_DWORD /d "0x0FFFFFFF" /f


rem �V�t�g�L�[�������Ȃ���E�N���b�N�����Ƃ��Ɂu�R�}���h�E�B���h�E�������ŊJ���v��L���ɂ���B
reg add "HKCU\Software\Classes\Directory\Background\shell\cmd" /v "HideBasedOnVelocityId" /t REG_DWORD /d "0x0" /f
reg add "HKCU\Software\Classes\Directory\Background\shell\cmd" /v "ShowBasedOnVelocityId" /t REG_DWORD /d "0x639bc8" /f
reg add "HKCU\Software\Classes\Drive\shell\cmd" /v "HideBasedOnVelocityId" /t REG_DWORD /d "0x0" /f
reg add "HKCU\Software\Classes\Drive\shell\cmd" /v "ShowBasedOnVelocityId" /t REG_DWORD /d "0x639bc8" /f

rem �V�t�g�L�[�������Ȃ���E�N���b�N�����Ƃ��ɁuPowerShell�E�B���h�E�������ɊJ���v���B���B
reg add "HKCU\Software\Classes\Directory\Background\shell\Powershell" /v "HideBasedOnVelocityId" /t REG_DWORD /d "0x639bc8" /f
reg add "HKCU\Software\Classes\Directory\Background\shell\Powershell" /v "ShowBasedOnVelocityId" /t REG_DWORD /d "0x0" /f
reg add "HKCU\Software\Classes\Drive\shell\Powershell" /v "HideBasedOnVelocityId" /t REG_DWORD /d "0x639bc8" /f
reg add "HKCU\Software\Classes\Drive\shell\Powershell" /v "ShowBasedOnVelocityId" /t REG_DWORD /d "0x0" /f

rem �e�L�X�g�G�f�B�^���T�N���G�f�B�^�ɕύX����B
ftype txtfile="C:\PortableApps\sakura\sakura.exe %%1"
rem .txt
reg add "HKCR\SystemFileAssociations\text\shell\edit\command" /ve /t REG_SZ /d "C:\PortableApps\sakura\sakura.exe %%1" /f
rem .js
reg add "HKCR\JSFile\Shell\Edit\Command" /ve /t REG_SZ /d "C:\PortableApps\sakura\sakura.exe %%1" /f
rem .bat
reg add "HKCR\batfile\shell\edit\command" /ve /t REG_SZ /d "C:\PortableApps\sakura\sakura.exe %%1" /f
rem .reg
reg add "HKCR\regfile\shell\edit\command" /ve /t REG_SZ /d "C:\PortableApps\sakura\sakura.exe %%1" /f



rem �ǎ���K���ɕύX
echo F | xcopy /E /V %~dp0wallpaper.jpg %USERPROFILE%\Pictures\wallpaper\wallpaper.jpg
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "Wallpaper" /t REG_SZ /d %USERPROFILE%\Pictures\wallpaper\wallpaper.jpg /f

echo �h���C�o�̃_�E�����[�h
bitsadmin /transfer NFCdriverDL http://www.sony.co.jp/Products/felica/consumer/download/driver/PaSoRiDriver/NFCPortWithDriver.exe %USERPROFILE%\Downloads\NFCPortWithDriver.exe

echo �C���X�g�[���̑�������肢���܂��B
call %USERPROFILE%\Downloads\NFCPortWithDriver.exe

echo �ċN�����܂��B
pause

shutdown /r /t 0
