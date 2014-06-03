app = angular.module 'app',[
	# 'ui.router'
])

# app.config ($stateProvider, $urlRouterProvider) ->
# 	$stateProvider.state("home",
# 		url: "/home"
# 		templateUrl: "tmpl-home.html"
# 		controller: "HomeCtrl"
# 		resolve:
# 			home: ($http) ->
# 				$http.get('../data.json')

# 	).state("home.sub",
# 		url: "/sub/:sub"
# 		templateUrl: "tmpl-home-sub.html"
# 		controller: 'HomeSubCtrl'
# 	)

# 	$urlRouterProvider.otherwise "/home"