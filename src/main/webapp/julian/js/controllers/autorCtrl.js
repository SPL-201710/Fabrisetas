app.controller("autorCtrl",["$scope","$routeParams","servicioAutores","servicioHome",function($scope,$routeParams,servicioAutores,servicioHome){
  init();

  function init(){
    if(typeof $routeParams.autor!='undefined')
    {
      $scope.autor="Estampas de "+$routeParams.autor;
      let autor =$routeParams.autor;
      $scope.estampasAutor = servicioAutores.traerEstampasAutor(autor).query();
    }
    else
    {
      $scope.autor="Estampas organizadas según su autor";
      $scope.estampasAutor = servicioHome.traerEstampas().query();
    }

  }

}]);
