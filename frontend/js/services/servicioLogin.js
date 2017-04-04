app.service("servicioLogin",["$http","$q","$resource",function($http,$q,$resource){
	var vm= this;
	//var dirServ = "http://52.88.20.109:8080/fabricetas/";
	var dirServ = "http://localhost:8080/fabricetas/";

	vm.crearUsuario = function (){
    return $resource(dirServ+"user");
  }

	vm.validarUsuario = function (){
		console.log("por aca paso");
		return $resource(dirServ + "user/login");
		//return $resource("http://52.88.20.109:3000/api/usuarios/login");
	}
}]);
