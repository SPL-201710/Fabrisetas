app.controller("camisasCtrl",["$scope","servicioHome","servicioCookies","$location",function($scope,servicioHome,servicioCookies,$location){
  init();

  $scope.volverASeleccion = function (){
    servicioCookies.eliminarEstampaSeleccionada();
    $location.path("/");
  }
  function init(){
    $scope.estampaSeleccionada = [];
      $scope.estampaSeleccionada = servicioCookies.traerEstampaSeleccionada();
      $scope.listaCamisas = servicioHome.traerCamisas().query();
      console.log($scope.estampaSeleccionada);
  }
}]);
