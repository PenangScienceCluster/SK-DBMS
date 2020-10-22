@::!/dos/rocks
@echo off
goto :init

:header
    echo %__NAME% v%__VERSION%
    echo This script installs XAMPP, Git and Visual Studio Code
    echo for you via Windows Package Manager.
    echo Only for Windows 10.
    echo.
    goto :eof

:usage
    echo USAGE:
    echo   %__BAT_NAME% [flags] "required argument" "optional argument" 
    echo.
    echo.  /?, --help           shows this help
    echo.  /v, --version        shows the version
    echo.  -f, --flag value     specifies a named parameter value
    goto :eof

:version
    if "%~1"=="full" call :header & goto :eof
    echo %__VERSION%
    goto :eof

:missing_argument
    call :header
    call :usage
    echo.
    echo ****                                   ****
    echo ****    MISSING "REQUIRED ARGUMENT"    ****
    echo ****                                   ****
    echo.
    goto :eof

:init
    set "__NAME=%~n0"
    set "__VERSION=1.0"
    set "__YEAR=2020"

    set "__BAT_FILE=%~0"
    set "__BAT_PATH=%~dp0"
    set "__BAT_NAME=%~nx0"

    set "OptHelp="
    set "OptVersion="

    set "UnNamedArgument="
    set "UnNamedOptionalArg="
    set "NamedFlag="

:parse
    if "%~1"=="" goto :validate

    if /i "%~1"=="/?"         call :header & call :usage "%~2" & goto :end
    if /i "%~1"=="-?"         call :header & call :usage "%~2" & goto :end
    if /i "%~1"=="--help"     call :header & call :usage "%~2" & goto :end

    if /i "%~1"=="/v"         call :version      & goto :end
    if /i "%~1"=="-v"         call :version      & goto :end
    if /i "%~1"=="--version"  call :version full & goto :end

    if /i "%~1"=="/q"         call :header & goto :main
    if /i "%~1"=="-q"         call :header & goto :main
    if /i "%~1"=="--quiet"    call :header & goto :main

    if /i "%~1"=="--flag"     set "NamedFlag=%~2"   & shift & shift & goto :parse

    if not defined UnNamedArgument     set "UnNamedArgument=%~1"     & shift & goto :parse
    if not defined UnNamedOptionalArg  set "UnNamedOptionalArg=%~1"  & shift & goto :parse

    shift
    goto :parse

:validate
    if not defined UnNamedArgument call :header & goto :ask

:ask
    set choice=
    set /p "choice=Type Y and enter to start the installation: "
    if '%choice%'=='Y' goto :main
    if '%choice%'=='y' goto :main
    goto :end

:prere
    echo winget not found. Trying to install winget...
    echo.
    set __lnk_1=https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle
    set __FN=
    for /F "delims=" %%i IN ("%__lnk_1%") DO (
        set __FN=%%~ni%%~xi
    )  
    powershell.exe -Command (New-Object System.Net.WebClient).DownloadFile('%__lnk_1%', '%__FN%') || goto :fatalerr
    powershell.exe -Command (Add-AppxPackage -Path '%__FN%') || goto :fatalerr
    echo.
    echo Resuming installation...
    echo.
    goto :main

:fatalerr
    echo.
    echo Execution failed
    echo.
    pause
    goto :end

:main
    echo Installation has started.
    echo.
    where /q winget || goto :prere
    winget install -e --id ApacheFriends.Xampp
    winget install -e --id Git.Git
    winget install -e --id Microsoft.VisualStudioCode
    echo.
    echo Done!
    pause

:end
    call :cleanup
    exit /B

:cleanup
    REM The cleanup function is only really necessary if you
    REM are _not_ using SETLOCAL.
    set "__NAME="
    set "__VERSION="
    set "__YEAR="

    set "__BAT_FILE="
    set "__BAT_PATH="
    set "__BAT_NAME="

    set "OptHelp="
    set "OptVersion="
    set "OptVerbose="

    set "UnNamedArgument="
    set "UnNamedArgument2="
    set "NamedFlag="

    goto :eof
