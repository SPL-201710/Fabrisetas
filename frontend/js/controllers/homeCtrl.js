app.controller("homeCtrl",["$scope","servicioHome", "servicioCategoria","servicioCookies",function($scope, servicioHome, servicioCategoria,servicioCookies){
	init();

	function init(){
		$scope.populares= servicioHome.traerEstampas().query();
		$scope.temas= servicioCategoria.traerCategorias().query();
		servicioCookies.inicializarCarrito();
	}
}]);
