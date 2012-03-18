#!/bin/sh

CWD=`pwd`

JSTESTDRIVER_BIN=${CWD}/bin/JsTestDriver-1.3.3d.jar
JSTESTDRIVER_CONF=${CWD}/conf/jsTestDriver.conf

SAFARI=script/safari
FIREFOX=script/firefox
CHROME=script/chrome
OPERA=script/opera

if [ $# = 0 ];then
  echo "usage)  jstestdriver.sh [1|0]"
  echo "         0: run chrome"
  echo "         1: run safari, firefox, chrome, opera"
  exit
else
  if [ $1 = 0 ];then
      BROWSERS=${CHROME}
  else
      BROWSERS=${SAFARI},${FIREFOX},${CHROME},${OPERA}
  fi
fi
echo "--------  running -------"
echo $BROWSERS

(java -jar ${JSTESTDRIVER_BIN} \
    --port 4224 \
    --config ${JSTESTDRIVER_CONF} \
    --browser  ${BROWSERS} \
    --tests all \
    --verbose \
    --captureConsole \
    --testOutput report
    )


echo "After test, do 'genhtml -o html report/jsTestDriver.conf-coverage.dat'"

