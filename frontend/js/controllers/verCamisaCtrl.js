app.controller("verCamisaCtrl",["$scope","servicioHome","$location","$routeParams","servicioCookies",function($scope,servicioHome,$location,$routeParams,servicioCookies){
  init();
  function init(){
    let id = $routeParams.id;
    $scope.total;
    $scope.talla='Sin seleccionar';
    $scope.color='Sin seleccionar';
    $scope.estampaSeleccionada = servicioCookies.traerEstampaSeleccionada();
    servicioHome.traerCamisasPorId(id).get().$promise.then(function (result) {
      console.log(result);
      $scope.camisetaSeleccionada = result;
      $scope.total = parseInt($scope.camisetaSeleccionada.valor) + parseInt($scope.estampaSeleccionada.valor);
      console.log($scope.total);
      imprimirConEstampa();
    });
  }

  $scope.agregarCarrito = function (){
    if(servicioCookies.validarSiEstaAutenticado()){
      servicioCookies.aregarAlCarrito($scope.camisetaSeleccionada,$scope.estampaSeleccionada,$scope.total);
      $location.path("/pagar");
    }
    else
    {
        $location.path("/login/"+$routeParams.id);
    }
  }

  $scope.descartar = function (){
    servicioCookies.eliminarCamisetaSeleccionada();
    servicioCookies.eliminarEstampaSeleccionada();
    $location.path('/');
  }
  function imprimirConEstampa(){
    var canvas = document.getElementById('canvas');
    var context = canvas.getContext('2d');
    canvas.width = 300;
    canvas.height = 350;
    var img1 = new Image();
    var img2 = new Image();
    //context.globalAlpha = 1.0;
    //context.drawImage(img1, 0, 0,300,400);
    //context.drawImage(img2, 125, 175,50,80);
    img1.onload = function() {
      canvas.width = 300;
      canvas.height = 300;
      img2.src = $scope.estampaSeleccionada.urlImagen;
    };
    img2.onload = function() {
      context.globalAlpha = 1.0;
      context.drawImage(img1, 0, 0,300,300);
      context.drawImage(img2, 125, 110,50,80);
    };
    img1.src = $scope.camisetaSeleccionada.urlImagen;
    console.log("probando 2");
  }
  $scope.seleccionTalla = function (talla){
    $scope.talla = talla;
    console.log(talla);
  }
  $scope.seleccionColor = function (color){
    $scope.color = color;
    console.log(color);
  }
}]);
