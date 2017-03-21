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
	vm.traerEstampasPorId = function (id){
    	var defered = $q.defer();
    	var promise = defered.promise;
		url="http://52.88.20.109:3000/api/estampas/"+id
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
	//
	vm.traerEstamasPost = function (parametros){
        var defered = $q.defer();
        var promise = defered.promise;
				var url ="";
        $http({
            method: 'POST',
            url: url,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            },
            data:parametros
        })
        .then(function (datos) {
            defered.resolve(datos);
        })
        .catch(function(err){
						console.log(err);
						defered.reject(err);
        });
		return promise;
	}

}]);
