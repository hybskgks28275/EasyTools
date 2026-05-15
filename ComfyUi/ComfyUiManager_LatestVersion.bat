@echo off
chcp 65001 > NUL
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass

%PS_CMD% -c "& { try { (Invoke-WebRequest -Uri 'https://api.github.com/repos/Comfy-Org/ComfyUI-Manager/tags' | ConvertFrom-Json)[0].name } catch { exit 1 } }" >nul 2>&1
if %ERRORLEVEL% neq 0 (
	echo "[WARN] Failed to get the latest ComfyUI-Manager version."
	exit /b 0
)

set COMFYUI_MANAGER_LATEST_VERSION=
for /f "delims=" %%a in (
	'%PS_CMD% -c "& { (Invoke-WebRequest -Uri 'https://api.github.com/repos/Comfy-Org/ComfyUI-Manager/tags' | ConvertFrom-Json)[0].name }"'
) do set "COMFYUI_MANAGER_LATEST_VERSION=%%a"

echo %COMFYUI_MANAGER_LATEST_VERSION%> "%~dp0ComfyUiManager_Version.txt"
echo ComfyUI-Manager %COMFYUI_MANAGER_LATEST_VERSION%
