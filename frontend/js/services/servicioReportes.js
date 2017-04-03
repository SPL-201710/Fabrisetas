app.service("servicioReportes",["$http","$q","$resource",function($http,$q,$resource){
	var vm= this;

  vm.reportePorFechas = function (autor,fechas){
    // return $resource("http://52.88.20.109:8080/fabricetas/estampa"); deberia ser un post
    let objeto =[
      {
        "nombre":"Devil may Cry",
        "tema":"Videojuegos",
        "valor":20000,
        "cantidad":4,
        "total":80000
      },
      {
        "nombre":"Estampa de luz",
        "tema":"Musica",
        "valor":22000,
        "cantidad":1,
        "total":22000
      },
      {
        "nombre":"Harry potter",
        "tema":"Peliculas",
        "valor":10000,
        "cantidad":4,
        "total":40000
      },
      {
        "nombre":"Angular",
        "tema":"Tecnología",
        "valor":15000,
        "cantidad":4,
        "total":60000
      }
    ]
    return objeto;
  }

	vm.reportePorTemas = function (autor,tema){
		// return $resource("http://52.88.20.109:8080/fabricetas/estampa"); deberia ser un post
    let objeto =[
      {
        "nombre":"Devil may Cry",
        "tema":"Videojuegos",
        "valor":20000,
        "cantidad":4,
        "total":80000
      },
      {
        "nombre":"League of Legends",
        "tema":"Videojuegos",
        "valor":22000,
        "cantidad":1,
        "total":22000
      },
      {
        "nombre":"Assasins creed",
        "tema":"Videojuegos",
        "valor":10000,
        "cantidad":4,
        "total":40000
      },
      {
        "nombre":"Super Mario Bros",
        "tema":"Videojuegos",
        "valor":15000,
        "cantidad":4,
        "total":60000
      }
    ]
    return objeto;
	}

	vm.reportePorEstampas = function (estampaId){
		// return $resource("http://52.88.20.109:8080/fabricetas/estampa"); deberia ser un get
    let objeto ={
        "nombre":"Devil may Cry",
        "tema":"Videojuegos",
        "valor":20000,
        "cantidad":4,
        "total":80000
      };
    return objeto;
	}

	vm.reportePorArtista = function (artistaId){
		// return $resource("http://52.88.20.109:8080/fabricetas/estampa"); deberia ser un post
    let objeto =[
      {
				"artista":"Bernad",
        "nombre":"Devil may Cry",
        "tema":"Videojuegos",
        "valor":20000,
        "cantidad":4,
        "total":80000
      },
      {
				"artista":"Bernad",
        "nombre":"Abuelo",
        "tema":"Animaciones",
        "valor":22000,
        "cantidad":1,
        "total":22000
      },
      {
				"artista":"Bernad",
        "nombre":"Assasins creed",
        "tema":"Videojuegos",
        "valor":10000,
        "cantidad":4,
        "total":40000
      },
      {
				"artista":"Bernad",
        "nombre":"React JS",
        "tema":"Tecnología",
        "valor":15000,
        "cantidad":4,
        "total":60000
      }
    ]
    return objeto;
	}

	vm.reportePorCamiseta = function (camisetaId){
		// return $resource("http://52.88.20.109:8080/fabricetas/estampa"); deberia ser un post
    let objeto =[
      {
        "nombre":"Camiseta ligera",
        "color":"rojo",
				"talla":"S",
        "valor":20000,
        "cantidad":4,
        "total":80000
      },
      {
        "nombre":"Camiseta esqueleto",
				"color":"azul",
				"talla":"L",
        "valor":22000,
        "cantidad":1,
        "total":22000
      },
      {
				"nombre":"Camiseta cuello v",
				"color":"Gris",
				"talla":"M",
        "valor":10000,
        "cantidad":4,
        "total":40000
      },
      {
				"nombre":"Camiseta comun",
				"color":"verde",
				"talla":"M",
        "valor":15000,
        "cantidad":4,
        "total":60000
      }
    ]
    return objeto;
	}

}]);
