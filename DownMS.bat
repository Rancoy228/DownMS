@echo off
title DownMS by Ray
:: DownMS - TCP Auto-Tuning Switcher
:: by Ray (@rncybt)

:: Admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
   echo Перезапуск с правами администратора...
   powershell -Command "Start-Process '%~f0' -Verb RunAs"
   exit
)

chcp 65001 >nul
mode con cols=75 lines=20
color 0E

echo.
echo       ██████╗  ███████  ██╗    ██╗ ███╗   ██╗ ███╗   ███╗ ███████╗
echo       ██╔══██╗ ██╔══██╗ ██║    ██║ ████╗  ██║ ████╗ ████║ ██╔════╝
echo       ██║   ██ ██║  ██║ ██║ █╗ ██║ ██╔██╗ ██║ ██╔████╔██║ ███████╗
echo       ██║   ██ ██║  ██║ ██║███╗██║ ██║╚██╗██║ ██║╚██╔╝██║ ╚════██║
echo       ██████╔╝ ███████║  ╚███╔███║╝██║ ╚████║ ██║ ╚═╝ ██║ ███████║
echo       ╚═════╝  ╚══════╝     ╚══╝╚══╝        ╚══╝          ╚═╝ ╚══╝
echo                  TCP Auto-Tuning Switcher by Rancoy
echo.

:menu
echo.
echo   ╔══════════════════════════════════════════════════════════════════╗
echo   ║ Выберите действие:                                               ║
echo   ║                                                                  ║
echo   ║  1) Отключить Auto-Tuning   (Нет потери пакетов и рассинхрона)   ║
echo   ║  2) Включить Auto-Tuning    (Высокая скорость сети)              ║
echo   ║                                                                  ║
echo   ╚══════════════════════════════════════════════════════════════════╝
echo.

set "choice="
set /p choice=   Введите 1 или 2 и нажмите Enter: 

:: Обрезаем пробелы и Enter
set "choice=%choice: =%"
if "%choice%"=="1" goto disable
if "%choice%"=="2" goto enable

echo.
echo   Неверный выбор! Попробуйте ещё раз.
timeout /t 2 >nul
goto menu

:disable
cls
echo.
echo   Отключаем TCP Auto-Tuning...
netsh int tcp set global autotuninglevel=disabled >nul
echo.
echo   Готово! Auto-Tuning ОТКЛЮЧЕН
echo   Режим: Нет потери пакетов и рассинхрона
echo.
pause
exit

:enable
cls
echo.
echo   Включаем TCP Auto-Tuning обратно...
netsh int tcp set global autotuninglevel=normal >nul
echo.
echo   Готово! Auto-Tuning возвращён в нормальное состояние
echo   Режим: Высокая скорость сети
echo.
pause
exit