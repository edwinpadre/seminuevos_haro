
var sBtn = document.getElementById('search-btn'),
    iBtn = document.getElementById('search-input')
    modalBody = document.getElementById('modal-body');


sBtn.addEventListener('click', function(){
    val = iBtn.value;
    searchToApi(val);
});

function searchToApi(val){
   if(val == null){
       console.log(val);
       modalBody.innerHTML="No result founded";
   } else {
       $.get('api/search?search=' + val, function(data){
           data = JSON.parse(data);
           if(data == null || data == undefined){
               modalBody.innerHTML= "<a>No result founded</a>" ;
           } else {
               for (var i in data){
                   if (i === "0"){
                       modalBody.innerHTML = "<a href='/search-results?year="+data[i].year+"&marca="+data[i].Marca+"&modelo="+data[i].modelo+"'> <div style='padding: 10px 0;'><img width='20%' src='" +data[i].imagenes[0]+ "'/>"+ " " + data[i].year +" "+ data[i].Marca + " "+ data[i].modelo + "</div> </a>";
                   }else {
                       modalBody.innerHTML += "<a href='/search-results?year="+data[i].year+"&marca="+data[i].Marca+"&modelo="+data[i].modelo+"'> <div style='padding: 10px 0;'><img width='20%' src='" +data[i].imagenes[0]+ "'/>"+ " " + data[i].year +" "+ data[i].Marca + " "+ data[i].modelo + "</div> </a>";
                   }
               }
           }
       })
   }
}

(function(){
    if (window.location.pathname === "/search-results"){
        $.get('/api/search_by_tag' + window.location.search, function(data){
            data = JSON.parse(data);
            var container = document.getElementById("example");
            for(var i in data){
              container.innerHTML += '<div class="galery-container"><a href="/vista" style="text-decoration:none;"><img class="featurette-image img-responsive center-block" src="'+ data[i].imagenes[0]+'" alt="Generic placeholder image">\<div class="info-car"><h2 id="results13"></h2><h2>&nbsp;</h2> <h2 id="results14">'+ data[i].Marca+'<span>'+data[i].modelo+'</span></h2><h3 id="results12">$ '+ data[i].precio+'</h3><h2 id="results1"></h2><h2>&nbsp;</h2> <h2 id="results2"></h2></div></a></div>'
            }
        })
    } else {
        return false;
    }
})();
