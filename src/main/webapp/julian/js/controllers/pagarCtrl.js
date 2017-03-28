 app.controller('pagarCtrl',["$scope","servicioCookies","$location",function($scope,servicioCookies,$location){
   init();
   function  init(){
     $scope.direccion=false;
   }
   $scope.cambiarDireccion = function (){
     console.log($scope.direccion);
   }
   if(!servicioCookies.validarSiEstaAutenticado())
   {
      //$location.path("/");
   }
   else
   {
     $scope.datosUsuario = servicioCookies.traerUsuarioAutenticado();
     $scope.estampaSeleccionada = servicioCookies.traerEstampaSeleccionada();
     $scope.camisetaSeleccionada = servicioCookies.traerCamisetaSeleccionada();
     $scope.total =parseInt($scope.estampaSeleccionada.valor)+parseInt($scope.camisetaSeleccionada.valor);
     $scope.datosUsuario.direccion="Av 102 # 10 - 12";
     console.log($scope.datosUsuario);
   }
 }]);
