app.service("servicioHome",["$http","$q",function($http,$q){
	var vm= this;

	vm.traerEstampas = function (){
    	var defered = $q.defer();
    	var promise = defered.promise;
		url="http://52.88.20.109:3000/api/estampas"
		$http({
			method:'GET',
			url:url
		})
		.then(function(datos){
			defered.resolve(datos);
		})
		.catch(function(err){
			defered.reject(datos);
		});
		return promise;
	}

}]);