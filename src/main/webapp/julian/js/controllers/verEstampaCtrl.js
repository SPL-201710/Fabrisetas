app.controller("verEstampaCtrl",["$scope","servicioHome","$routeParams",function($scope,servicioHome,$routeParams){
  init();
  function init (){
    let id = $routeParams.id;
    $scope.estampa = servicioHome.traerEstampasPorId(id).get();
  }
}]);
