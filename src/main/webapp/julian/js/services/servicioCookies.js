app.service('servicioCookies',["$http","$q","$resource",function($cookies){

  var vm= this;
	vm.crearCookieEstampaSeleccionada = function (estampaSeleccionada){
		$cookies.estampaSeleccionada = estampaSeleccionada;
	}
  vm.traerEstampaSeleccionada = function (){
    return $cookies.estampaSeleccionada;
  }
  vm.eliminarEstampaSeleccionada = function (){
    delete $cookies["estampaSeleccionada"];
  }
}]);
