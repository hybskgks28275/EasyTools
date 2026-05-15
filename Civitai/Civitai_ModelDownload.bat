@echo off
chcp 65001 > NUL

echo.
set DOWNLOAD_DIR=%~1
set DOWNLOAD_FILE=%~2
set MODEL_ID=%~3
set VERSION_ID=%~4

call "%~dp0Civitai_ApiKey.bat"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

set "CIVITAI_API_KEY_FILE=%~dp0CivitaiApiKey.txt"
set /p CIVITAI_API_KEY=<"%CIVITAI_API_KEY_FILE%"

set "MODEL_URL=https://civitai.red/models/%MODEL_ID%?modelVersionId=%VERSION_ID%"
echo %MODEL_URL% %DOWNLOAD_FILE%

set "DOWNLOAD_URL=https://civitai.red/api/download/models/%VERSION_ID%?token=%CIVITAI_API_KEY%"
call "%~dp0..\Download\Aria.bat" "%DOWNLOAD_DIR%" "%DOWNLOAD_FILE%" "%DOWNLOAD_URL%"
if %ERRORLEVEL% neq 0 ( exit /b 1 )
