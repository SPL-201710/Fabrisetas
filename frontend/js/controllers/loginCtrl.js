app.controller("loginCtrl",["$scope","servicioHome","servicioLogin","$location","servicioCookies","$routeParams",function($scope,servicioHome,servicioLogin,$location,servicioCookies,$routeParams){
  init();
  function init (){
    $scope.noExiste=false;
  }
    $scope.iniciarSesion = function (){
      $scope.noExisteEnElSistema="animated fadeOut";
      //console.log($scope.login);
      $scope.login.userId = 0;
      $scope.login.identificationType = "CC";
      $scope.login.identificationNumber = "171321632";
      $scope.login.tipo = "";
      $scope.login.ssoId = "",
      $scope.login.firstName = "";
      $scope.login.lastName = "";
      $scope.login.email = "";
      servicioLogin.validarUsuario().save($scope.login).$promise.then((datos)=>{
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

      })
      .catch(function(err) {
          $scope.noExiste=true;
          $scope.noExisteEnElSistema="animated wobble";
      });
    }
}]);
