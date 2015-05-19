module.exports = (gulp, $, configs) ->
  depedencies = ['scss', 'jade']

  gulp.task 'serve', depedencies, ->
    options =
      notify: false
      port: 9000
      server:
        baseDir: [configs.tempFolder, configs.appFolder]
        routes:
          '/bower_components': 'bower_components'

    $.browserSync options

    watchFiles = [
      configs.jadeFiles
      configs.scssFiles
    ]

    gulp.watch(watchFiles).on 'change', $.browserSync.reload

    gulp.watch configs.scssFiles, ['scss']
    gulp.watch configs.jadeFiles, ['jade']
