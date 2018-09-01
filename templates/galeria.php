<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--<link rel="icon" href="../../favicon.ico"> -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Seminuevos Haro</title>
    <link href="css/responsive.css" rel="stylesheet">
    <link href="css/carousel.css" rel="stylesheet">
  </head>
  <body>
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#"><img src="images/haro.png" alt="" width="100" height="50" style="margin: -15px 0px 0px 0px;"></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="/">Inicio</a></li>
                <li><a href="/nosotros">Nosotros</a></li>
                <li><a href="/contacto">Contacto</a></li>
                <li><a href="/ubicacion">Ubicacion</a></li>
                <li class="active"><a href="/galeria">Galeria</a></li>

                <li>
                <form action="/api/search" class="navigationbar">
                  <input type="text" placeholder="Search.." name="search" style="color: black">
                  <button type="submit"><i class="fa fa-search" style="color: black"></i></button>
                </form>
              </li>
              </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>
    <div class="container">
      <br><br><br><br><br><br><br><br>
      <div class="row">
        <?php
        $Amount = 4;
        for($i = 0; $i < $Amount; $i++){
        echo '
        <div class="col-lg-4 mb-1" id="example">
            <figure><a href="/vista" style="text-decoration:none;">
              <img class="featurette-image img-responsive center-block" src="images/lobop.PNG" alt="Generic placeholder image">

            <figure>
          <center>
          <div class="flex">
            <h2 id="results13"></h2><h2>&nbsp;</h2> <h2 id="results14"></h2>
          </div>
          <div class="flex">
           <h3>$</h3><h3 id="results12"></h3>
          </div>

          <div class="flex">
            <h2 id="results1"></h2><h2>&nbsp;</h2> <h2 id="results2"></h2>
          </div>
        </center>
        </div>
        ';
        }
        ?>
      </div>
      <br><br>

    </div>
  </body>
</html>
<style>
body{
  font-family: Arial;
  background-image: url("images/wallpaper2.png");
  background-size: cover;
}
h4{
  color: black;
}
h3{
  color: black;
}
h5{
  color: black;
}
p{
  color: black;
}
a{
  text-decoration : none;
}

#example {
  position: relative;
}
#example:before, .bot-left:after {
  content: "";
  position: absolute;
  bottom: -3px;
  left: -3px;

}
#example:before {
  top: -3px;
  width: 3px;
  background-image: -webkit-gradient(linear, 0 100%, 0 0, from(#000), to(transparent));
  background-image: -webkit-linear-gradient(transparent, #000);
  background-image: -moz-linear-gradient(transparent, #000);
  background-image: -o-linear-gradient(transparent, #000);
}
#example:after {
  right: -3px;
  height: 3px;
  background-image: -webkit-gradient(linear, 0 0, 100% 0, from(#000), to(transparent));
  background-image: -webkit-linear-gradient(left, #000, transparent);
  background-image: -moz-linear-gradient(left, #000, transparent);
  background-image: -o-linear-gradient(left, #000, transparent);
}

/*ipad responsive*/
@media (min-width: 768px) and (max-width: 1024px){
  body{
        margin-top: 0px;
        height: auto;
  }
  .row{
    margin-bottom: 100px;
  }
}
  .flex{
    display: flex;
  }
</style>

<script>
$.ajax({
  type: "GET",
  url: "/api/search",
  dataType: "json",
  error: function (xhr, status) {
            alert(status);
            console.log("error putito");
        },
  success: function(result){
    console.log(result[0]);
    console.log(result);

var idCar = 1; //variable para usar para saber que auto usar su data

anioJSON = result[idCar].year;
kmJSON = result[idCar].Kilometraje;
motorJSON = result[idCar].Motor_desc;
colorJSON = result[idCar].color;
interioresJSON = result[idCar].interiores;
frenosJSON = result[idCar].Frenos;
cilindrajeJSON = result[idCar].cilindraje;
traccionJSON = result[idCar].traccion;
transmisionJSON = result[idCar].transmision;
quemaJSON = result[idCar].quemacocos;
electricoJSON = result[idCar].electrico;

precioJSON= result[idCar].precio;

marcaJSON= result[idCar].Marca;
modeloJSON= result[idCar].modelo;

document.getElementById("results1").innerHTML = anioJSON;
document.getElementById("results2").innerHTML = kmJSON;
document.getElementById("results12").innerHTML = precioJSON;
document.getElementById("results13").innerHTML = marcaJSON;
document.getElementById("results14").innerHTML = modeloJSON;
  }
});
</script>
