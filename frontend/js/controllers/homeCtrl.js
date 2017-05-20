app.controller("homeCtrl",["$scope","servicioHome", "servicioCategoria","servicioCookies",function($scope, servicioHome, servicioCategoria,servicioCookies){
	init();

	function init(){
		console.log("Entro");
		$scope.populares= servicioHome.traerEstampas().query();
		$scope.temas= servicioCategoria.traerCategorias().query();
		console.log("Salio");
		console.log($scope.temas);
		/*
		ejemplo de put
		var data = {
		 'id': '5',
		 "title":"camisaActualizada"
		};
		servicioHome.actualizarAlgo().update(data);*/
	}
}]);
