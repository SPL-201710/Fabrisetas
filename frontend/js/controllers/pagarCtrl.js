 app.controller('pagarCtrl',["$scope","servicioCookies","$location","$timeout",function($scope,servicioCookies,$location,$timeout){
   init();
   function  init(){
     $scope.direccion=false;
     $scope.compraRealizada = false;
     $scope.tieneItemsAgregados=false;
     if(servicioCookies.validarSiEstaAutenticado())
     {
       $scope.tieneItemsAgregados = true;
       $scope.datosUsuario = servicioCookies.traerUsuarioAutenticado();
       $scope.carrito = servicioCookies.retornarCarrito();
       $scope.total = servicioCookies.valorCarrito();
       $scope.datosUsuario.direccion="Av 102 # 10 - 12";
       console.log($scope.datosUsuario);
     }
     else
     {
       $scope.tieneItemsAgregados=false;
     }
   }
   $scope.cambiarDireccion = function (){
     console.log($scope.direccion);
   }
   $scope.descartarCarrito = function (){
     servicioCookies.descartarCarrito();
     $location.path("/");
   }
   $scope.registrarFactura = function (){
     $scope.compraRealizada = true;
     $timeout(function(){
       $('#myModal').modal('hide');
     },2500);
   }
   $scope.volverInicio = function (){
     servicioCookies.inicializarCarrito();
     $location.path("/");
   }
   $scope.seguirComprando = function (){     
     $location.path("/");
   }
 }]);
