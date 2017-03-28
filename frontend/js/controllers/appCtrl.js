 app.controller('appCtrl',["$scope","servicioCookies","$rootScope","$location",function($scope,servicioCookies,$rootScope,$location){
   $rootScope.$on('$routeChangeSuccess', function(e, curr, prev) {
     $scope.usuarioLogueado={};
     $scope.usuarioLogueado = servicioCookies.traerUsuarioAutenticado();
     if (typeof $scope.usuarioLogueado !=='undefined') {
        $scope.artista  = $scope.usuarioLogueado.tipo;
     }
   });
   $scope.cerrarSesion= function (){
     servicioCookies.eliminarUsuarioAutenticado();
     $location.path("/");
   }
 }]);
