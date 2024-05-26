@echo off
echo "ClassIsland 修复工具 (适用于 Windows 7 版本)"
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul
if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto UACAdmin)
:UACPrompt
echo "正在请求管理员权限..."
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
exit /B
:UACAdmin
setx "DOTNET_GCName" "clrgc.dll" /m
setx "DOTNET_EnableWriteXorExecute" "0" /m
echo "修复完成！"
echo "按任意键退出..."
pause >nul
exit
