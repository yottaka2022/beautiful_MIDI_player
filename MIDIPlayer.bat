@echo off
setlocal
rem -- Options (document in manual) --------

set INITIAL_MEMORY=3G
set MAX_MEMORY=3G
set JVM_ARGS=-XX:+UseG1GC
set PAUSE_AFTER_EXIT=false

rem Adding following to JVM_ARGS *might* disable GPU use in UMP... (echoes) might... might...
rem -Dsun.java2d.d3d=false -Dsun.java2d.opengl=false

rem -- Java Check --------------------------

cd /d "%~dp0"
where java >nul 2>&1 || (
  echo -=[!]=========== Could Not Locate java Command ===========[!]=-
  echo      This launcher will very likely fail!
  echo      If you haven't installed Java, press [J] to install.
  echo      If Java is installed, add 'bin' folder to PATH.
  echo -=[!]=====================================================[!]=-
  echo.
  echo [C] Continue
  echo [Q] Quit Launcher
  echo [J] Quit Launcher and Open Java Website ^(https://java.com/^)
  echo.
  choice /n /c:QJC /m "Press key of your choice>"
  if ERRORLEVEL 3 (
    echo.
    rem continue
  ) else (
    if ERRORLEVEL 2 start "" "https://java.com/"
    exit /b
  )
)

rem -- UMP ---------------------------------

echo In following situations, close this window to terminate UMP.
echo - Can't close UMP window
echo - This window stays after closing UMP
echo.
echo -- Begin JVM/UMP Log -----------
if "%~1"=="" (
  java -Xms%INITIAL_MEMORY% -Xmx%MAX_MEMORY% %JVM_ARGS% -jar MIDIPlayer.jar || goto JVM_CRASH
) else (
  java -Xms%INITIAL_MEMORY% -Xmx%MAX_MEMORY% %JVM_ARGS% -jar MIDIPlayer.jar "%~1" || goto JVM_CRASH
)
echo -- End JVM/UMP Log -------------
echo Finished with exitcode %ERRORLEVEL%.
if "%PAUSE_AFTER_EXIT%"=="true" (
  pause
)
exit /b

:JVM_CRASH
echo -- End JVM/UMP Log -------------
echo.
echo Finished with exitcode %ERRORLEVEL% (abnormal termination)
echo Memory allocation was %INITIAL_MEMORY% initial, %MAX_MEMORY% max
echo.
rem Check if PC is definitely 32bit
if "%PROCESSOR_ARCHITECTURE%" == "x86" (
  echo ^(Tip^) 32-Bit computer detected: You can only allocate less than 4GB memory. To allocate more, you need a 64-bit computer.
) else (
  rem Check if Java is probably 32bit
  java -version 2>&1 | find /I "32-Bit" && (
    echo ^(Tip^) 32-Bit Java detected: You can only allocate less than 4GB memory. To allocate more, install 64-bit Java. ^(https://java.com/^)
  ) || (
    rem Check if JVM fails with memory options
    java -Xms%INITIAL_MEMORY% -Xmx%MAX_MEMORY% 2>&1 | find /I "The specified size exceeds the maximum representable size" && (
      echo ^(Tip^) If UMP don't start when memory allocation is 4GB or more, you need 64-bit Java. ^(https://java.com/^)
    )
  )
)
pause
exit /b

rem UMP 1.6 launcher rev 2 by PipiraMine
