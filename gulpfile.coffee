gulp          = require 'gulp'
$             = require('gulp-load-plugins')()
$.browserSync = require 'browser-sync'
$.karma = require('karma').server


karmaFiles = ['index.js']

configs =
  jadeFiles     : 'app/**/*.jade'
  scssFiles     : 'app/**/*.scss'
  appFolder     : 'app'
  tempFolder    : '.tmp'
  karmaFiles    : karmaFiles
  karmaConfig   : __dirname + '/karma.conf.coffee'
  coverageReporter:
    type: 'lcov'
    dir: 'coverage'

tasks = [
  'jade'
  'scss'
  'clean'
  'serve'
]

for task in tasks
  module = require('./gulp-tasks/' + task)
  module gulp, $, configs

gulp.task 'default', ['clean'], ->
  gulp.start 'build'

