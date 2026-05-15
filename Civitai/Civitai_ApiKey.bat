@echo off
chcp 65001 > NUL

set CIVITAI_API_KEY_FILE=%~dp0CivitaiApiKey.txt
if exist "%CIVITAI_API_KEY_FILE%" ( exit /b 0 )

echo "Civitai のアカウント設定から API Key をコピー＆ペーストしてください。"
echo "Civitai API Key を %CIVITAI_API_KEY_FILE% に保存します。"
echo.
echo "Copy and paste the API Key from your Civitai account settings."
echo "Save the Civitai API Key to %CIVITAI_API_KEY_FILE%."
echo.
echo "1. Ctrl + Click => https://civitai.red/user/account"
echo "2. [API Keys] => [Add API key]"
echo "3. [Name] easy => [Save]"
echo "4. Click API Key to copy => Ctrl + V here"

set /p INPUT_KEY="Civitai API Key: "
if "%INPUT_KEY%"=="" (
	echo "[ERROR] Civitai API Key が空欄です。"
	echo "[ERROR] Civitai API Key is blank."
	pause & exit /b 1
)

echo "Save Civitai API Key: %CIVITAI_API_KEY_FILE%"
echo %INPUT_KEY%>"%CIVITAI_API_KEY_FILE%"
