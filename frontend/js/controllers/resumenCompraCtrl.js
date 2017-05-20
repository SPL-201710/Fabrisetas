app.controller("resumenCompraCtrl",["$scope","$routeParams","servicioAutores","servicioHome","servicioCookies",function($scope,$routeParams,servicioAutores,servicioHome,servicioCookies){
  init();
  function init(){
    $scope.prueba="asdasdas";
    $scope.resumenCompra = servicioCookies.retornarCarrito();
    $scope.imagenes= new Array();
    $scope.valoresSumados = new Array();
    angular.forEach($scope.resumenCompra,function(objeto,llave){
      let obj = new Array();
      angular.forEach(objeto,function(valor,llave){
        obj.push(valor.path);
      });
      $scope.imagenes.push({"imagenUno":obj[0],"imagenDos":obj[1]});
    });

    function imprimirConEstampa(nombreCanvas,imgUno,imgDos){
      var canvas = document.getElementById('canvas');
      var context = canvas.getContext('2d');
      canvas.width = 300;
      canvas.height = 350;
      var img1 = new Image();
      var img2 = new Image();

      img1.onload = function() {
        canvas.width = 300;
        canvas.height = 300;
        img2.src = $scope.estampaSeleccionada.path;
      };
      img2.onload = function() {
        context.globalAlpha = 1.0;

        context.beginPath();
        context.rect(0, 0, 300, 300);
        context.fillStyle = $scope.color;
        context.fill();
        context.closePath();
        context.drawImage(img1, 0, 0,300,300);
        context.drawImage(img2, 125, 110,50,80);
        context.fillStyle =   $scope.colorTexto;
        context.font = "bold 9px sans-serif";
        context.textAlign="center";
        context.fillText($scope.textTshirt, 150, 200);
      };
      img1.src = $scope.camisetaSeleccionada.path;
      console.log("probando 2");
    }

    console.log($scope.carrito);
  }

}]);
