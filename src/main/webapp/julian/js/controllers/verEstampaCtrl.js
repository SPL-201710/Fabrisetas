app.controller("verEstampaCtrl",["$scope","servicioHome","$routeParams","servicioCookies","$location",function($scope,servicioHome,$routeParams,servicioCookies,$location){
  init();
  function init (){
    let id = $routeParams.id;
    $scope.estampa = servicioHome.traerEstampasPorId(id).get();
  }
  $scope.irSeleccionCamisa = function (){
    servicioCookies.crearCookieEstampaSeleccionada($scope.estampa);
    $location.path("/camisas");
  }
}]);
