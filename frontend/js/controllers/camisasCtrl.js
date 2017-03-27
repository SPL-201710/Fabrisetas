app.controller("camisasCtrl",["$scope","servicioHome","servicioCookies","$location",function($scope,servicioHome,servicioCookies,$location){
  init();

$scope.verDetalleCamiseta = function (camisa_id){
  let camisetaSeleccionada = $scope.listaCamisas.filter(function(element){
      return element._id ===camisa_id;
  });
  servicioCookies.crearCookieCamisetaSeleccionada(camisetaSeleccionada[0]);
  $location.path("ver-camisa/"+camisetaSeleccionada[0]._id);
}

//Elimina la cookie donde se almacena la camiseta seleccionada
  $scope.volverASeleccion = function (){
    servicioCookies.eliminarEstampaSeleccionada();
    $location.path("/");
  }

  // carga los datos iniciales de la vista
  function init(){
    $scope.estampaSeleccionada = [];
      $scope.estampaSeleccionada = servicioCookies.traerEstampaSeleccionada();
      $scope.listaCamisas = servicioHome.traerCamisas().query();
  }
}]);
