app.controller("verEstampaCtrl",["$scope","servicioHome","$routeParams",function($scope,servicioHome,$routeParams){
  init();
  function init (){
    let id = $routeParams.id;
    servicioHome.traerEstampasPorId(id).then(function(datos){
      $scope.estampa = datos.data;
      console.log($scope.estampa);
    })
    .catch(function(err){
      console.log(err);
    });
  }
}]);
