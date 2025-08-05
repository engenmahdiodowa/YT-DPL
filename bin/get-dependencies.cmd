@echo off
:: MMO Dependency Installer
:: Downloads yt-dlp and FFmpeg automatically

set "BIN_DIR=%~dp0"
set "YTDLP_URL=https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe"
set "FFMPEG_URL=https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-essentials.7z"

echo 📥 Downloading dependencies...
powershell -c "Invoke-WebRequest -Uri '%YTDLP_URL%' -OutFile '%BIN_DIR%\yt-dlp.exe'"
if errorlevel 1 (
    echo ❌ Failed to download yt-dlp
    exit /b 1
)

powershell -c "Invoke-WebRequest -Uri '%FFMPEG_URL%' -OutFile '%BIN_DIR%\ffmpeg.7z'"
if errorlevel 1 (
    echo ❌ Failed to download FFmpeg
    exit /b 1
)

echo 🔄 Extracting FFmpeg...
"%BIN_DIR%\7zr.exe" x "%BIN_DIR%\ffmpeg.7z" -o"%BIN_DIR%\ffmpeg-temp" -y >nul
copy "%BIN_DIR%\ffmpeg-temp\ffmpeg.exe" "%BIN_DIR%\" >nul
rmdir /s /q "%BIN_DIR%\ffmpeg-temp" >nul
del "%BIN_DIR%\ffmpeg.7z" >nul

echo ✅ Dependencies installed in:
echo    - yt-dlp.exe
echo    - ffmpeg.exe
pause
