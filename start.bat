@echo off
title ServerCloner2.0 - Developed by mikaaaamoe

set LOG_DIR=logs
set LOG_FILE=%LOG_DIR%\install_log_%date:~10,4%%date:~4,2%%date:~7,2%.txt
if not exist %LOG_DIR% mkdir %LOG_DIR%

echo Installing Python dependencies for ServerCloner2.0...
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