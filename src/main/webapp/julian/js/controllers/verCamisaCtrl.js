app.controller("verCamisaCtrl",["$scope","servicioHome","$location","$routeParams","servicioCookies",function($scope,servicioHome,$location,$routeParams,servicioCookies){
  init();
  function init(){
    let id = $routeParams.id;
    $scope.total;
    $scope.estampaSeleccionada = servicioCookies.traerEstampaSeleccionada();
    servicioHome.traerCamisasPorId(id).get().$promise.then(function (result) {
      console.log(result);
      $scope.camisetaSeleccionada = result;
      $scope.total = parseInt($scope.camisetaSeleccionada.valor) + parseInt($scope.estampaSeleccionada.valor);
      console.log($scope.total);
    });
  }
  $scope.descartar = function (){
    servicioCookies.eliminarCamisetaSeleccionada();
    servicioCookies.eliminarEstampaSeleccionada();
    $location.path('/');
  }
  $location.path('/');
}]);
