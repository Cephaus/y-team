$(document).ready(function(){
   var url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query="

  var getDescription = function(name){
    $.get({
      url: url + name + "&location=29.6436325,-82.3571189&radius=1500&key=AIzaSyCio1lbC-bpZGEb7FEcwBryRGpVlLe96LQ"
    }).done(function(response){

      var exact_name1 = response.results[0].name;
      var exact_name2 = response.results[1].name;
      var exact_name3 = response.results[2].name;
      // alert(response.results.length)

      for(var i=0; i<response.results.length; i++){

      $('#place_googlename').append($('<option>', {
      value: i,
      text: response.results[i].name
      }));

      }

      $.ajax({
        url : "/places/new",
        type : "GET",
        data : { place1: exact_name1,  place2: exact_name2, place3: exact_name3}
    });
      // $("#place_image_uri").val(exact_name);
    });
  };

  $('#place_name').change(function(){
    getDescription(this.value);
    $('#place_googlename')
    .empty();
  });

  $('#place_googlename').change(function(){
    var name = $('#place_name').val();
    var url = "https://maps.googleapis.com/maps/api/place/textsearch/json?location=29.650203500000003,-82.3237312&query=";

    $.get({
      url: url + name + "&key=AIzaSyCio1lbC-bpZGEb7FEcwBryRGpVlLe96LQ",
    }).done(function(response){

      var target = $('#place_googlename option:selected').val();

      for(var i=0; i<response.results.length; i++){

      if(target == i){
        $('#place_address').val(response.results[i].formatted_address);
        $('#place_lat').val(response.results[i].geometry.location.lat);
        $('#place_lng').val(response.results[i].geometry.location.lng);
      }
      // else{
      // alert('test');
      // }

      }

      photo_reference = response.results[0].photos[0].photo_reference

      image_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=" + photo_reference + "&key=AIzaSyCio1lbC-bpZGEb7FEcwBryRGpVlLe96LQ"
      $('#place_image_uri').val(image_url);


    });

    });

  });
