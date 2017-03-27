app.controller("homeCtrl",["$scope","servicioHome", "servicioCategoria",function($scope, servicioHome, servicioCategoria){
	init();

	function init(){
		$scope.populares= servicioHome.traerEstampas().query();
		$scope.temas= servicioCategoria.traerCategorias().query();
	}
}]);
