app.controller("loginCtrl",["$scope","servicioHome","servicioLogin","$location","servicioCookies",function($scope,servicioHome,servicioLogin,$location,servicioCookies){
  init();
  function init (){
    $scope.noExiste=false;
  }
    $scope.iniciarSesion = function (){
      $scope.noExisteEnElSistema="animated fadeOut";
      //console.log($scope.login);
      servicioLogin.validarUsuario().save($scope.login).$promise.then((datos)=>{
        if (datos.encontrado)
        {
          servicioCookies.crearCookieUsuarioAutenticado(datos);
          $location.path("/");
        }
        else
        {
          $scope.noExiste=true;
          $scope.noExisteEnElSistema="animated wobble";
        }
      });
    }
}]);
