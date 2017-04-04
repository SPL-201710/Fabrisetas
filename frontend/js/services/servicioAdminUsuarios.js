app.service("servicioAdminUsuarios",["$http","$q","$resource",function($http,$q,$resource){
	var vm= this;
	//var dirServ = "http://52.88.20.109:8080/fabricetas/";
	var dirServ = "http://localhost:8080/fabricetas/";

  vm.traerUsuarios = function (){
    return $resource(dirServ+"user");
  }

  vm.actualizarUsuario = function (userId){
    return $resource(dirServ+"user/:id",{id:userId}, {update : {method : "PUT"}});
  }

  vm.crearUsuario = function (){
    return $resource(dirServ+"user");
  }

  vm.eliminarUsuario = function (userId){
    return $resource(dirServ+"user/:id",{id:userId})
  }
}]);
