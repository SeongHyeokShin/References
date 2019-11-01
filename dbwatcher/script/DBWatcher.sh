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
# DBWatcher�� �����Ű�� ���� ���丮�� �����Ѵ�.
#
#	JAVA_DIR : DBWatcher�� ������Ű�� ���� JAVA�� ��ġ�Ǿ� �ִ� ���丮
#	PREFIX : DBWatcher�� �����Ǵ� base ���丮
#	JAR_DIR : DBWatcher�� ����ϴ� ���� .jar ��Ű���� ����Ǿ� �ִ� ���丮
#	INI_DIR : DBWatcher�� ���� ������ ����Ǿ� �ִ� ���丮
#
JAVA_HOME=/usr/local/java
PREFIX=/home/diquest/DBWatcher
JAR_DIR=lib
INI_DIR=conf
DB_JAR=jtds.jar
DW_OPTION=-t 2
#
# DBWatcher�� �����Ѵ�. $INI_DIR �ؿ� �ִ� ��� .ini ������ �о
# DB���� ������ �õ��Ѵ�.
#
$JAVA_HOME/bin/java -cp $JAR_DIR:$JAR_DIR/DBWatcher.jar:$JAR_DIR/activation.jar:$JAR_DIR/mail.jar:$JAR_DIR/$DB_JAR com.diquest.dbwatcher.DbWatcher $ARG -p $PREFIX $DW_OPTION $INI_DIR