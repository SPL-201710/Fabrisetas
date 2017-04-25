app.controller("autorCtrl",["$scope","$routeParams","servicioAutores","servicioHome",function($scope,$routeParams,servicioAutores,servicioHome){
  init();

  function init(){
    if(typeof $routeParams.autor!='undefined')
    {
      $scope.autor=$routeParams.autor;
      let autor =$routeParams.autor;
      $scope.estampasAutor = servicioAutores.traerEstampasAutor(autor).query();
    }
    else
    {
      $scope.autor=0;
      $scope.estampasAutor = servicioHome.traerEstampas().query();
    }
    $scope.autores = servicioAutores.traerAutores().query();
  }

}]);
