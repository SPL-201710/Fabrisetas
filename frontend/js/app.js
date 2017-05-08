var app = angular.module('fabrisetas', ['ngRoute','ngResource','ngMaterial','camisaAleatoria']);
app.value('fabConstans', {
    //URL_BASE_SERVICIOS:"http://52.88.20.109:8080/fabricetas/"
    URL_BASE_SERVICIOS:"http://localhost:8080/fabricetas/"
});

/*
{ 'get':    {method:'GET'},
  'save':   {method:'POST'},
  'query':  {method:'GET', isArray:true},
  'remove': {method:'DELETE'},
  'delete': {method:'DELETE'} };
*/


app.run(['$rootScope', '$window','servicioCookies',"$location",
  function($rootScope, $window,servicioCookies,$location) {

    $rootScope.user = {};

     $window.fbAsyncInit = function() {
       // Executed when the SDK is loaded

       FB.init({
         appId: '254087478393895',
         channelUrl: 'views/channel.html',
         status: true,
         cookie: true,
         xfbml: true
       });

       watchLoginChange();

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


     function watchLoginChange() {

       var _self = this;

       FB.Event.subscribe('auth.authResponseChange', function(res) {

         if (res.status === 'connected')
         {
           getUserInfo();
           if(typeof $rootScope.user.name!='undefined')
           {
             servicioCookies.crearCookieUsuarioAutenticado($rootScope.user);
             $location.path("/");
           }
         }
         else
         {
         }

       });

     }

      function getUserInfo () {

       var _self = this;

       FB.api('/me', function(res) {
         $rootScope.$apply(function() {
           $rootScope.user = _self.user = res;
           console.log(res);
         });
       });

     }


}]);

app.config(function($routeProvider){

    $routeProvider.when("/",{
        controller:"homeCtrl",
        templateUrl:"views/home.html"
    })
    .when("/login/:id?",{
        controller:"loginCtrl",
        templateUrl:"views/login.html"
    })
    .when("/registro",{
        controller:"registroCtrl",
        templateUrl:"views/registro.html"
    })
    .when("/categoria-estampas/:id?",{
        controller:"categoriaCtrl",
        templateUrl:"views/categoria-estampas.html"
    })
    .when("/navegar-autor/:autor?",{
        controller:"autorCtrl",
        templateUrl:"views/navegar-autor.html"
    })
    .when("/navegar/:opcion?",{
        controller:"navegarCtrl",
        templateUrl:"views/navegar.html"
    })
    .when("/ver-estampa/:id",{
        controller:"verEstampaCtrl",
        templateUrl:"views/ver-estampa.html"
    })
    .when("/camisas",{
        controller:"camisasCtrl",
        templateUrl:"views/camisas.html"
    })
    .when("/ver-camisa/:id",{
        controller:"verCamisaCtrl",
        templateUrl:"views/ver-camisa.html"
    })
    .when("/pagar",{
        controller:"pagarCtrl",
        templateUrl:"views/pagar.html"
    })
    .when("/artista",{
        controller:"artistaCtrl",
        templateUrl:"views/artista.html"
    })
    .when("/reportes",{
        controller:"reportesCtrl",
        templateUrl:"views/reportes.html"
    })
    .when("/adminTemas",{
        controller:"adminTemasCtrl",
        templateUrl:"views/adminTemas.html"
    })
    .when("/adminCamisetas",{
        controller:"adminCamisetasCtrl",
        templateUrl:"views/adminCamisetas.html"
    })
    .when("/adminUsuarios",{
        controller:"adminUsuariosCtrl",
        templateUrl:"views/adminUsuarios.html"
    })
    .otherwise({
      redirectTo: '/login'
    });
});
