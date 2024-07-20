:menu
cls
echo Select a Windows utility to execute:
echo 1. ipconfig
echo 2. tasklist
echo 3. taskkill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
set /p choice="Enter your choice (1-8): "

if "%choice%"=="1" goto ipconfig
if "%choice%"=="2" goto tasklist
if "%choice%"=="3" goto taskkill
if "%choice%"=="4" goto chkdsk
if "%choice%"=="5" goto format
if "%choice%"=="6" goto defrag
if "%choice%"=="7" goto find
if "%choice%"=="8" goto attrib
echo Invalid choice, please try again.
pause
goto menu

:ipconfig
ipconfig
pause
goto menu

:tasklist
tasklist
pause
goto menu

:taskkill
set /p pid="Enter the PID of the task to kill: "
taskkill /PID %pid%
pause
goto menu

:chkdsk
set /p drive="Enter the drive letter (e.g., C:): "
chkdsk %drive%
pause
goto menu

:format
set /p drive="Enter the drive letter to format (e.g., E:): "
echo Warning: Formatting will erase all data on %drive%
set /p confirm="Are you sure you want to format %drive%? (Y/N): "
if /i "%confirm%"=="Y" format %drive%
pause
goto menu

:defrag
set /p drive="Enter the drive letter to defrag (e.g., C:): "
defrag %drive%
pause
goto menu

:find
set /p "searchString=Enter the string to find: "
set /p "fileName=Enter the file name to search in: "
find "%searchString%" %fileName%
pause
goto menu

:attrib
set /p "fileName=Enter the file name to change attributes: "
attrib %fileName%
pause
goto menu
