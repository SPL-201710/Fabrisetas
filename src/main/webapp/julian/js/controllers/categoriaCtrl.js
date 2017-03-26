app.controller("categoriaCtrl", ["$scope", "$routeParams", "servicioCategoria", "servicioHome", function($scope, $routeParams, servicioCategoria, servicioHome){
	console.log($routeParams);
	init();
	  function init(){
	    if(typeof $routeParams.id != 'undefined'){

				$scope.autor="Estampas de "+$routeParams.id;
	      let id =$routeParams.id
				$scope.estampasTema = servicioCategoria.traerEstampasCategoria(id).query();
	    }
	    else{

				$scope.autor="Estampas organizadas según su tema";
				$scope.estampasAutor = servicioHome.traerEstampas().query();
	    }
	  }
}]);
