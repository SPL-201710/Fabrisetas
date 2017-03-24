app.controller("categoriaCtrl",["$scope","$routeParams",function($scope,$routeParams){
	console.log($routeParams);

	if($routeParams.id==1)
	{
		$scope.titulo="Estampas de videojuegos";
	}
	else if($routeParams.id==2)
	{
		$scope.titulo="Estampas de tecnológicas";
	}
	else if($routeParams.id==3)
	{
		$scope.titulo="Estampas de repositorios";
	}
}]);