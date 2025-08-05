@echo off
:: MMO YouTube Downloader Pro
:: Now with automatic dependency handling

set "BIN_DIR=%~dp0"
set "YTDLP=%BIN_DIR%\yt-dlp.exe"
set "FFMPEG=%BIN_DIR%\ffmpeg.exe"

:: Check dependencies
if not exist "%YTDLP%" (
    echo ❌ yt-dlp missing! Running installer...
    call "%BIN_DIR%\get-dependencies.cmd"
    if not exist "%YTDLP%" exit /b 1
)

if not exist "%FFMPEG%" (
    echo ❌ FFmpeg missing! Running installer...
    call "%BIN_DIR%\get-dependencies.cmd"
    if not exist "%FFMPEG%" exit /b 1
)

:: Rest of your existing Downloader.cmd script...
:: (Main menu, download functions, etc.)
