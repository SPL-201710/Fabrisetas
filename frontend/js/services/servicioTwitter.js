app.service("servicioTwitter",["fabConstans","$http","$q","$resource",function(fabConstans,$http,$q,$resource){
	var vm= this;
  var instanciaTwitter = new firebase.auth.TwitterAuthProvider();
  vm.iniciarSesionTwitter = function(){
    var deferred = $q.defer();
    firebase.auth().signInWithPopup(instanciaTwitter).then(function(result) {
      deferred.resolve(result.user);
      console.log(result);
    }).catch(function(error) {
      deferred.reject(error);
    });
    return deferred.promise;
  }

  vm.cerrarSesionTwitter = function (){
    firebase.auth().signOut().then(function() {
    }).catch(function(error){
			console.log(error);
		})
  }
}]);
