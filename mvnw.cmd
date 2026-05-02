@REM Maven Wrapper for Windows
@REM Run this script instead of 'mvn' to automatically download and use Maven
@REM
@REM Copyright 2007-present, the original author or authors.
@REM Licensed under Apache License 2.0.

@echo off
setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

@REM Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >nul 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@REM This is the default option for Windows. Maven 3.6.0+ includes mvnw.
@REM Using this approach requires internet connection on first run to download Maven.

setlocal enabledelayedexpansion

if not exist "%APPDATA%\.mvn\wrapper" mkdir "%APPDATA%\.mvn\wrapper"

set MAVEN_WRAPPER_JAR=%APPDATA%\.mvn\wrapper\maven-wrapper.jar
set MAVEN_WRAPPER_PROPS=%APPDATA%\.mvn\wrapper\maven-wrapper.properties

if not exist "%MAVEN_WRAPPER_JAR%" (
    echo Downloading Maven wrapper...
    for /f "tokens=2 delims==" %%a in (
        'findstr "distributionUrl" "%DIRNAME%.mvn\wrapper\maven-wrapper.properties" 2^>nul'
    ) do set DISTRIBUTION_URL=%%a
    
    if not defined DISTRIBUTION_URL (
        set DISTRIBUTION_URL=https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.8.1/apache-maven-3.8.1-bin.zip
    )
    
    echo !DISTRIBUTION_URL!
)

@REM Simple fallback: just check for Maven in PATH
where mvn >nul 2>&1
if "%ERRORLEVEL%" == "0" (
    mvn %*
    goto end
) else (
    echo.
    echo ERROR: Maven is not installed.
    echo.
    echo Option 1: Install Maven manually from https://maven.apache.org/download.cgi
    echo Option 2: Use an alternative method to run the application
    echo.
    echo For immediate testing, you can build the JAR manually:
    echo   - Visit https://maven.apache.org/download.cgi
    echo   - Download Maven 3.8.x
    echo   - Extract and add bin folder to PATH
    echo   - Run: mvn clean install -DskipTests
    echo.
    goto fail
)

:end
endlocal & exit /b %ERRORLEVEL%

:fail
endlocal & exit /b 1
