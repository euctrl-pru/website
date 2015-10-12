#! /usr/bin/env node
var shell = require('shelljs');

shell.cd('_site');
shell.exec("git push origin HEAD:master --force");
