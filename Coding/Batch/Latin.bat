@echo off
Setlocal EnableDelayedExpansion
echo Do you want to use Whitaker's words, look up a noun, or look up a verb? 
set /p mode="Answer 'words', 'noun', or verb': "


	::Check the input
if "%mode%" neq "words" (
	if "%mode%" neq "noun" (
		if "%mode%" neq "verb" (
			cls
			echo.
			echo Your input of %mode% is not valid for the mode
			echo.
		)
	)
)


if "%mode%"=="words" (
	set /p word="What word would you like to do today? "
	goto check
	:words_resume
	start "" http://archives.nd.edu/cgi-bin/wordz.pl?keyword=%word%
	GOTO EOF
)

if "%mode%"=="noun" goto noun

	:noun
	set /p word="What noun would you like to do today? "
	goto check
	:noun_resume
	start "" https://latin.cactus2000.de/noun/index_en.php?form=%word%
	goto EOF

if "%mode%"=="verb" goto verb

	:verb
	set /p word="What verb would you like to do today? "
	goto check
	:verb_resume
	start "" https://latin.cactus2000.de/index.en.php?form=%word%
	goto EOF

:check
echo %word% | findstr /r "^[1-9][0-9]*$">nul
if %errorlevel% == 0 (
    echo Your input of %word% is not valid because it contains numbers.
	pause
	exit
) else (
	if "%mode%"=="noun" (
		goto noun_resume
	)
	if "%mode%"=="verb" (
		goto verb_resume
	)
	if "%mode%"=="words"
		goto words_resume
	)
)
:EOF
	