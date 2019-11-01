@echo off
rem  DBWatcher shell script
rem 
rem  Usage:
rem	DBWatcher -i
rem		full collecting
rem	DBWatcher 
rem		incremental collecting
rem 

rem 
rem  Argument
rem 
if ""%1"" == """" goto increment
if ""%1"" == ""-i""  goto full  

rem  DBWatcher를 실행시키기 위한 디렉토리를 지정한다.
rem 
rem 	JAVA_DIR : DBWatcher를 구동시키기 위한 JAVA가 설치되어 있는 디렉토리
rem 	PREFIX : DBWatcher가 구동되는 base 디렉토리
rem 	JAR_DIR : DBWatcher가 사용하는 각종 .jar 패키지가 저장되어 있는 디렉토리
rem 	INI_DIR : DBWatcher의 설정 파일이 저장되어 있는 디렉토리
rem 
rem  DBWatcher를 구동한다. $INI_DIR 밑에 있는 모든 .ini 파일을 읽어서
rem  DB문서 수집을 시도한다.

:increment
echo DBWatcher with -i option  
goto setenv
:full
echo DBWatcher with no option
goto setenv
:setenv
set JAVA_HOME=C:\Program Files\Java\jdk1.X.X_XX
set PREFIX=D:\diquest\DBWatcher
set JAR_DIR=%PREFIX%\lib
set INI_DIR=conf
set DB_JAR=jtds.jar
set DW_OPTION=-t 2 
echo JAVA_HOME : %JAVA_HOME%
echo PREFIX    : %PREFIX%
echo JAR_DIR   : %JAR_DIR%
echo INI_DIR   : %INI_DIR%
echo DB_JAR    : %DB_JAR%
echo DW_OPTION : %DW_OPTION%
goto execute
:execute
echo "%JAVA_HOME%/bin/java" -classpath %JAR_DIR%;%JAR_DIR%\DBWatcher.jar;%JAR_DIR%\activation.jar;%JAR_DIR%\mail.jar;%JAR_DIR%\%DB_JAR% DBWatcher %1 -p %PREFIX% %DW_OPTION% %INI_DIR%
"%JAVA_HOME%/bin/java" -classpath %JAR_DIR%;%JAR_DIR%\DBWatcher.jar;%JAR_DIR%\activation.jar;%JAR_DIR%\mail.jar;%JAR_DIR%\%DB_JAR% DBWatcher %1 -p %PREFIX% %DW_OPTION% %INI_DIR%
goto end
:end