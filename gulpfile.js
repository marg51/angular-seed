var gulp = require('gulp');
var concat = require('gulp-concat');
var templateCache = require('gulp-angular-templatecache');
var uglify = require('gulp-uglifyjs');
var ngAnnotate = require('gulp-ng-annotate');
var cssmin = require('gulp-cssmin');
var clean = require('gulp-clean');
var less = require('gulp-less');
var coffee = require('gulp-coffee');
var jade = require('gulp-jade');
var mainBowerFiles = require('main-bower-files');


var jsFiles = ['assets/coffee/*.coffee'];
var htmlFiles = ['assets/jade/*.jade'];
var cssFiles = ['assets/less/*.less'];

gulp.task('default', ['js','deps','templates','css']);

gulp.task('templates', function () {
    gulp.src(htmlFiles)
        .pipe(jade())
        .pipe(templateCache({root:'app/', standalone: true}))
        .pipe(concat('templates.js'))
        .pipe( gulp.dest( 'public' ) );

    gulp.src(["assets/jade/index.jade"])
        .pipe(jade())
        .pipe( gulp.dest('public') );
});

gulp.task('js', function() {
    return gulp.src(jsFiles)
    	.pipe(coffee({bare: true}).on('error', console.log))
        .pipe(concat('app.js'))
        .pipe( gulp.dest( 'public' ) );
});

gulp.task('deps', function() {
    return gulp.src(mainBowerFiles())
        .pipe(concat('deps.js'))
        .pipe( gulp.dest( 'public' ) );
});


gulp.task('css', function() {
    return gulp.src(cssFiles)
         .pipe(less())
        .pipe(concat('deps.css'))
        .pipe( gulp.dest( 'public' ) );
});
