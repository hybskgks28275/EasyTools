@echo off
chcp 65001 > NUL

set GITHUB_NAME=%1
set GITHUB_PRODUCT=%2
set GITHUB_BRANCH=%3
set GITHUB_TAG=%4

call %~dp0Git_CloneOrPull.bat https://github.com/%GITHUB_NAME%/%GITHUB_PRODUCT% %GITHUB_BRANCH%
if %ERRORLEVEL% neq 0 ( exit /b 1 )

if "%GITHUB_TAG%"=="" ( exit /b 0 )

echo "[INFO] Skip switching %GITHUB_PRODUCT% to tag %GITHUB_TAG%."

exit /b 0
