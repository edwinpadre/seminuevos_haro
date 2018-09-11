
var sBtn = document.getElementById('search-btn'),
    iBtn = document.getElementById('search-input')
    modalBody = document.getElementById('modal-body');


sBtn.addEventListener('click', function(){
    val = iBtn.value;
    searchToApi(val);
});

(function(){
    var url = window.location.search;
    var param = url.split("=");
    if(param.length > 1){
        $.get('/api/search_by_id?id='+ param[1]+'', function(data){
            data = JSON.parse(data);
            var carousel = document.getElementsByClassName('carousel-inner')[0];
            if(data[0] !== undefined){
              data[0].modelo !== null ?document.getElementById('results14').innerHTML = data[0].modelo : "";
              data[0].Marca !== null ?document.getElementById('results13').innerHTML = data[0].Marca : "";
              data[0].precio !== null ?document.getElementById('results12').innerHTML = data[0].precio : "";
              data[0].description !== null ?document.getElementById('results16').innerHTML = data[0].description : "";

                data[0].year !== null ?document.getElementById('results1').innerHTML = data[0].year : "";
                data[0].Kilometraje !== null ? document.getElementById('results2').innerHTML = data[0].Kilometraje : "";
                data[0].Motor_desc != null ? document.getElementById('results3').innerHTML = data[0].Motor_desc : "";
                data[0].color !== null ? document.getElementById('results4').innerHTML = data[0].color : "";
                data[0].interiores !== null ? document.getElementById('results5').innerHTML = data[0].interiores : "";
                data[0].Frenos !== null ? document.getElementById('results6').innerHTML = data[0].Frenos : "";
                data[0].cilindraje !== null ? document.getElementById('results7').innerHTML = data[0].cilindraje : "";
                data[0].traccion !== null ? document.getElementById('results8').innerHTML = data[0].traccion : "";
                data[0].transmision !== null ? document.getElementById('results9').innerHTML = data[0].transmision : "";
                data[0].quemacocos !== null ? document.getElementById('results10').innerHTML = data[0].quemacocos : "";
                data[0].electrico !== null ? document.getElementById('results11').innerHTML = data[0].electrico : "";
                if(data[0].imagenes != undefined){
                    for (var i in data[0].imagenes){
                        if( i == 0){
                            carousel.innerHTML= '<div class="item active"><img class="first-slide" src="'+ data[0].imagenes[i]+'" alt="First slide">"</div>'
                        } else {
                            carousel.innerHTML+= '<div class="item"><img class="first-slide" src="'+ data[0].imagenes[i]+'" alt="First slide">"</div>'
                        }

                    }
                }
            }

        })
    } else {
        return false;
    }
})();
