 app.controller('artistaCtrl',["$scope","servicioAutores","servicioCookies",function($scope,servicioAutores,servicioCookies){
   init();
   function init(){
     if(servicioCookies.validarSiEstaAutenticado()){
       $scope.artista = servicioCookies.traerUsuarioAutenticado();
       console.log($scope.artista);
        servicioAutores.traerEstampasAutorNode($scope.artista.nombre).query().$promise.then((datos)=>{
          console.log(datos);
          $scope.estampasArtista = datos;
        });
     }
   }
 }]);
