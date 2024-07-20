echo Sort text files on Drive C: by date
echo Sorting text files on Drive C: by date...
for /f "delims=" %%i in ('dir /b /o:d /s C:\*.txt') do (
    echo %%i
    set latestfile=%%i
)

echo Archive older files to Drive Z:
set archiveFolder=Z:\Archive
if not exist %archiveFolder% mkdir %archiveFolder%
echo Archiving older files to %archiveFolder%...
for /f "delims=" %%i in ('dir /b /o:d /s C:\*.txt') do (
    if not "%%i"=="!latestfile!" (
        move %%i %archiveFolder%
    )
)

echo Sort the archived files by size
echo Sorting archived files by size...
for /f "delims=" %%i in ('dir /b /o:-s /s %archiveFolder%\*.txt') do (
    echo %%i
    set largestfile=%%i
)

echo Prompt the user for permission to delete old, large files
set /p deleteConfirm="Do you want to delete the old, large files in %archiveFolder%? (Y/N): "
if /i "%deleteConfirm%"=="Y" (
    for /f "delims=" %%i in ('dir /b /o:-s /s %archiveFolder%\*.txt') do (
        del %%i
        echo Deleted: %%i
    )
) else (
    echo No files were deleted.
)
pause
exit
