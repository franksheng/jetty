@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  jetty-embedded startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

@rem Add default JVM options here. You can also use JAVA_OPTS and JETTY_EMBEDDED_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windowz variants

if not "%OS%" == "Windows_NT" goto win9xME_args
if "%@eval[2+2]" == "4" goto 4NT_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*
goto execute

:4NT_args
@rem Get arguments from the 4NT Shell from JP Software
set CMD_LINE_ARGS=%$

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\jetty-embedded-0.0.1.jar;%APP_HOME%\lib\jetty-servlet-8.1.2.v20120308.jar;%APP_HOME%\lib\jetty-webapp-8.1.2.v20120308.jar;%APP_HOME%\lib\jetty-jmx-8.1.2.v20120308.jar;%APP_HOME%\lib\jetty-jsp-8.1.2.v20120308.jar;%APP_HOME%\lib\jetty-security-8.1.2.v20120308.jar;%APP_HOME%\lib\jetty-xml-8.1.2.v20120308.jar;%APP_HOME%\lib\jetty-util-8.1.2.v20120308.jar;%APP_HOME%\lib\javax.servlet.jsp-2.2.0.v201112011158.jar;%APP_HOME%\lib\org.apache.jasper.glassfish-2.2.2.v201112011158.jar;%APP_HOME%\lib\javax.servlet.jsp.jstl-1.2.0.v201105211821.jar;%APP_HOME%\lib\org.apache.taglibs.standard.glassfish-1.2.0.v201112081803.jar;%APP_HOME%\lib\javax.el-2.2.0.v201108011116.jar;%APP_HOME%\lib\com.sun.el-2.2.0.v201108011116.jar;%APP_HOME%\lib\org.eclipse.jdt.core-3.7.1.jar;%APP_HOME%\lib\jetty-server-8.1.2.v20120308.jar;%APP_HOME%\lib\javax.servlet-3.0.0.v201112011016.jar;%APP_HOME%\lib\jetty-continuation-8.1.2.v20120308.jar;%APP_HOME%\lib\jetty-http-8.1.2.v20120308.jar;%APP_HOME%\lib\jetty-io-8.1.2.v20120308.jar

@rem Execute jetty-embedded
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %JETTY_EMBEDDED_OPTS%  -classpath "%CLASSPATH%" upsmart.jetty.Main %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable JETTY_EMBEDDED_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%JETTY_EMBEDDED_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
