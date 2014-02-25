module.exports = (grunt) ->
	grunt.loadNpmTasks "grunt-karma"
	grunt.loadNpmTasks "grunt-contrib-coffee"
	grunt.loadNpmTasks "grunt-contrib-clean"
	grunt.loadNpmTasks "grunt-contrib-jade"
	grunt.loadNpmTasks "grunt-contrib-less"

	grunt.initConfig
		pkg: grunt.file.readJSON('package.json'),
		coffee:
			dev: 
				options:
					join: false
					sourceMap: true
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

		less:
			dev:
				options:
					sourceMap: true
				files:
					'./public/app.css': ['assets/less/*.less']
		clean: ['public']

		watch: 
			assets:
				files: ['assets/**/*']
				tasks: ['default']

		karma:
			unit:
				configFile: "./test/karma-unit.conf.js"
				autoWatch: false
				singleRun: true

	grunt.registerTask 'default', ['clean','coffee:dev','jade:dev','less:dev']
	grunt.registerTask 'watch', ['clean','coffee:dev','jade:dev','less:dev','watch:assets']
	grunt.registerTask 'w', ['watch']
	grunt.registerTask "test:unit", [
		"karma:unit"
	]
