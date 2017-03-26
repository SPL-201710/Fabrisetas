app.service("servicioCategoria",["$http","$q","$resource",function($http,$q,$resource){
	var vm= this;

  vm.traerEstampasCategoria = function (tema){
		return $resource("http://52.88.20.109:3000/api/estampas/tema/:tema",{tema : tema});
	}

}]);
