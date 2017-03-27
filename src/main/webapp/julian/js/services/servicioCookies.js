app.service('servicioCookies',["$http","$q","$resource",function($cookies){

  var vm= this;

  // almacenamiento temporal de la estampa
	vm.crearCookieEstampaSeleccionada = function (estampaSeleccionada){
		$cookies.estampaSeleccionada = estampaSeleccionada;
	}
  vm.traerEstampaSeleccionada = function (){
    return $cookies.estampaSeleccionada;
  }
  vm.eliminarEstampaSeleccionada = function (){
    delete $cookies["estampaSeleccionada"];
  }

  // almacenamiento temporal de la camiseta
  vm.crearCookieCamisetaSeleccionada = function (camisetaSeleccionada){
		$cookies.camisetaSeleccionada = camisetaSeleccionada;
	}
  vm.traerCamisetaSeleccionada = function (){
    return $cookies.camisetaSeleccionada;
  }
  vm.eliminarCamisetaSeleccionada = function (){
    delete $cookies["camisetaSeleccionada"];
  }

}]);
