@echo off
cd /d %~dp0
set pwdPath=%~dp0

echo (1.若想替换图片，只需更换当前目录下的cheerPhoto.jpg文件并重启任务即可)
echo (2.图片文件名要一致噢!)
echo (3.记得右键以管理员身份运行本文件噢!!)

set /p var="输入数字(1:启动鼓励任务 2:终止鼓励任务 3:设置任务间隔): "
if %var% == 1 (
copy /Y %pwdPath%cheerPhoto.jpg C:\cheerPhoto.jpg
echo start C:\cheerPhoto.jpg > C:\cheer.bat
chcp 437
SCHTASKS /Delete /TN "cheerMission" /F
SCHTASKS /Create /tn "cheerMission" /tr "C:\cheer.bat" /sc MINUTE /mo 1 

chcp 936

echo "启动鼓励任务，默认1分钟"
pause
exit
) 
 
if %var% == 2 (

chcp 437
SCHTASKS /Delete /TN "cheerMission" /F
chcp 936
echo "终止鼓励任务"
pause
exit
) 
 

if %var% GTR 3 (
echo "命令错误"
pause
exit
) 

set /p duration=请输入时长分钟
copy /Y %pwdPath%cheerPhoto.jpg C:\cheerPhoto.jpg
echo start C:\cheerPhoto.jpg > C:\cheer.bat
chcp 437
SCHTASKS /Delete /TN "cheerMission" /F
SCHTASKS /Create /tn "cheerMission" /tr "C:\cheer.bat" /sc MINUTE /mo %duration%
chcp 936

echo "设置时长%duration%分钟完毕,已尝试重启任务"

pause
echo "bye~"
