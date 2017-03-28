app.controller("verEstampaCtrl",["$scope","servicioHome","$routeParams","servicioCookies","$location","servicioCategoria",function($scope,servicioHome,$routeParams,servicioCookies,$location, servicioCategoria){
  init();
  function init (){
    let id = $routeParams.id;
    $scope.estampa = servicioHome.traerEstampasPorId(id).get();
    $scope.temas = servicioCategoria.traerCategorias().query();
  }
  $scope.irSeleccionCamisa = function (){
    servicioCookies.crearCookieEstampaSeleccionada($scope.estampa);
    $location.path("/camisas");
  }
}]);
