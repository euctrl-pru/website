#! /usr/bin/env node
var shell = require('shelljs');
var dateTime = require('date-time');

shell.cd("_site");
shell.exec('git add -A . && git commit -a -m "site updated at ' + dateTime() + '"');
