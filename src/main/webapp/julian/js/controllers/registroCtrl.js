app.controller("registroCtrl",["$scope","servicioHome","servicioLogin",function($scope,servicioHome,servicioLogin){
  init();
  function init(){
  }
  $scope.crearUsuario = function (){
    $scope.usuarioNuevo.direccion=[];
    $scope.usuarioNuevo.login = [];
    $scope.mensajeCreacion=false;
    $scope.usuarioNuevo.direccion.push($scope.direccion);
    $scope.usuarioNuevo.login.push($scope.login);
    servicioLogin.crearUsuario().save($scope.usuarioNuevo).$promise.then(function(){
      $scope.usuarioNuevo=[];
      $scope.direccion=[];
      $scope.login=[];
      $scope.mensajeCreacion=true;
      $scope.mostrarMensajeCreacion = "animated fadeIn";
    });

  }
}]);
