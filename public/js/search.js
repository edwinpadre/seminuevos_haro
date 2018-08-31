
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
                       modalBody.innerHTML = "<a href='/galeria?year="+data[i].year+"&marca="+data[i].Marca+"&modelo="+data[i].modelo+"'> <div style='padding: 10px 0;'><img width='20%' src='" +data[i].imagenes[0]+ "'/>"+ " " + data[i].year +" "+ data[i].Marca + " "+ data[i].modelo + "</div> </a>";
                   }else {
                       modalBody.innerHTML += "<a href='/galeria?year="+data[i].year+"&marca="+data[i].Marca+"&modelo="+data[i].modelo+"'> <div style='padding: 10px 0;'><img width='20%' src='" +data[i].imagenes[0]+ "'/>"+ " " + data[i].year +" "+ data[i].Marca + " "+ data[i].modelo + "</div> </a>";
                   }
               }
           }
       })
   }
}

(function(){
    console.log(window.location);
    if (window.location.pathname === "/galeria"){
        $.get('/api/search_by_tag' + window.location.search, function(data){
            data = JSON.parse(data);
            console.log(data);
        })
    } else {
        return false;
    }
})();