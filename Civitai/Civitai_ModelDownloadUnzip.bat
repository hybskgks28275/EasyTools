@echo off
chcp 65001 > NUL
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass

echo.
set DOWNLOAD_DIR=%~1
set DOWNLOAD_FILE=%~2
set DOWNLOAD_ZIP_FILE=%~n2.zip
set MODEL_ID=%~3
set VERSION_ID=%~4
set "MODEL_URL=https://civitai.red/models/%MODEL_ID%?modelVersionId=%VERSION_ID%"

if exist "%DOWNLOAD_DIR%%DOWNLOAD_FILE%" (
	if exist "%~dp0..\Download\ARIA_USE_CURL" (
		echo %MODEL_URL% %DOWNLOAD_FILE%
		exit /b 0
	)
	if not exist "%DOWNLOAD_DIR%%DOWNLOAD_FILE%.aria2" (
		echo %MODEL_URL% %DOWNLOAD_FILE%
		exit /b 0
	)
)

echo call "%~dp0Civitai_ModelDownload.bat" "%DOWNLOAD_DIR%" "%DOWNLOAD_ZIP_FILE%" %MODEL_ID% %VERSION_ID%
call "%~dp0Civitai_ModelDownload.bat" "%DOWNLOAD_DIR%" "%DOWNLOAD_ZIP_FILE%" %MODEL_ID% %VERSION_ID%
if %ERRORLEVEL% neq 0 ( exit /b 1 )

set DOWNLOAD_ZIP_PATH=%DOWNLOAD_DIR%\%DOWNLOAD_ZIP_FILE%
echo %PS_CMD% "try { Expand-Archive -Path %DOWNLOAD_ZIP_PATH% -DestinationPath %DOWNLOAD_DIR% -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path %DOWNLOAD_ZIP_PATH% -DestinationPath %DOWNLOAD_DIR% -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )

echo del /Q %DOWNLOAD_ZIP_PATH%
del /Q %DOWNLOAD_ZIP_PATH%
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
