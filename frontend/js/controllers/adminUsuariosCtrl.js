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
		$scope.usuarioSeleccionado={};
		$scope.usuarioSeleccionado.userId=null;
		$scope.usuarioSeleccionado.ssoId=null;
		console.log($scope.usuarioSeleccionado);
	}

	$scope.eliminarUsuario = function (userId){
		servicioAdminUsuarios.eliminarUsuario(userId).delete().$promise.then((datos)=>{
			$scope.listaUsuarios.filter(function(usuario){
						// si retorna falso la funcion filter elimina el objeto
						return usuario.userId!==userId;
			});
		},
		(err)=>{
			alert("err");
			console.log(err);
		});
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
			servicioAdminUsuarios.crearUsuario().save($scope.usuarioSeleccionado).$promise.then((datos)=>{
				$scope.nuevoOActualizar=false;
				 $scope.listaUsuarios.push(datos)
				console.log(datos);
			},
			(err)=>{
				alert("error");
				console.log(err);
			});
		}
	}
	function init(){
		if(servicioCookies.validarSiEstaAutenticado())
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
				$location.path("/");
		}
	}
}]);
