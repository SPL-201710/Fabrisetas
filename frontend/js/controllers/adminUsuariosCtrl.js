app.controller("adminUsuariosCtrl",["$scope","servicioHome", "servicioCategoria","servicioCookies","servicioAdminUsuarios","$location",function($scope, servicioHome, servicioCategoria,servicioCookies,servicioAdminUsuarios,$location){
	init();


	$scope.editarUsuario = function (indice){
		$scope.titulo="Edición de usuario";
		$scope.nuevoOActualizar = true;
		$scope.accion="actualizar";
		$scope.usuarioSeleccionado = $scope.listaUsuarios[indice];
		console.log($scope.usuarioSeleccionado);
	}

	$scope.crearUsuario = function (indice){
		$scope.titulo="Creación de usuario";
		$scope.nuevoOActualizar = true;
		$scope.accion="crear";
		$scope.usuarioSeleccionado=[];
		$scope.usuarioSeleccionado.userId=null;
		$scope.usuarioSeleccionado.ssoId=null;
		console.log($scope.usuarioSeleccionado);
	}

	$scope.crearOActualizarUsuario = function (){
		if ($scope.accion=='actualizar')
		{
				servicioAdminUsuarios.actualizarUsuario($scope.usuarioSeleccionado.userId).update($scope.usuarioSeleccionado).$promise.then((datos)=>{
					$scope.nuevoOActualizar=false;
				},
				(err)=>{
						alert("error");
						console.log(err);
				});
		}
		else if ($scope.accion=="crear")
		{
			console.log($scope.usuarioSeleccionado);
			servicioAdminUsuarios.crearUsuario().save($scope.usuarioSeleccionado);
		}
	}
	function init(){
		if(!servicioCookies.validarSiEstaAutenticado())
		{
			$scope.listaUsuarios = servicioAdminUsuarios.traerUsuarios().query().$promise.then((datos)=>{
				$scope.listaUsuarios = datos;
				angular.forEach($scope.listaUsuarios,function(valor,llave){
					valor.indice=llave;
				});
				console.log($scope.listaUsuarios);
			});
		}
		else
		{
				// si no está logeado lo retorna a la pagina inicial
				//$location.path("/");
		}
	}
}]);
