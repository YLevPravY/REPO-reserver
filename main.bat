echo OFF
chcp 1251
color 06
title ����������
cls
echo �������� ������� ����������� � ���������...
ping -n 2 google.com >nul
if %errorlevel% NEQ 0 (
echo ��� ����������� � ���������!
timeout /t 2 /nobreak >nul
exit )
echo ����������� �����������.
echo �������� ����� ��������������...
net session >nul 2>&1
if %errorlevel% NEQ 0 (
echo ��� ���� ��������������!
timeout /t 2 /nobreak >nul
exit )
echo ����� �������������� ��������.
timeout /t 1 /nobreak >nul
mkdir %temp%\lp\repoauto\
mkdir %userprofile%\lp\repoauto
set tempfolder=%temp%\lp\repoauto
set reservefolder=%userprofile%\lp\repoauto\reserves
set repofolder=%userprofile%\AppData\LocalLow\semiwork\Repo\saves
:menu
cls
echo ������:
echo 1. ��������� �������� �����
echo 2. ������������ ��������� �����
echo 3. ������� ��������� �����
echo 4. ����� �� ���������
set /p ch1=������� ����� ��������: 
if %ch1% == 1 (
goto 1 )
if %ch1% == 2 (
goto 2 )
if %ch1% == 3 (
goto 3 )
if %ch1% == 4 (
rd /s /q %tempfolder%
exit )
if %ch1% == rickroll (
goto rickroll )
else (
goto menu )
:1
del /f /q %tempfolder%\*.txt
cls
for /f %%a in ('dir /b /ad %repofolder%^|find /c /v "" ') do set count=%%a
if %count% == 0 (
echo �� ���������� ���������� R.E.P.O.
timeout /t 3 /nobreak >nul
goto menu )
dir /b /ad %repofolder%>>%tempfolder%\allsavenames.txt
mkdir %tempfolder%\copy
copy /y %tempfolder%\allsavenames.txt %tempfolder%\copy >nul
ren %tempfolder%\copy\allsavenames.txt allsavenamescopy.txt
move /y %tempfolder%\copy\allsavenamescopy.txt %tempfolder% >nul
rd %tempfolder%\copy
set /a x=1
echo ������ ���� ����������, ������� ������ ���������:
:cycle
set /a count1=%count%+1
if %x% NEQ %count1% (
goto cycle1 )
if %x% == %count1% (
goto endcycle )
:cycle1
set /p savename=<%tempfolder%\allsavenamescopy.txt
more +1 < %tempfolder%\allsavenamescopy.txt > %tempfolder%\allsavenamescopy1.txt
del /f /q %tempfolder%\allsavenamescopy.txt
ren %tempfolder%\allsavenamescopy1.txt allsavenamescopy.txt
set saveyear=%savename:~10,4%
set savemonth=%savename:~15,2%
set saveday=%savename:~18,2%
set savehour=%savename:~21,2%
set saveminutes=%savename:~24,2%
echo SAVEFILE_%x% %saveday%.%savemonth%.%saveyear% %savehour%:%saveminutes%
echo %savename%>>%tempfolder%\savename%x%.txt
set savename=
set saveyear=
set savemonth=
set saveday=
set savehour=
set saveminutes=
set /a x+=1
goto cycle
:endcycle
del /f /q %tempfolder%\allsavenamescopy.txt
echo %x%. ����� � ����
set /p ch2=����� ����� ��������: 
if %ch2% == %x% (
del /f /q %tempfolder%\*.txt
goto menu )
set /p chsave=<%tempfolder%\savename%ch2%.txt
if not exist %tempfolder%\savename%ch2%.txt (
goto ncsave1 )
if exist %tempfolder%\savename%ch2%.txt (
goto reserve )
:ncsave1
cls
echo ������ ������������ ����� ����������.
del /f /q %tempfolder%\*.txt
timeout /t 3 /nobreak >nul
goto 1
:reserve
if exist %reservefolder%\%chsave% (
goto ch31)
if not exist %reservefolder%\%chsave% (
goto reserve1 )
:ch31
cls
echo ��������� ����� ����� ���������� ��� ����������. ������ ������������ ��? (������ ����� ����� �������)
echo 1. ��
echo 2. ���
set /p ch3=������� ����� ��������: 
if %ch3% == 1 (
goto ch311 )
if %ch3% == 2 (
goto 1 )
else (
goto ch31 )
:ch311
rd /s /q %reservefolder%\%chsave%
goto reserve1
:reserve1
cls
echo ������ ��������� �����...
mkdir %reservefolder%\%chsave% >nul
xcopy /q /y /e %repofolder%\%chsave%\*.* %reservefolder%\%chsave% >nul
if ERRORLEVEL 0 (
echo �������!
del /f /q %tempfolder%\*.txt
timeout /t 3 /nobreak >nul
goto menu )
else (
echo ��������� ����������� ������! ������ ���.
rd /s /q %reservefolder%\%chsave%
del /f /q %tempfolder%\*.txt
timeout /t 3 /nobreak >nul
goto menu )
:2
del /f /q %tempfolder%\*.txt
cls
for /f %%a in ('dir /b /ad %reservefolder%^|find /c /v "" ') do set count=%%a
if %count% == 0 (
echo �� ���������� ��������� ����� R.E.P.O.
timeout /t 3 /nobreak >nul
goto menu )
dir /b /ad %reservefolder%>>%tempfolder%\allsavenames.txt
mkdir %tempfolder%\copy
copy /y %tempfolder%\allsavenames.txt %tempfolder%\copy >nul
ren %tempfolder%\copy\allsavenames.txt allsavenamescopy.txt
move /y %tempfolder%\copy\allsavenamescopy.txt %tempfolder% >nul
rd %tempfolder%\copy
set /a x=1
echo ������ ���� �����, ������� ������ ������������:
:cycle2
set /a count1=%count%+1
if %x% NEQ %count1% (
goto cycle12 )
if %x% == %count1% (
goto endcycle2 )
:cycle12
set /p savename=<%tempfolder%\allsavenamescopy.txt
more +1 < %tempfolder%\allsavenamescopy.txt > %tempfolder%\allsavenamescopy1.txt
del /f /q %tempfolder%\allsavenamescopy.txt
ren %tempfolder%\allsavenamescopy1.txt allsavenamescopy.txt
set saveyear=%savename:~10,4%
set savemonth=%savename:~15,2%
set saveday=%savename:~18,2%
set savehour=%savename:~21,2%
set saveminutes=%savename:~24,2%
echo SAVEFILE_%x% %saveday%.%savemonth%.%saveyear% %savehour%:%saveminutes%
echo %savename%>>%tempfolder%\savename%x%.txt
set savename=
set saveyear=
set savemonth=
set saveday=
set savehour=
set saveminutes=
set /a x+=1
goto cycle2
:endcycle2
del /f /q %tempfolder%\allsavenamescopy.txt
echo %x%. ����� � ����
set /p ch2=����� ����� ��������: 
if %ch2% == %x% (
del /f /q %tempfolder%\*.txt
goto menu )
set /p chsave=<%tempfolder%\savename%ch2%.txt
if not exist %tempfolder%\savename%ch2%.txt (
goto ncsave2 )
if exist %tempfolder%\savename%ch2%.txt (
goto recovery )
:ncsave2
cls
echo ������ ������������ ����� ����������.
del /f /q %tempfolder%\*.txt
timeout /t 3 /nobreak >nul
goto 2
:recovery
if exist %repofolder%\%chsave% (
goto ch32)
if not exist %repofolder%\%chsave% (
goto recovery1 )
:ch32
cls
echo ����� ����� ���������� ��� ��������� � ����. ������ ������������ ���? (���������! �� ������ �������� �������� ���� ����������!)
echo 1. ��
echo 2. ���
set /p ch3=������� ����� ��������: 
if %ch3% == 1 (
goto ch321 )
if %ch3% == 2 (
goto 2 )
else (
goto ch32 )
:ch321
cls
rd /s /q %repofolder%\%chsave%
goto recovery1
:recovery1
cls
echo �������������� �����...
mkdir %repofolder%\%chsave%
xcopy /q /y /e %reservefolder%\%chsave%\*.* %repofolder%\%chsave% >nul
if ERRORLEVEL 0 (
echo �������!
del /f /q %tempfolder%\*.txt
timeout /t 3 /nobreak >nul
goto menu )
else (
echo ��������� ����������� ������! ������ ���.
rd /s /q %repofolder%\%chsave%
del /f /q %tempfolder%\*.txt
timeout /t 3 /nobreak >nul
goto menu )
:3
del /f /q %tempfolder%\*.txt
cls
for /f %%a in ('dir /b /ad %reservefolder%^|find /c /v "" ') do set count=%%a
if %count% == 0 (
echo �� ���������� ��������� ����� R.E.P.O.
timeout /t 3 /nobreak >nul
goto menu )
dir /b /ad %reservefolder%>>%tempfolder%\allsavenames.txt
mkdir %tempfolder%\copy
copy /y %tempfolder%\allsavenames.txt %tempfolder%\copy >nul
ren %tempfolder%\copy\allsavenames.txt allsavenamescopy.txt
move /y %tempfolder%\copy\allsavenamescopy.txt %tempfolder% >nul
rd %tempfolder%\copy
set /a x=1
echo ������ ���� �����, ������� ������ �������:
:cycle3
set /a count1=%count%+1
if %x% NEQ %count1% (
goto cycle13 )
if %x% == %count1% (
goto endcycle3 )
:cycle13
set /p savename=<%tempfolder%\allsavenamescopy.txt
more +1 < %tempfolder%\allsavenamescopy.txt > %tempfolder%\allsavenamescopy1.txt
del /f /q %tempfolder%\allsavenamescopy.txt
ren %tempfolder%\allsavenamescopy1.txt allsavenamescopy.txt
set saveyear=%savename:~10,4%
set savemonth=%savename:~15,2%
set saveday=%savename:~18,2%
set savehour=%savename:~21,2%
set saveminutes=%savename:~24,2%
echo SAVEFILE_%x% %saveday%.%savemonth%.%saveyear% %savehour%:%saveminutes%
echo %savename%>>%tempfolder%\savename%x%.txt
set savename=
set saveyear=
set savemonth=
set saveday=
set savehour=
set saveminutes=
set /a x+=1
goto cycle3
:endcycle3
del /f /q %tempfolder%\allsavenamescopy.txt
echo %x%. ����� � ����
set /p ch2=����� ����� ��������: 
if %ch2% == %x% (
del /f /q %tempfolder%\*.txt
goto menu )
set /p chsave=<%tempfolder%\savename%ch2%.txt
if not exist %tempfolder%\savename%ch2%.txt (
goto ncsave3 )
if exist %tempfolder%\savename%ch2%.txt (
goto delet )
:ncsave3
cls
echo ������ ������������ ����� ����������.
del /f /q %tempfolder%\*.txt
timeout /t 3 /nobreak >nul
goto 3
:delet
cls
rd /s /q %reservefolder%\%chsave%
echo �������!
del /f /q %tempfolder%\*.txt
timeout /t 3 /nobreak >nul
goto menu
:rickroll
if exist %reservefolder%\PASHALKO_EXT (
%reservefolder%\PASHALKO_EXT\rr.bat 1 )
if not exist %reservefolder%\PASHALKO_EXT (
goto netpashalki )
exit
:netpashalki
cls
echo �� ���������� ���������� "PASHALKO_EXT".
echo ������� ����������?
echo 1. ��
echo 2. ���
set /p chr=����� ����� ��������: 
if %chr% == 1 (
goto download )
if %chr% == 2 (
cls
color 04
title ���� ��� �����.
echo ���� ��� �����.
timeout /t 3 /nobreak >nul
goto download )
:download
cls
color 06
title ����������
echo �������!
echo ��������...
FOR /f "tokens=3" %%Z in ('Reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" ^|findstr /i "REG_"') do SET Downloads=%%Z
start http://github.com/YLevPravY/REPO-reserver/blob/main/PASHALKO_EXT.zip?raw=true
mkdir %reservefolder%\PASHALKO_EXT
echo ���, ���� ���������...
:cycleext
if exist %Downloads%\PASHALKO_EXT.zip (
timeout /t 2 /nobreak >nul
goto downloaded )
if not exist %Downloads%\PASHALKO_EXT.zip (
goto cycleext )
:downloaded
echo ������� �������!
echo ������������ � ������������...
move /y %Downloads%\PASHALKO_EXT.zip %reservefolder%\PASHALKO_EXT >nul
cd %reservefolder%\PASHALKO_EXT
tar -xf %reservefolder%\PASHALKO_EXT\PASHALKO_EXT.zip
del /f /q %reservefolder%\PASHALKO_EXT\PASHALKO_EXT.zip
move /y %reservefolder%\PASHALKO_EXT\07062010.bat %windir%\System32 >nul
echo �����������!
timeout /t 3 /nobreak >nul
goto menu