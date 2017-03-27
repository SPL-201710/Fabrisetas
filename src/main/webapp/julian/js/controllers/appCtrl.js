 app.controller('appCtrl',["$scope","servicioCookies","$rootScope",function($scope,servicioCookies,$rootScope){
   $rootScope.$on('$routeChangeSuccess', function(e, curr, prev) {
     $scope.usuarioLogueado={};
     $scope.usuarioLogueado = servicioCookies.traerUsuarioAutenticado();
   });
   $scope.cerrarSesion= function (){
     servicioCookies.eliminarUsuarioAutenticado();
   }
 }]);
