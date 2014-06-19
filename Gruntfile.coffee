module.exports = (grunt) ->
	grunt.loadNpmTasks "grunt-karma"
	grunt.loadNpmTasks "grunt-contrib-coffee"
	grunt.loadNpmTasks "grunt-contrib-clean"
	grunt.loadNpmTasks "grunt-contrib-jade"
	grunt.loadNpmTasks "grunt-contrib-less"
	grunt.loadNpmTasks "grunt-contrib-concat"
	grunt.loadNpmTasks "grunt-contrib-uglify"
	grunt.loadNpmTasks "grunt-ng-annotate"
	grunt.loadNpmTasks "grunt-html2js"

	grunt.initConfig
		pkg: grunt.file.readJSON('package.json'),
		coffee:
			dev: 
				options:
					join: false
					sourceMap: true
				files:
					'./public/app.js': ['assets/coffee/*.coffee']
			prod: 
				files:
					'./public/app.js': ['assets/coffee/*.coffee']
		jade: 
			dev: 
				options: 
					pretty: true
				files: [{
					expand: true,
					cwd: 'assets/jade/'
					src: ['*.jade']
					dest: 'public/'
					ext: '.html'
				}]
			prod: 
				files: [{
					expand: true,
					cwd: 'assets/jade/'
					src: ['*.jade']
					dest: 'public/'
					ext: '.html'
				}]

		less:
			dev:
				options:
					sourceMap: true
				files:
					'./public/app.css': ['assets/less/*.less']
			prod:
				options:
					cleancss: true
				files:
					'./public/app.css': ['assets/less/*.less']

		clean: ['public']

		concat:
			prod:
				options:
					separator: ";"

				dest: "public/deps.js"
				src: [
					"bower_components/angular/angular.js"
					"bower_components/angular-animate/angular-animate.min.js"
					"bower_components/angular-ui-router/release/angular-ui-router.min.js"
					"bower_components/lodash/dist/lodash.min.js"
				]

		uglify:
			banner: "/* ©Laurent Margirier */"
			prod:
				files: [
					{
						dest: "public/app.js"
						src: ["public/app.js"]
					}
				]
		html2js:
			options:
				base: "../pounda/public"

			prod:

				src: ["public/*.html"]
				dest: "public/templates.js"

		ngAnnotate:
			prod:
				src: ["public/app.js"]
				dest: "public/app.js"

		watch: 
			assets:
				files: ['assets/**/*']
				tasks: ['default']

		karma:
			unit:
				configFile: "./test/karma-unit.conf.js"
				autoWatch: false
				singleRun: true

	grunt.registerTask 'default', ['clean','concat:prod','coffee:dev','jade:dev','less:dev','html2js:prod',]
	grunt.registerTask 'prod', ['clean','concat:prod','coffee:prod','jade:prod','less:prod','html2js:prod','ngAnnotate:prod']
	
	grunt.registerTask 'watch', ['default','watch:assets']
	grunt.registerTask 'w', ['watch']
	grunt.registerTask "test:unit", [
		"karma:unit"
	]
