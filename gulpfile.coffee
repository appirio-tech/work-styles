gulp          = require 'gulp'
$             = require('gulp-load-plugins')()
$.browserSync = require 'browser-sync'


configs =
  jadeFiles       : 'app/**/*.jade'
  scssFiles       : ['app/**/*.scss', 'styles/**/*.scss']
  scssIncludePaths: require('./index').includePaths
  tempFolder      : '.tmp'
  appFolder       : 'app'
  distFolder      : 'dist'

tasks = [
  'coffee'
  'jade'
  'scss'
  'clean'
  'serve'
  'build'
  'test'
  'ng-constant'
  'coveralls'
  'fixtures'
]

for task in tasks
  module = require('./node_modules/appirio-gulp-tasks/tasks/' + task)
  module gulp, $, configs

gulp.task 'default', ['clean'], ->
  gulp.start 'build'

