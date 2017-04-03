app.service("servicioHome",["$http","$q","$resource",function($http,$q,$resource){
	var vm= this;
	var dirServ = "http://localhost:8080/fabricetas/";

	vm.traerEstampas = function (){
		return $resource(dirServ + "estampa");
	}
	vm.traerEstampasPorId = function (id){
		return $resource(dirServ + "estampa/:id",{id:id});
	}
	vm.traerCamisas = function (){
		return $resource(dirServ + "camiseta");
	}
	vm.traerCamisasPorId = function (id){
		return $resource(dirServ + "camiseta/:id",{id:id});
	}
	
}]);
