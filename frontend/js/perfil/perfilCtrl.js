var perfil = angular.module("perfil",[]);

perfil.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/perfil', {
    templateUrl: 'js/perfil/perfil.html',
    controller: 'perfilCtrl'
  });
}])

perfil.controller("perfilCtrl",["$scope","servicioCookies",function($scope,servicioCookies){
  init();

  function init(){
    $scope.datosUsuario = servicioCookies.traerUsuarioAutenticado();
  }
}]);
