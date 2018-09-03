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
                  <input type="text" placeholder="Search.." name="search" style="color: black" id="search-input">
                    <button type="button" class="btn btn-primary btn-lg " data-toggle="modal" data-target="#searchModal" id="search-btn">
                        <i class="fa fa-search" style="color: black"></i>
                    </button>
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
          <h3>Ford Lobo</h3>
          <h4>$500,000</h4>
          <h5>2018 | 30,000 km</h5></a>
        </center>
        </div>
        ';
        }
        ?>
      </div>
      <br><br>

    </div>
    <!-- The modal -->
    <div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="modalLabelSmall" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="modalLabelSmall">Modal Title</h4>
                </div>

                <div class="modal-body" id="modal-body">
                    <img src="/images/loaader.gif" style="width: 100%;">
                </div>

            </div>
        </div>
    </div>
    <!-- The modal -->
    <script src="js/search.js"></script>
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
</style>

<script>
$.ajax({
  type: "GET",
  url: "/api/search",
  dataType: "json",
  error: function (xhr, status) {
            console.error(status);
        },
  success: function(result){
    console.log(result[0]);
    console.log(result);

var idCar = 1;
}
});
</script>
