:START
cls
@echo OFF
@echo /////// T H E  F L U S H E R ////////
@echo // this program clears recycle bin //
@echo // and removes temporary files     //
@echo /////////////////////////////////////
@echo .
@echo .
@echo off
@echo (1) FLUSH TEMPORARY FILES
@echo (2) CLEAR RECYCLE BIN
@echo (3) FLUSH BOTH TEMP AND RECYCLE BIN
@echo (0) QUIT
:QUEST
SET /P ANSWER=What do you want to do?
if /i {%ANSWER%}=={1} (goto :CLSTEMP) 
if /i {%ANSWER%}=={2} (goto :CLSRCL)
if /i {%ANSWER%}=={3} (goto :CLSBOTH)
if /i {%ANSWER%}=={0} (goto :QUITT)
goto :QUEST  

:CLSTEMP
@echo off
set targetdir=%TEMP%
del /q %targetdir%\*
for /d %%x in (%targetdir%\*) do @rd /s /q ^"%%x^"
cls
@echo // TEMPORARY FILES FLUSHED //
pause
goto :START

:CLSRCL
@echo off
rd /s /q %systemdrive%\$Recycle.bin
cls
@echo // RECYCLE BIN CLEARED //
pause
goto :START

:CLSBOTH
@echo off
set targetdir=%TEMP%
del /q %targetdir%\*
for /d %%x in (%targetdir%\*) do @rd /s /q ^"%%x^"
rd /s /q %systemdrive%\$Recycle.bin
cls
@echo // RECYCLE BIN CLEARED //
@echo // TEMPORARY FILES FLUSHED //
pause
goto :START

:QUITT
@echo off
cls
@echo // thank you for using the program //
pause