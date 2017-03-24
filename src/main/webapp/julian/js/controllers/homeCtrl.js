app.controller("homeCtrl",["$scope","servicioHome",function($scope,servicioHome){
	init();

	function init(){
		servicioHome.traerEstampas().then(function(datos){
			$scope.populares = datos.data;
			console.log($scope.populares);
		})
		.catch(function(err){
			console.log(err);
		});
	}
}]);
