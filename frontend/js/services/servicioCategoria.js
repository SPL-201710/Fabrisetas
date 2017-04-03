app.service("servicioCategoria",["$http","$q","$resource",function($http,$q,$resource){
	var vm= this;
	var dirServ = "http://localhost:8080/fabricetas/";

  vm.traerEstampasCategoria = function (tema){
		return $resource(dirServ + "estampa/tema/:tema",{tema:tema});
	}

	vm.traerCategorias = function (){
		return $resource(dirServ + "tema");
	}

	vm.actualizarCategoria = function (temaId){
		return $resource(dirServ + "tema/:tema",{tema:temaId}, {update : {method : "PUT"}});
	}
	vm.crearCategoria = function (){
		return $resource(dirServ + "tema/");
	}
}]);
