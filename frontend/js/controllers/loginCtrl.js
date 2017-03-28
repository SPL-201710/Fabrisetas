app.controller("loginCtrl",["$scope","servicioHome","servicioLogin","$location","servicioCookies","$routeParams",function($scope,servicioHome,servicioLogin,$location,servicioCookies,$routeParams){
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
          if(typeof $routeParams.id=='undefined')
          {
            servicioCookies.crearCookieUsuarioAutenticado(datos);
            $location.path("/");
          }
          else
          {
            servicioCookies.crearCookieUsuarioAutenticado(datos);
            $location.path("/ver-camisa/"+$routeParams.id);
          }
        }
        else
        {
          $scope.noExiste=true;
          $scope.noExisteEnElSistema="animated wobble";
        }
      });
    }
}]);
