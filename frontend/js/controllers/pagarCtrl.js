 app.controller('pagarCtrl',["$scope","servicioCookies","$location",function($scope,servicioCookies,$location){
   init();
   function  init(){
     $scope.direccion=false;
     $scope.tieneItemsAgregados=false;
   }
   $scope.cambiarDireccion = function (){
     console.log($scope.direccion);
   }
   $scope.descartarCarrito = function (){
     servicioCookies.descartarCarrito();
     $location.path("/");
   }
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
 }]);
