@echo off
cd /d %~dp0
set pwdPath=%~dp0

echo (1.�����滻ͼƬ��ֻ�������ǰĿ¼�µ�cheerPhoto.jpg�ļ����������񼴿�)
echo (2.ͼƬ�ļ���Ҫһ����!)
echo (3.�ǵ��Ҽ��Թ���Ա������б��ļ���!!)

set /p var="��������(1:������������ 2:��ֹ�������� 3:����������): "
if %var% == 1 (
copy /Y %pwdPath%cheerPhoto.jpg C:\cheerPhoto.jpg
echo start mspaint C:\cheerPhoto.jpg > C:\cheer.bat
chcp 437
SCHTASKS /Delete /TN "cheerMission" /F
SCHTASKS /Create /tn "cheerMission" /tr "C:\cheer.bat" /sc MINUTE /mo 1 

chcp 936

echo "������������Ĭ��1����"
pause
exit
) 
 
if %var% == 2 (

chcp 437
SCHTASKS /Delete /TN "cheerMission" /F
chcp 936
echo "��ֹ��������"
pause
exit
) 
 

if %var% GTR 3 (
echo "�������"
pause
exit
) 

set /p duration=������ʱ������
copy /Y %pwdPath%cheerPhoto.jpg C:\cheerPhoto.jpg
echo start mspaint C:\cheerPhoto.jpg > C:\cheer.bat
chcp 437
SCHTASKS /Delete /TN "cheerMission" /F
SCHTASKS /Create /tn "cheerMission" /tr "C:\cheer.bat" /sc MINUTE /mo %duration%
chcp 936

echo "����ʱ��%duration%�������,�ѳ�����������"

pause
echo "bye~"