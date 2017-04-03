app.service("servicioLogin",["$http","$q","$resource",function($http,$q,$resource){
	var vm= this;
	var dirServ = "http://localhost:8080/fabricetas/";

	vm.crearUsuario = function (){
		return $resource("http://52.88.20.109:3000/api/usuarios");
	}
	vm.validarUsuario = function (){
		console.log("por aca paso");
		return $resource(dirServ + "user/login");
		//return $resource("http://52.88.20.109:3000/api/usuarios/login");
	}
}]);
