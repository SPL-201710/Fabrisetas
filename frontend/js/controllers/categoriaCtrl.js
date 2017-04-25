app.controller("categoriaCtrl", ["$scope", "$routeParams", "servicioCategoria", "servicioHome", function($scope, $routeParams, servicioCategoria, servicioHome){
	console.log($routeParams);
	init();
	  function init(){
	    if(typeof $routeParams.id != 'undefined'){

				$scope.titulo=$routeParams.id;
	      let id =$routeParams.id
				$scope.estampasTema = servicioCategoria.traerEstampasCategoria(id).query();
	    }
	    else{

				$scope.titulo=0;
				//$scope.titulo="Estampas organizadas según su tema";
				$scope.estampasTema = servicioHome.traerEstampas().query();
	    }
			$scope.temas = servicioCategoria.traerCategorias().query();
	  }
}]);
