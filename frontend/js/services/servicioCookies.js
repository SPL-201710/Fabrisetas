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

  //cookies de usuario autenticado
  vm.crearCookieUsuarioAutenticado = function (usuario){
    $cookies.usuarioAutenticado = usuario;
  }
  vm.traerUsuarioAutenticado = function (){
    return $cookies.usuarioAutenticado;
  }
  vm.eliminarUsuarioAutenticado = function (){
    delete $cookies["usuarioAutenticado"];
  }
  vm.validarSiEstaAutenticado = function(){
    if (typeof $cookies.usuarioAutenticado=='undefined')
    {
      return false;
    }
    else
    {
        return true;
    }
  }

  //carrito de compras!
  vm.inicializarCarrito = function (){
    $cookies.carrito = new Array();
    $cookies.total = 0;
  }
  vm.aregarAlCarrito = function (camiseta,estampa,total, urlResultado){
    $cookies.total = $cookies.total+total;
    var configuracion = new Array();
    configuracion.push(camiseta);
    configuracion.push(estampa);
    configuracion.push(urlResultado);
    $cookies.carrito.push(configuracion);
    console.log($cookies.carrito);
  }
  vm.valorCarrito = function (){
    return $cookies.total;
  }
  vm.retornarCarrito = function (){
    return $cookies.carrito;
  }
  vm.descartarCarrito = function (){
    delete $cookies["total"];
    delete $cookies["carrito"];
  }


}]);
