var app = angular.module('fabrisetas', ['ngRoute']);

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
    .when("/adminempleados",{
        controller:"adminEmpleadosCtrl",
        templateUrl:"views/adminempleados.html"
    })
    .when("/crearempleado",{
        controller:"crearEmpleadoCtrl",
        templateUrl:"views/crearempleado.html"
    })
    .when("/calendario",{
        controller:"calendarCtrl",
        templateUrl:"views/calendar.html"
    })
    .otherwise({
      redirectTo: '/'
    });
});
