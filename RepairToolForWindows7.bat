@echo off
echo "ClassIsland �޸����� (������ Windows 7 �汾)"
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul
if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto UACAdmin)
:UACPrompt
echo "�����������ԱȨ��..."
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
exit /B
:UACAdmin
setx "DOTNET_GCName" "clrgc.dll" /m
setx "DOTNET_EnableWriteXorExecute" "0" /m
echo "�޸���ɣ�"
echo "��������˳�..."
pause >nul
exit
