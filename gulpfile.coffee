configs =
  __dirname : __dirname

configs.scss =
  includePaths: require('./index').includePaths

### END CONFIG ###
loadTasksModule = require __dirname + '/node_modules/appirio-gulp-tasks/load-tasks.coffee'

loadTasksModule.loadTasks configs
