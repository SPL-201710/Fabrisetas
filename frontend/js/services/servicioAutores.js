app.service("servicioAutores",["$http","$q","$resource",function($http,$q,$resource){
	var vm= this;

	vm.traerEstampasAutor = function (autor){
		return $resource("http://52.88.20.109:8080/fabricetas/estampa/autor/:id",{id:autor});
		//return $resource("http://52.88.20.109:3000/api/estampas/autor/:id",{id:autor});
	}

	vm.traerEstampasAutorNode = function (autor){
		return $resource("http://52.88.20.109:3000/api/estampas/autor/:id",{id:autor});
		//return $resource("http://52.88.20.109:3000/api/estampas/autor/:id",{id:autor});
	}

	vm.traerAutores = function (autor){
		return $resource("http://52.88.20.109:8080/fabricetas/user/artistas");
	}

}]);
