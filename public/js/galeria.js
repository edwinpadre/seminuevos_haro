
var sBtn = document.getElementById('search-btn'),
    iBtn = document.getElementById('search-input')
    modalBody = document.getElementById('modal-body');


sBtn.addEventListener('click', function(){
    val = iBtn.value;
    searchToApi(val);
});

(function(){
    if (window.location.pathname === "/galeria"){
        $.get('/api/getAll' + window.location.search, function(data){
            data = JSON.parse(data);
            var container = document.getElementById("example");
            for(var i in data){
              container.innerHTML += '<div class="galery-container"><a href="/vista?id='+ data[i].id+'" style="text-decoration:none;"><img class="featurette-image img-responsive center-block" src="'+ data[i].imagenes[0]+'" alt="Generic placeholder image">\<div class="info-car"><h2 id="results13"></h2><h2>&nbsp;</h2> <h2 id="results14">'+ data[i].Marca+'<span>'+data[i].modelo+'</span></h2><h3 id="results12">$ '+ data[i].precio+'</h3><h2 id="results1"></h2><h2>&nbsp;</h2> <h2 id="results2"></h2></div></a></div>'
            }
        })
    } else {
        return false;
    }
})();
