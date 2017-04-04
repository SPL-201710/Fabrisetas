app.service("servicioCamiseta",["$http","$q","$resource",function($http,$q,$resource){
	var vm= this;
	//var dirServ = "http://localhost:8080/fabricetas/";
	var dirServ = "http://52.88.20.109:8080/fabricetas/";

	vm.traerCamisas = function (){
		return $resource(dirServ + "camiseta");
		//return $resource("http://52.88.20.109:3000/api/camisas");
	}
	vm.traerCamisasPorId = function (id){
		return $resource(dirServ + "camiseta/:id",{id:id});
		//return $resource("http://52.88.20.109:3000/api/camisas/:id",{id:id});
	}
	vm.actualizarCamiseta = function (camisetaId){
		return $resource(dirServ + "camiseta/:id",{id:camisetaId}, {update : {method : "PUT"}});
	}
	vm.crearCamiseta = function (){
		return $resource(dirServ + "camiseta");
		//return $resource("http://localhost:8080/fabricetas/tema/");
	}

}]);
