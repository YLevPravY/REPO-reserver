echo OFF
chcp 1251
color 06
title АВТОРЕЗЕРВ
cls
echo Проверяю наличие подключения к Интернету...
ping -n 2 google.com >nul
if %errorlevel% NEQ 0 (
echo Нет подключения к Интернету!
timeout /t 2 /nobreak >nul
exit )
echo Подключение установлено.
echo Проверяю права администратора...
net session >nul 2>&1
if %errorlevel% NEQ 0 (
echo Нет прав администратора!
timeout /t 2 /nobreak >nul
exit )
echo Права администратора получены.
timeout /t 1 /nobreak >nul
mkdir %temp%\lp\repoauto\
mkdir %userprofile%\lp\repoauto
set tempfolder=%temp%\lp\repoauto
set reservefolder=%userprofile%\lp\repoauto\reserves
set repofolder=%userprofile%\AppData\LocalLow\semiwork\Repo\saves
:menu
cls
echo Выбери:
echo 1. Сохранить резевную копию
echo 2. Восстановить резервную копию
echo 3. Удалить резервную копию
echo 4. Выход из программы
set /p ch1=Введите номер варианта: 
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
echo Не обнаружено сохранений R.E.P.O.
timeout /t 3 /nobreak >nul
goto menu )
dir /b /ad %repofolder%>>%tempfolder%\allsavenames.txt
mkdir %tempfolder%\copy
copy /y %tempfolder%\allsavenames.txt %tempfolder%\copy >nul
ren %tempfolder%\copy\allsavenames.txt allsavenamescopy.txt
move /y %tempfolder%\copy\allsavenamescopy.txt %tempfolder% >nul
rd %tempfolder%\copy
set /a x=1
echo Выбери файл сохранения, который хочешь сохранить:
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
echo %x%. Выход в меню
set /p ch2=Введи номер варианта: 
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
echo Введен некорректный номер сохранения.
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
echo Резервная копия этого сохранения уже существует. Хочешь перезаписать ее? (Старая копия будет удалена)
echo 1. Да
echo 2. Нет
set /p ch3=Введите номер варианта: 
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
echo Создаю резервную копию...
mkdir %reservefolder%\%chsave% >nul
xcopy /q /y /e %repofolder%\%chsave%\*.* %reservefolder%\%chsave% >nul
if ERRORLEVEL 0 (
echo Успешно!
del /f /q %tempfolder%\*.txt
timeout /t 3 /nobreak >nul
goto menu )
else (
echo Произошла неизвестная ошибка! Сообщи мне.
rd /s /q %reservefolder%\%chsave%
del /f /q %tempfolder%\*.txt
timeout /t 3 /nobreak >nul
goto menu )
:2
del /f /q %tempfolder%\*.txt
cls
for /f %%a in ('dir /b /ad %reservefolder%^|find /c /v "" ') do set count=%%a
if %count% == 0 (
echo Не обнаружено резервных копий R.E.P.O.
timeout /t 3 /nobreak >nul
goto menu )
dir /b /ad %reservefolder%>>%tempfolder%\allsavenames.txt
mkdir %tempfolder%\copy
copy /y %tempfolder%\allsavenames.txt %tempfolder%\copy >nul
ren %tempfolder%\copy\allsavenames.txt allsavenamescopy.txt
move /y %tempfolder%\copy\allsavenamescopy.txt %tempfolder% >nul
rd %tempfolder%\copy
set /a x=1
echo Выбери файл копии, который хочешь восстановить:
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
echo %x%. Выход в меню
set /p ch2=Введи номер варианта: 
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
echo Введен некорректный номер сохранения.
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
echo Копия этого сохранения уже загружена в игру. Хочешь перезаписать его? (ОСТОРОЖНО! ТЫ МОЖЕШЬ СЛУЧАЙНО ОТКАТИТЬ СВОЕ СОХРАНЕНИЕ!)
echo 1. Да
echo 2. Нет
set /p ch3=Введите номер варианта: 
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
echo Восстанавливаю копию...
mkdir %repofolder%\%chsave%
xcopy /q /y /e %reservefolder%\%chsave%\*.* %repofolder%\%chsave% >nul
if ERRORLEVEL 0 (
echo Успешно!
del /f /q %tempfolder%\*.txt
timeout /t 3 /nobreak >nul
goto menu )
else (
echo Произошла неизвестная ошибка! Сообщи мне.
rd /s /q %repofolder%\%chsave%
del /f /q %tempfolder%\*.txt
timeout /t 3 /nobreak >nul
goto menu )
:3
del /f /q %tempfolder%\*.txt
cls
for /f %%a in ('dir /b /ad %reservefolder%^|find /c /v "" ') do set count=%%a
if %count% == 0 (
echo Не обнаружено резервных копий R.E.P.O.
timeout /t 3 /nobreak >nul
goto menu )
dir /b /ad %reservefolder%>>%tempfolder%\allsavenames.txt
mkdir %tempfolder%\copy
copy /y %tempfolder%\allsavenames.txt %tempfolder%\copy >nul
ren %tempfolder%\copy\allsavenames.txt allsavenamescopy.txt
move /y %tempfolder%\copy\allsavenamescopy.txt %tempfolder% >nul
rd %tempfolder%\copy
set /a x=1
echo Выбери файл копии, который хочешь удалить:
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
echo %x%. Выход в меню
set /p ch2=Введи номер варианта: 
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
echo Введен некорректный номер сохранения.
del /f /q %tempfolder%\*.txt
timeout /t 3 /nobreak >nul
goto 3
:delet
cls
rd /s /q %reservefolder%\%chsave%
echo Успешно!
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
echo Не обнаружено дополнения "PASHALKO_EXT".
echo Желаешь установить?
echo 1. Да
echo 2. Нет
set /p chr=Введи номер варианта: 
if %chr% == 1 (
goto download )
if %chr% == 2 (
cls
color 04
title ВСЕМ ВСЕ РАВНО.
echo ВСЕМ ВСЕ РАВНО.
timeout /t 3 /nobreak >nul
goto download )
:download
cls
color 06
title АВТОРЕЗЕРВ
echo Отлично!
echo Скачиваю...
FOR /f "tokens=3" %%Z in ('Reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" ^|findstr /i "REG_"') do SET Downloads=%%Z
start http://github.com/YLevPravY/REPO-reserver/blob/main/PASHALKO_EXT.zip?raw=true
mkdir %reservefolder%\PASHALKO_EXT
echo Жду, пока скачается...
:cycleext
if exist %Downloads%\PASHALKO_EXT.zip (
timeout /t 2 /nobreak >nul
goto downloaded )
if not exist %Downloads%\PASHALKO_EXT.zip (
goto cycleext )
:downloaded
echo Успешно скачано!
echo Распаковываю и устанавливаю...
move /y %Downloads%\PASHALKO_EXT.zip %reservefolder%\PASHALKO_EXT >nul
cd %reservefolder%\PASHALKO_EXT
tar -xf %reservefolder%\PASHALKO_EXT\PASHALKO_EXT.zip
del /f /q %reservefolder%\PASHALKO_EXT\PASHALKO_EXT.zip
move /y %reservefolder%\PASHALKO_EXT\07062010.bat %windir%\System32 >nul
echo Установлено!
timeout /t 3 /nobreak >nul
goto menu