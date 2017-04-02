 app.controller('appCtrl',["$scope","servicioCookies","$rootScope","$location",function($scope,servicioCookies,$rootScope,$location){
   $rootScope.$on('$routeChangeSuccess', function(e, curr, prev) {
     $scope.usuarioLogueado={};
     $scope.usuarioLogueado = servicioCookies.traerUsuarioAutenticado();
     if(servicioCookies.validarSiEstaAutenticado())
     {
       $scope.valorCarrito = servicioCookies.valorCarrito();
       $scope.carrito = servicioCookies.retornarCarrito();
       if (typeof $scope.carrito=='undefined') {
          $scope.vistaRapidaCarrito = null;
       }
       else
       {
         let tam = $scope.carrito.length;
         $scope.vistaRapidaCarrito = $scope.carrito[tam-1];
         console.log($scope.vistaRapidaCarrito);
         $scope.artista  = $scope.usuarioLogueado.tipo;
       }

     }
     else
     {
   			servicioCookies.inicializarCarrito();
     }

   });
   $scope.cerrarSesion= function (){
     servicioCookies.eliminarUsuarioAutenticado();
     $location.path("/");
   }
 }]);
