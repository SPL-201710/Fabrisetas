 app.controller('artistaCtrl',["$scope","servicioAutores","servicioCookies","$timeout",function($scope,servicioAutores,servicioCookies,$timeout){
   init();


   function init(){
     $scope.thumbnail = {};
     $scope.botonCancelar = false;
     $scope.accionEstampa="Guardar estampa";
     if(servicioCookies.validarSiEstaAutenticado()){
       $scope.artista = servicioCookies.traerUsuarioAutenticado();
       console.log($scope.artista);
        servicioAutores.traerEstampasAutorNode($scope.artista.nombre).query().$promise.then((datos)=>{
          console.log(datos);
          $scope.estampasArtista = datos;
          angular.forEach($scope.estampasArtista,function(valor,llave){
            valor.indice=llave;
          });
        });
        if(servicioCookies.validarSiEstaAutenticado())
        {
            $scope.autor = servicioCookies.traerUsuarioAutenticado();
        }
     }
   }

   $scope.editarEstampa = function (indice){
     $scope.accionEstampa ="Actualizar estampa";
     $scope.botonCancelar = true;
     $scope.estampaNueva = $scope.estampasArtista[indice];
     $scope.thumbnail.dataUrl = $scope.estampasArtista[indice].urlimagen;
   }

   $scope.cancelar = function (){
     $scope.accionEstampa="Guardar estampa";
     $scope.botonCancelar = false;
     $scope.estampaNueva =[];
   }

   $scope.fileReaderSupported = window.FileReader != null;
   $scope.photoChanged = function(files){
     if (files != null) {
           var file = files[0];
       if ($scope.fileReaderSupported && file.type.indexOf('image') > -1)
       {
           $timeout(function() {
               var fileReader = new FileReader();
               fileReader.readAsDataURL(file);
               fileReader.onload = function(e) {
                   $timeout(function(){
                     // base64 para usar en el hmtl
                      $scope.thumbnail.dataUrl = e.target.result;
                   });
               }
           });
       }
     }
   };

   $scope.cargarImagen = function (){
     if ($scope.accionEstampa=="Actualizar estampa")
     {
       //falta poner servicios
     }
     else
     {
       var name = $scope.name;
       var file = $scope.file;
       console.log(file);
       /*servicioAutores.cargarNuevaEstampa(file,name,$scope.estampaNueva).then(function(datos){
         console.log(datos);
       })
       .catch(function(err){
         console.log(err);
       });*/
     }
   }
 }]);
