app.service("servicioAutores",["$http","$q","$resource",function($http,$q,$resource){
	var vm= this;

	vm.traerEstampasAutor = function (autor){
		return $resource("http://52.88.20.109:8080/fabricetas/estampa/autor/:id",{id:autor});
		//return $resource("http://52.88.20.109:3000/api/estampas/autor/:id",{id:autor});
	}

	vm.traerEstampasAutorNode = function (autor){
		return $resource("http://52.88.20.109:3000/api/estampas/autor/:id",{id:autor});
		//return $resource("http://52.88.20.109:3000/api/estampas/autor/:id",{id:autor});
	}

	vm.traerAutores = function (autor){
		return $resource("http://52.88.20.109:8080/fabricetas/user/artistas");
	}
	vm.cargarNuevaEstampa = function(file,name,detalle){
			var deferred = $q.defer();
			var formData = new FormData();
			formData.append("name", name);
			formData.append("file", file);

			formData.append("nombre",detalle.nombre);
			formData.append("valor", detalle.valor);
			formData.append("descripcion", detalle.descripcion);
			formData.append("tema", detalle.tema);
			formData.append("autor", detalle.autor);
			console.log(formData.nombre);
			return $http.post("http://localhost/gomelo/cargarimagen.php", formData, {
				headers: {
					"Content-type": undefined
				},
				transformRequest: angular.identity
			})
			.then(function(res)
			{
				deferred.resolve(res);
			})
			.catch(function(msg, code)
			{
				deferred.reject(msg);
			})
			return deferred.promise;
	}

}]);
