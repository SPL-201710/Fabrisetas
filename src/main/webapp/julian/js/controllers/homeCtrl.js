app.controller("homeCtrl",["$scope","servicioHome",function($scope,servicioHome){
	init();

	function init(){
		$scope.populares= servicioHome.traerEstampas().query();
	}
}]);
