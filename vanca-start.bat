@echo off
cls
echo ==========================================
echo   VANCA - Graphic Design App Launcher
echo ==========================================
echo.
echo Checking Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Node.js install nahi hai!
    echo "Download karain: https://nodejs.org/"
    pause
    exit
)
echo Node.js mil gaya ✓
echo.
echo Checking VANCA folder...
cd /d "%~dp0"
if not exist "src\App.tsx" (
    echo Error: Yeh file VANCA folder main nahi mili!
    echo Sahi folder select karein.
    pause
    exit
)
echo VANCA folder found ✓
echo.
echo ==========================================
echo   First-time setup (npm install)...
echo ==========================================
echo.
npm install 2>&1 | find "success" >nul
if %errorlevel% equ 0 (
    echo Setup poora ho gaya ✓
) else (
    echo Setup chal raha hai... (approx 30-60 seconds)
)
echo.
echo ==========================================
echo   Starting Development Server...
echo ==========================================
echo.
echo Server http://localhost:5173 pe shuru ho raha hai...
echo Band karein ya Close karein lein lein.
echo.
start "" "npm" "run" "dev"
timeout /t 2 >nul
echo.
echo ==========================================
echo   Opening Browser...
echo ==========================================
echo Waiting 8 seconds for server to start...
echo.
timeout /t 8 >nul
start "http://localhost:5173"
echo.
echo ==========================================
echo   VANCA Chalu Ho Chuka Hai! 🎨
echo ==========================================
echo.
echo 1. Browser tab khula hua hoga
echo 2. Agar na khula to manually yeh type karein:
echo   http://localhost:5173
echo 3. Undo/Redo: Ctrl+Z / Ctrl+Y
echo 4. Save: Ctrl+S
echo 5. Theme: Top bar moon/sun button
echo.
pause