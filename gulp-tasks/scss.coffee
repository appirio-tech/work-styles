module.exports = (gulp, $, configs) ->
  gulp.task 'scss', ->
    onError = ->
      red = $.util.colors.red 'SCSS error'
      $.util.beep()
      $.util.log red
      console.log arguments

    options =
      includePaths: require('../index').includePaths
      onError     : onError

    scss             = $.sass options
    src              = gulp.src configs.scssFiles
    dest             = gulp.dest configs.tempFolder
    sourceMaps       = $.sourcemaps.init()
    soureceMapsWrite = $.sourcemaps.write()
    stop             = $.plumber.stop()
    reload           = $.browserSync.reload stream: true

    src.pipe(sourceMaps).pipe(scss).pipe(soureceMapsWrite).pipe(dest).pipe reload