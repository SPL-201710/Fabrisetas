app.controller("resumenCompraCtrl",["$scope","$routeParams","servicioAutores","servicioHome","servicioCookies","fabConstans","$location",
function($scope,$routeParams,servicioAutores,servicioHome,servicioCookies,fabConstans,$location){
  init();
  function init(){
    $scope.twitter=fabConstans.twitter;
    $scope.facebook=fabConstans.facebook;
    $scope.socialNetwork=fabConstans.socialNetwork;
    $scope.resumenCompra = servicioCookies.retornarResumenCompra();
  }
  $scope.limpiarCarrito = function(){
    servicioCookies.inicializarCarrito();
    $location.path("/");
  }
}]);
