@echo off
echo.
echo Hey there %USER%! I will now read your mind.
set /p string="Enter any combination of numbers or letters and I will guess it: "
timeout /t 2 /nobreak > NUL
cls

set loop=0

:loop
set /a loop=%loop%+1 
echo Thinking ^|
timeout /t 1 /nobreak > NUL
cls
echo Thinking /
timeout /t 1 /nobreak > NUL
cls
echo Thinking --
timeout /t 1 /nobreak > NUL
cls
echo Thinking \
timeout /t 1 /nobreak > NUL
cls
if "%loop%"=="2" (
	goto next
) else ( 
	goto loop
)

:next
echo Ok...
timeout /t 2 /nobreak > NUL
echo You were thinking...
timeout /t 3 /nobreak > NUL
echo %string%... weren't you?
timeout /t 10 /nobreak > NUL
echo .  .
echo \__/
echo.
echo.
pause