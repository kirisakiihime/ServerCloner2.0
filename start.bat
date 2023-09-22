@echo off
title ServerCloner2.0 - Developed by mikaaaamoe

set LOG_FILE=install_log.txt

rem Function to display a loading animation
:loading
setlocal enabledelayedexpansion
for /f %%a in ('copy /Z "%~dpf0" nul') do set "BS=%%a"
for /l %%b in (1,1,10) do (
    <nul set /p "=Installing Python dependencies... !BS! !BS! !BS!"
    timeout /t 1 /nobreak >nul
)
echo Done.
endlocal

call :loading

pip install -r requirements.txt > %LOG_FILE% 2>&1

if %errorlevel% neq 0 (
    echo Error: Failed to install dependencies for ServerCloner2.0. Please check %LOG_FILE% for details.
    pause
    exit /b 1
)

echo Dependencies for ServerCloner2.0 installed successfully.

echo Running ServerCloner2.0...
python main.py >> %LOG_FILE% 2>&1

if %errorlevel% neq 0 (
    echo Error: Failed to run ServerCloner2.0. Check %LOG_FILE% for error details.
    pause
    exit /b 1
)

echo ServerCloner2.0 has completed successfully.
echo Check %LOG_FILE% for details.
pause