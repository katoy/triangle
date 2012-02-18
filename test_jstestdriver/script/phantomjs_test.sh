#!/bin/sh
URL=file://$PWD/tests/qunit.html
phantomjs tests/run_qunit.js $URL
