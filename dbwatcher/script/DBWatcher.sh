#! /bin/sh

#
# DBWatcher shell script
#
# Usage:
#	DBWatcher -i
#		full collecting
#	DBWatcher 
#		incremental collecting
#

#
# Argument
#
ARG=$1
if [ x"$ARG" != x ]; then
	if [ $ARG != "-i" ]; then
		echo "usage : DBWatcher [-i]"
		exit 1
	fi
fi

#
# for Locale dependent JDBC drivers
#
#LANG=
#export LANG

#
# for Oracle Database OCI(type-2)
#
#LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib
#export LD_LIBRARY_PATH


#
# DBWatcher를 실행시키기 위한 디렉토리를 지정한다.
#
#	JAVA_DIR : DBWatcher를 구동시키기 위한 JAVA가 설치되어 있는 디렉토리
#	PREFIX : DBWatcher가 구동되는 base 디렉토리
#	JAR_DIR : DBWatcher가 사용하는 각종 .jar 패키지가 저장되어 있는 디렉토리
#	INI_DIR : DBWatcher의 설정 파일이 저장되어 있는 디렉토리
#
JAVA_HOME=/usr/local/java
PREFIX=/home/diquest/DBWatcher
JAR_DIR=lib
INI_DIR=conf
DB_JAR=jtds.jar
DW_OPTION=-t 2
#
# DBWatcher를 구동한다. $INI_DIR 밑에 있는 모든 .ini 파일을 읽어서
# DB문서 수집을 시도한다.
#
$JAVA_HOME/bin/java -cp $JAR_DIR:$JAR_DIR/DBWatcher.jar:$JAR_DIR/activation.jar:$JAR_DIR/mail.jar:$JAR_DIR/$DB_JAR com.diquest.dbwatcher.DbWatcher $ARG -p $PREFIX $DW_OPTION $INI_DIR