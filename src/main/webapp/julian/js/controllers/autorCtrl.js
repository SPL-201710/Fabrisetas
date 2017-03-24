app.controller("autorCtrl",["$scope","$routeParams","servicioAutores","servicioHome",function($scope,$routeParams,servicioAutores,servicioHome){
  init();

  function init(){
    if(typeof $routeParams.autor!='undefined')
    {
      $scope.autor="Estampas de "+$routeParams.autor;
      let autor =$routeParams.autor
      servicioAutores.traerEstampasAutor(autor).then(function(datos){
        $scope.estampasAutor=datos.data;
      })
      .catch(function(err){
        console.log(err);
      });
    }
    else
    {
      $scope.autor="Estampas organizadas según su autor";
      servicioHome.traerEstampas().then(function(datos){
  			$scope.estampasAutor = datos.data;
  		})
  		.catch(function(err){
  			console.log(err);
  		});
    }

  }

}]);
