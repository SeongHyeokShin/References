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

rem  DBWatcher�� �����Ű�� ���� ���丮�� �����Ѵ�.
rem 
rem 	JAVA_DIR : DBWatcher�� ������Ű�� ���� JAVA�� ��ġ�Ǿ� �ִ� ���丮
rem 	PREFIX : DBWatcher�� �����Ǵ� base ���丮
rem 	JAR_DIR : DBWatcher�� ����ϴ� ���� .jar ��Ű���� ����Ǿ� �ִ� ���丮
rem 	INI_DIR : DBWatcher�� ���� ������ ����Ǿ� �ִ� ���丮
rem 
rem  DBWatcher�� �����Ѵ�. $INI_DIR �ؿ� �ִ� ��� .ini ������ �о
rem  DB���� ������ �õ��Ѵ�.

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