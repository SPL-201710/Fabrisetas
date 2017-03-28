app.service("servicioHome",["$http","$q","$resource",function($http,$q,$resource){
	var vm= this;
	vm.traerEstampas = function (){
		return $resource("http://52.88.20.109:3000/api/estampas");
	}
	vm.traerEstampasPorId = function (id){
		return $resource("http://52.88.20.109:3000/api/estampas/:id",{id:id});
	}
	vm.traerCamisas = function (){
		return $resource("http://52.88.20.109:3000/api/camisas");
	}
	vm.traerCamisasPorId = function (id){
		return $resource("http://52.88.20.109:3000/api/camisas/:id",{id:id});
	}
}]);
