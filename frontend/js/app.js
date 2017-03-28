var app = angular.module('fabrisetas', ['ngRoute','ngResource']);
/*
{ 'get':    {method:'GET'},
  'save':   {method:'POST'},
  'query':  {method:'GET', isArray:true},
  'remove': {method:'DELETE'},
  'delete': {method:'DELETE'} };
*/
app.config(function($routeProvider){

    $routeProvider.when("/",{
        controller:"homeCtrl",
        templateUrl:"views/home.html"
    })
    .when("/login",{
        controller:"loginCtrl",
        templateUrl:"views/login.html"
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
    .otherwise({
      redirectTo: '/'
    });
});