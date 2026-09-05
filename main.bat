@echo off
setlocal EnableDelayedExpansion
title MultiTool - by Ebola Man (upgrade version by Jindo)
chcp 65001 >nul
pushd "%~dp0files"
:start
call :banner

:menu
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo.
echo [38;2;255;255;0m        ╔═(1) System Informer[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╠═══(2) Personal Password Generator[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╚╦═══(3) Contact  
echo [38;2;255;255;0m         ║[0m  
echo [38;2;255;255;0m         ║[0m  
set "input="
set /p "input=.%BS% [38;2;255;255;0m        ╚══════>[0m  
if /I "!input!"=="1" start "" "%~dp0files\si.lnk"
if /I "!input!"=="2" start uh.exe
if /I "!input!"=="3" goto contact
if /I "!input!"=="0973505373" start secret
if /I "!input!"=="restart" (
    echo Are you sure you want to shut down the PC?
    choice /c yn /n /m "[Y/N]> "

    if errorlevel 2 (
        cls
        goto start
    )

    shutdown /r /t 0
)
if /I "!input!"=="shutdown" (
    echo Are you sure you want to shut down the PC?
    choice /c yn /n /m "[Y/N]> "
    if errorlevel 2 (
        cls
        goto :start
    )

    "%SystemRoot%\System32\shutdown.exe" /s /t 0
    exit
)
if /I "!input!"=="help" goto :help
if /I "!input!"=="lock" (
    "%SystemRoot%\System32\rundll32.exe" user32.dll,LockWorkStation
    exit
)
if /I "!input!"=="hide" (
    popd

    set "target="
    echo.
    set /p "target=[38;2;255;255;0mEnter the file or folder path: "

    if not defined target (
        echo.
        echo No path entered.
        pause
        pushd files
        cls
        goto :start
    )

    if exist "!target!" (
        attrib +h +s +r "!target!"
        echo.
        echo Hidden successfully.
    ) else (
        echo.
        echo File or folder not found.
    )

    pause
    pushd files
    cls
    goto :start
)
if /I "%input%"=="unhide" (
    popd

    set "target="
    echo.
    set /p "target=[38;2;255;255;0mEnter the file or folder path: "

    if not defined target (
        echo.
        echo No path entered.
        pause
        pushd files
        cls
        goto :start
    )

    if exist "!target!" (
        attrib -h -s -r "!target!"
        echo.
        echo Unhidden successfully.
    ) else (
        echo.
        echo File or folder not found.
    )
    pause
    pushd files
    cls
    goto :start
)
if /I "!input!"=="network" goto :network
if /I "!input!"=="open" goto :launchmenu
if /I "!input!"=="sysmgr" goto :sysmgr
if /I "!input!"=="version" goto :version
if /I "!input!"=="chatbot" goto :chat
if /I "!input!"=="calc" goto :calc
if /I "!input!"=="fun" goto :fun
if /I "!input!"=="exit" exit
cls
goto start

:help
cls
echo [38;2;255;255;0m ==============================
echo            COMMANDS
echo  ==============================
echo [38;2;255;255;0mAvailable commands:
echo 1         - System Informer
echo 2         - Personal Password Generator
echo 3         - open the contact website ^(it just a normal website that have a clickable link)
echo restart   - Restart the PC
echo shutdown  - Shut down the PC
echo help      - Show this list
echo lock      - Lock the PC
echo hide      - hide a file or folder
echo unhide    - unhide a file or folder
echo open      - files launcher
echo network   - network tool
echo sysmgr    - system manager
echo version   - show information such as version, Devlopers name's,...
echo chatbot   - open a chat bot conversation
echo calc      - open calculator
echo fun       - show fun things ^:^)
echo exit      - Exit
echo.
echo This script contains a devloper-only command
echo It also need a secret code.
echo.
pause
cls
goto start

:launchmenu
cls
echo [38;2;255;255;0m==============================
echo          FILE LAUNCHER
echo ==============================
echo.
echo Found:
set "target="
echo !target!
echo.
echo (1) Open
echo (2) Enter another path
echo (3) Back
echo.

set "launchinput="
set /p "launchinput=> "

if "!launchinput!"=="1" (
    echo.
    echo Launching...
    start "" "!target!"
    pause
    goto :launchmenu
)

if "!launchinput!"=="2" goto :launch

if "!launchinput!"=="3" (
    cls
    goto :start
)

echo.
echo Invalid option.
pause
goto :launchmenu

:network
cls
echo [38;2;255;255;0m ==============================
echo        NETWORK TOOLS 3.0
echo  ==============================
echo.
echo (1) Ping
echo (2) Show Hostname
echo (3) IP Configuration
echo (4) Network in File Explorer
echo (5) Tracert
echo (6) DNS Lookup
echo (7) Active Connections
echo (8) Flush DNS
echo (9) Internet Connectivity Test
echo (10) Release IP
echo (11) Renew IP
echo (12) Routing Table
echo (13) ARP Table
echo (14) Network Adapter Information
echo (15) Network Settings
echo (16) Back
echo.

set "netinput="
set /p "netinput=> "

if "!netinput!"=="1" (
    cls
    echo [38;2;255;255;0m ==============================
    echo              PING
    echo  ==============================
    echo.
    set "host="
    set /p "host=Enter hostname or IP: "
    echo.
    ping "!host!"
    echo.
    pause
    goto :network
)

if "!netinput!"=="2" (
    cls
    echo [38;2;255;255;0m ==============================
    echo            HOST NAME
    echo  ==============================
    echo.
    hostname
    echo.
    pause
    goto :network
)

if "!netinput!"=="3" (
    cls
    echo [38;2;255;255;0m ========================================
    echo            IP CONFIGURATION
    echo  ========================================
    echo.
    ipconfig /all
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="4" (
    start "" explorer.exe shell:NetworkPlacesFolder
    goto :network
)

if /I "!netinput!"=="5" (
    cls
    echo [38;2;255;255;0m ==============================
    echo             TRACERT
    echo  ==============================
    echo.
    set "host="
    set /p "host=Enter hostname or IP: "
    echo.
    tracert "!host!"
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="6" (
    cls
    echo [38;2;255;255;0m ==============================
    echo           DNS LOOKUP
    echo  ==============================
    echo.
    set "host="
    set /p "host=Enter hostname: "
    echo.
    nslookup "!host!"
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="7" (
    cls
    echo [38;2;255;255;0m ==============================
    echo       ACTIVE CONNECTIONS
    echo  ==============================
    echo.
    netstat -ano
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="8" (
    cls
    echo [38;2;255;255;0m ==============================
    echo            FLUSH DNS
    echo  ==============================
    echo.
    ipconfig /flushdns
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="9" (
    cls
    echo [38;2;255;255;0m ==============================
    echo    INTERNET CONNECTIVITY TEST
    echo  ==============================
    echo.
    ping 1.1.1.1
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="10" (
    cls
    echo [38;2;255;255;0m ==============================
    echo            RELEASE IP
    echo  ==============================
    echo.
    ipconfig /release
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="11" (
    cls
    echo [38;2;255;255;0m ==============================
    echo             RENEW IP
    echo  ==============================
    echo.
    ipconfig /renew
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="12" (
    cls
    echo [38;2;255;255;0m ==============================
    echo          ROUTING TABLE
    echo  ==============================
    echo.
    route print
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="13" (
    cls
    echo [38;2;255;255;0m ==============================
    echo           ARP TABLE
    echo  ==============================
    echo.
    arp -a
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="14" (
    cls
    echo [38;2;255;255;0m ==============================
    echo       NETWORK ADAPTER INFO
    echo  ==============================
    echo.
    getmac /v
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="15" (
    start "" ms-settings:network
    goto :network
)

if /I "!netinput!"=="16" (
    cls
    goto start
)

cls
goto :network

:launch
cls
echo [38;2;255;255;0m==============================
echo          Launch File
echo ==============================
echo.
set "target="
set /p "target=Enter the file path: "
  if not defined target (
    echo.
    echo No path entered.
    pause
    pushd files
    cls
    goto :start
)
 if exist "!target!" (
    echo.
    echo launching "!target!"
    start "" "!target!"
) else (
    echo File not found.
    pause
)
cls
goto launchmenu

:sysmgr
cls
echo [38;2;255;255;0m ==============================
echo        SYSTEM MANAGER 3.0
echo  ==============================
echo.
echo (1) System Information
echo (2) Task Manager (system informer)
echo (3) Services
echo (4) Startup Apps
echo (5) Disk Management
echo (6) Windows Settings
echo (7) Device Manager
echo (8) Environment Variables
echo (9) System Tools
echo (10) Administrative Tools
echo (11) Control Panel
echo (12) This PC
echo (13) C: Drive
echo (14) Command Prompt
echo (15) Windows PowerShell
echo (16) Windows Accessories
echo (17) Network Connections
echo (18) Drives select
echo (19) Temporary Files Cleaner
echo (20) Event viewer
echo (21) Storage cleanup
echo (22) Power config
echo (23) Network settings
echo (24) Back

==============================
set "sysinput="
set /p "sysinput=> "
if "!sysinput!"=="1" goto sysinfo
if "!sysinput!"=="2" start si.lnk
if "!sysinput!"=="3" start "" services.msc
if "!sysinput!"=="4" (
  echo Seting startup app?
  choice /c yn /n /m "[Y/N]> "

    if errorlevel 2 (
      echo Opening startup folder...
      start "" shell:startup
      pause
      cls
      goto sysmgr
    )

      start "" ms-settings:startupapps
      pause
      cls
      goto sysmgr

)
if "!sysinput!"=="5" start "" diskmgmt.msc
if "!sysinput!"=="6" start "" ms-settings:
if "!sysinput!"=="7" start "" devmgmt.msc
if "!sysinput!"=="8" start "" rundll32.exe sysdm.cpl,EditEnvironmentVariables
if "!sysinput!"=="9" start "" "%AppData%\Microsoft\Windows\Start Menu\Programs\System Tools"
if "!sysinput!"=="10" start "" "%windir%\system32\control.exe" /name Microsoft.AdministrativeTools
if "!sysinput!"=="11" start "" "%windir%\system32\control.exe"
if "!sysinput!"=="12" start "" explorer.exe shell:MyComputerFolder
if "!sysinput!"=="13" start "" C:\
if "!sysinput!"=="14" start "" cmd.exe
if "!sysinput!"=="15" start "" Powershell.exe
if "!sysinput!"=="16" start "" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Accessories"
if "!sysinput!"=="17" start "" ncpa.cpl
if "!sysinput!"=="18" (
    echo Choose drive...
    set "dinput="
    set /p "dinput=Drive letter (example: C): "

    if defined dinput (
        start "" "!dinput!:\"
        pause
        cls
        goto sysmgr
    )
)
if "!sysinput!"=="19" (
    cls
    echo [38;2;255;255;0m ============================
    echo     TEMPORARY FILE CLEANER
    echo  ============================
    echo Cleaning temporary files...
    echo.

    echo Cleaning user TEMP...
    del /q /f "%TEMP%\*" >nul 2>&1
    for /d %%D in ("%TEMP%\*") do rd /s /q "%%D" >nul 2>&1

    echo Cleaning Windows TEMP...
    del /q /f "%windir%\Temp\*" >nul 2>&1
    for /d %%D in ("%windir%\Temp\*") do rd /s /q "%%D" >nul 2>&1

    echo.
    echo Temporary files cleaned.
    pause
    cls
    goto sysmgr
)
if "!sysinput!"=="20" start "" eventvwr.msc
if "!sysinput!"=="21" (
    start "" ms-settings:storagesense
    cls
    goto sysmgr
)
if "!sysinput!"=="22" start "" powercfg.cpl
if "!sysinput!"=="23" start "" ms-settings:network
if "!sysinput!"=="24" (
  cls
  goto start
)
cls
goto :sysmgr

:version
cls
echo [38;2;255;255;0m ============================
echo      VERSION ^& INFORMATION
echo  ============================
echo.
echo.
echo Multi-Tool v1.2.4
echo Jindo's devloper team Copyright ©
echo.
echo Thanks to:
echo - Naoko Ka Moi
echo - Ca Say Kho
echo - Altreyos
echo.
echo Special thanks:
echo - Ebola Man
echo - Hiryea Hiris
echo - Ca Say Kho
echo - Altreyos
echo - Naoko Ka Moi
echo.
echo Contributors:
echo - Ca Say Kho
echo - Damien (also known as Diamond)
echo.
echo Bugs found? Use the "contact" command to open the contact website.
pause
cls
goto start

:chat
cls
echo [38;2;255;255;0mHi! I'm the chat bot! What can I help?
echo.
echo (1) Who Are You?
echo (2) What is this app does?
echo (3) What's the Devloper-only command's code?
echo (4) (DELETED COMMAND)
echo (5) Hey.
echo (6) Bye.
set "cinput="
set /p "cinput=>>"
if "!cinput!"=="1" (
  echo I am a chat bot design for helping the users to undestand what's this app does.
  echo Say goodbye before I'm get deleted from the code. The devloper will delete me in the next update ^( ^T^_^T ^)
  pause
)
if "!cinput!"=="2" (
  echo This app is kind like a multi-tool
  echo What's can manage:
  echo - system
  echo - network
  echo - running process ^& process
  echo - files
  echo - and many other things.
  pause
)
if "!cinput!"=="3" (
  echo I can't leak the code out but I'll give you a hint. Hint: ask the devloper for the code ^:^)
  echo   │   ┌───
  echo   │   │
  echo   └───┼──┐
  echo       │  │
  echo   ────┘  │
  pause
)
if "!cinput!"=="4" (
  echo ^(This line of code has been deleted because of many things^)
  pause
  cls
  goto chat
)
if "!cinput!"=="5" goto disturp
if "!cinput!"=="6" (
  echo Goodbye. Press any key to return to the main menu.
  pause
  cls
  goto start
)
cls
goto chat

:disturp
cls
echo What can I help?
echo.
echo (1) nothing ^:^)
set "cinput="
set /p "cinput=>>"
if "!cinput!"=="1" (
  echo Bro why you disturp me?
  pause
)
cls
goto :chat

:calc
cls
echo [38;2;255;255;0m ============================
echo           CALCULATOR
echo  ============================
echo.
echo.
echo (1) Addition
echo (2) Subtraction
echo (3) Multiplication
echo (4) Division
echo (5) System calculator
echo (6) Back
set "linput="
set "result="
set /p "linput=> "
if "!linput!"=="1" goto :plus
if "!linput!"=="2" goto :minus
if "!linput!"=="3" goto :multiply
if "!linput!"=="4" goto :divide
if "!linput!"=="5" (
  start "" calc.exe
  goto :calc
)
if "!linput!"=="6" (
  cls
  goto start
)
cls
goto calc

:plus
cls
echo [38;2;255;255;0m ============================
echo              PLUS
echo  ============================
set "firnum="
set "secnum="
set /p "firnum=First number: "
set /p "secnum=Second number: "
set /a "result=firnum + secnum"
echo Result: !result!
pause
cls
goto calc

:minus
cls
echo [38;2;255;255;0m ============================
echo             MINUS
echo  ============================
set "firnum="
set "secnum="
set /p "firnum=First number: "
set /p "secnum=Second number: "
set /a "result=firnum - secnum"
echo Result: !result!
pause
cls
goto calc

:multiply
cls
echo [38;2;255;255;0m ============================
echo           MULTIPLY
echo  ============================
set "firnum="
set "secnum="
set /p "firnum=First number: "
set /p "secnum=Second number: "
set /a "result=firnum * secnum"
echo Result: !result!
pause
cls
goto calc

:divide
cls
echo [38;2;255;255;0m ============================
echo             DIVIDE
echo  ============================
set "firnum="
set "secnum="
set /p "firnum=First number: "
set /p "secnum=Second number: "
set /a "result=firnum / secnum"
set /a "remainder=firnum %% secnum"
set "decimal="

for /L %%D in (1,1,6) do (
    set /a "remainder*=10"
    set /a "digit=remainder / secnum"
    set /a "remainder=remainder %% secnum"
    set "decimal=!decimal!!digit!"
)

echo Result: !result!.!decimal!
pause
cls
goto calc

:sysinfo
cls
echo [38;2;255;255;0m =========================================
echo          SYSTEM INFORMATION 2.0
echo  =========================================
echo.

echo Computer Name:
hostname
echo.

echo User:
whoami
echo.

echo Windows:
ver
echo.

echo System Architecture:
if defined ProgramFiles(x86) (
    echo 64-bit
) else (
    echo 32-bit
)
echo.

echo CPU:
for /f "tokens=2,*" %%A in ('reg query "HKLM\HARDWARE\DESCRIPTION\System\CentralProcessor\0" /v ProcessorNameString 2^>nul ^| find /I "ProcessorNameString"') do echo %%B
echo.

echo RAM:
where wmic >nul 2>&1
if not errorlevel 1 (
    wmic OS get TotalVisibleMemorySize
) else (
    echo RAM unavailable on Windows 11 because without WMIC, the command can't work.
)
echo.

echo GPU:
where wmic >nul 2>&1
if not errorlevel 1 (
    wmic path win32_VideoController get name
) else (
    echo GPU information unavailable on Windows 11 because without WMIC, the command can't work.
)
echo.

echo System Drive:
wmic logicaldisk where "DeviceID='C:'" get Size,FreeSpace
echo.

echo IPv4 Address:
ipconfig | findstr /C:"IPv4"
echo.

echo Current Date:
date /t
echo.

echo Current Time:
time /t
echo.

echo [38;2;255;255;0m =========================================
pause
cls
goto sysmgr

:fun
cls
echo [38;2;255;255;0m =========================================
echo              SECRET COMMAND
echo  =========================================
echo.
echo.
echo (1) show the fun things ^:^)
echo (2) Back
set "sinput="
set /p "sinput=>> "
if /I "!sinput!"=="1" (
    set "sc="
    echo [38;2;255;0;0mAre you sure? ^(this can make your computer explode if your computer is a potato^)[Y/N]
    set /p "sc=>> "

    if /I "!sc!"=="Y" (
        start "" "https://fl.youareanidiot.cc"
        echo [38;5;226myou are an idiot, ha ha ha ha ha ha ha ha ha ha ha.
        pause
        cls
        goto :fun
    )

    if /I "!sc!"=="N" (
        echo [38;5;226mok ^:^)
        pause
        cls
        goto :fun
    )

    echo Invalid input.
    pause
    cls
    goto :fun
)
if "!sinput!"=="2" (
  cls
  goto start
)
cls
goto fun

:contact
cls
echo [38;2;255;255;0m =================================
echo              CONTACT
echo  =================================
echo.
echo Opening contact webpage...
start "" https://contact-mbol.onrender.com/
echo Openned in your default browser.
echo Please click the link in the website to get contact.
pause
cls
goto start

:banner
echo.
echo.
echo                     [38;2;255;0;0m███╗   ███╗██╗   ██╗██╗  ████████╗██╗    ████████╗ ██████╗  ██████╗ ██╗[0m     
echo                     [38;2;255;51;0m████╗ ████║██║   ██║██║  ╚══██╔══╝██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     [0m
echo                     [38;2;255;102;0m██╔████╔██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║    [0m 
echo                     [38;2;255;153;0m██║╚██╔╝██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║     [0m
echo                     [38;2;255;204;0m██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║       ██║   ╚██████╔╝╚██████╔╝███████╗[0m
echo                     [38;2;255;255;0m╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝[0m
echo.