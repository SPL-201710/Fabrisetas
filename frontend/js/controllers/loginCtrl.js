app.controller("loginCtrl",["$scope","servicioHome","servicioLogin","$location","servicioCookies","$routeParams","$window","servicioFacebook","servicioCookies","servicioLogin","servicioTwitter","fabConstans",
function($scope,servicioHome,servicioLogin,$location,servicioCookies,$routeParams,$window,servicioFacebook,servicioCookies,servicioLogin,servicioTwitter,fabConstans){

  init();
/*
bloque de facebook
*/

$window.fbAsyncInit = function() {
  // Executed when the SDK is loaded

  FB.init({
    appId: '254087478393895',
    channelUrl: 'views/channel.html',
    status: true,
    cookie: true,
    xfbml: true
  });

};

(function(d){
  // load the Facebook javascript SDK

  var js,
  id = 'facebook-jssdk',
  ref = d.getElementsByTagName('script')[0];

  if (d.getElementById(id)) {
    return;
  }

  js = d.createElement('script');
  js.id = id;
  js.async = true;
  js.src = "//connect.facebook.net/en_US/all.js";

  ref.parentNode.insertBefore(js, ref);

}(document));

  function init (){
    $scope.noExiste=false;
    $scope.authFacebook=fabConstans.authFacebook;
    $scope.authTwitter=fabConstans.authTwitter;

  }
    $scope.iniciarSesion = function (){
      $scope.noExisteEnElSistema="animated fadeOut";
      //console.log($scope.login);
      $scope.login.userId = 0;
      $scope.login.identificationType = "CC";
      $scope.login.identificationNumber = "171321632";
      $scope.login.tipo = "";
      $scope.login.ssoId = "",
      $scope.login.firstName = "";
      $scope.login.lastName = "";
      $scope.login.email = "";
      $scope.login.tipoLogin = "l";
      console.log($scope.login);
      servicioLogin.validarUsuario().save($scope.login).$promise.then((datos)=>{
          if(typeof $routeParams.id=='undefined')
          {
            servicioCookies.crearCookieUsuarioAutenticado(datos);
            $location.path("/");
          }
          else
          {
            servicioCookies.crearCookieUsuarioAutenticado(datos);
            $location.path("/ver-camisa/"+$routeParams.id);
          }

      })
      .catch(function(err) {
          $scope.noExiste=true;
          $scope.noExisteEnElSistema="animated wobble";
      });
    }

    $scope.iniciarConFb = function (){

      // "{"name":"julian",
      // "password":"julian",
      // "identificationNumber":1015434798,
      // "identificationType":"CC",
      // "firstName":"julian",
      // "lastName":"julian",
      // "tipo":"Cliente",
      // "direccion":[],
      // "login":[],
      // "userId":null,
      // "ssoId":null}"

      FB.login(function(response) {
        servicioFacebook.logeado().then((datos)=>{
          if(typeof $routeParams.id=='undefined')
          {
            $scope.usuarioNuevo = {};
            $scope.usuarioNuevo.direccion=[];
            $scope.usuarioNuevo.login = [];
            $scope.mensajeCreacion=false;
            $scope.usuarioNuevo.ssoId=null;

            $scope.usuarioNuevo.userId=datos.id;
            $scope.usuarioNuevo.name=datos.name;
            $scope.usuarioNuevo.password=datos.id;

            servicioLogin.crearUsuario().save($scope.usuarioNuevo).$promise.then(function(datos){
              console.log(datos);
              $scope.usuarioNuevo={};
              $scope.mensajeCreacion=true;
              $scope.mostrarMensajeCreacion = "animated fadeIn";
              servicioCookies.crearCookieUsuarioAutenticado($scope.usuarioNuevo);
              $location.path("/");
            }).catch(function(err){
              console.log(err);
              servicioCookies.crearCookieUsuarioAutenticado($scope.usuarioNuevo);
                $location.path("/");
            });
          }
          else
          {
            $scope.usuarioNuevo = {};
            $scope.usuarioNuevo.direccion=[];
            $scope.usuarioNuevo.login = [];
            $scope.mensajeCreacion=false;
            $scope.usuarioNuevo.ssoId=null;
            $scope.usuarioNuevo.userId=datos.id;
            $scope.usuarioNuevo.name=datos.name;
            $scope.usuarioNuevo.password=datos.id;
            servicioLogin.crearUsuario().save($scope.usuarioNuevo).$promise.then(function(datos){
              console.log(datos);
              $scope.usuarioNuevo={};
              $scope.mensajeCreacion=true;
              $scope.mostrarMensajeCreacion = "animated fadeIn";
              servicioCookies.crearCookieUsuarioAutenticado($scope.usuarioNuevo);
              $location.path("/ver-camisa/"+$routeParams.id);
            }).catch(function(err){
              console.log(err);
              servicioCookies.crearCookieUsuarioAutenticado($scope.usuarioNuevo);
              $location.path("/ver-camisa/"+$routeParams.id);
            });
          }
        })
      }, {scope: 'email,user_likes'});


    }

    $scope.iniciarConTw = function (){
      servicioTwitter.iniciarSesionTwitter().then(function(usuario){
        if(typeof $routeParams.id=='undefined')
        {
          $scope.usuarioNuevo = {};
          $scope.usuarioNuevo.direccion=[];
          $scope.usuarioNuevo.login = [];
          $scope.mensajeCreacion=false;
          $scope.usuarioNuevo.ssoId=null;

          $scope.usuarioNuevo.userId=usuario.uid;
          $scope.usuarioNuevo.name=usuario.displayName;
          $scope.usuarioNuevo.password=usuario.uid;

          servicioLogin.crearUsuario().save($scope.usuarioNuevo).$promise.then(function(datos){
            console.log(datos);
            $scope.usuarioNuevo={};
            $scope.mensajeCreacion=true;
            $scope.mostrarMensajeCreacion = "animated fadeIn";
            servicioCookies.crearCookieUsuarioAutenticado($scope.usuarioNuevo);
            $location.path("/");
          }).catch(function(err){
            console.log(err);
            servicioCookies.crearCookieUsuarioAutenticado($scope.usuarioNuevo);
              $location.path("/");
          });
        }
        else
        {
          $scope.usuarioNuevo = {};
          $scope.usuarioNuevo.direccion=[];
          $scope.usuarioNuevo.login = [];
          $scope.mensajeCreacion=false;
          $scope.usuarioNuevo.ssoId=null;
          $scope.usuarioNuevo.userId=usuario.uid;
          $scope.usuarioNuevo.name=usuario.displayName;
          $scope.usuarioNuevo.password=usuario.uid;
          servicioLogin.crearUsuario().save($scope.usuarioNuevo).$promise.then(function(datos){
            console.log(datos);
            $scope.usuarioNuevo={};
            $scope.mensajeCreacion=true;
            $scope.mostrarMensajeCreacion = "animated fadeIn";
            servicioCookies.crearCookieUsuarioAutenticado($scope.usuarioNuevo);
            $location.path("/ver-camisa/"+$routeParams.id);
          }).catch(function(err){
            console.log(err);
            servicioCookies.crearCookieUsuarioAutenticado($scope.usuarioNuevo);
            $location.path("/ver-camisa/"+$routeParams.id);
          });
        }
      })
      .catch(function(err){
        console.log(err);
      })
    }
}]);
