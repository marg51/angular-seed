app = angular.module 'app'

app.controller 'MainCtrl', ($scope) ->
	$scope.value = "binding"

app.controller "HomeCtrl", ($scope, home) ->
	$scope.data = home

app.controller "HomeSubCtrl", ($scope, $stateParams) ->
	$scope.sub = $stateParams.sub
