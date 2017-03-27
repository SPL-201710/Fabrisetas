app.service("servicioLogin",["$http","$q","$resource",function($http,$q,$resource){
	var vm= this;

	vm.crearUsuario = function (){
		return $resource("http://52.88.20.109:3000/api/usuarios");
	}
	vm.validarUsuario = function (){
		return $resource("http://52.88.20.109:3000/api/usuarios/login");
	}
}]);
