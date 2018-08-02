
$(document).ready(function(){
  if($("#try-it").length){
    function getLocation() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition2);
      }
    }

    function showPosition2(position){
      $('#hidden-lat').val(position.coords.latitude);
      $("#hidden-lng").val(position.coords.longitude);
    }

    getLocation();
  }
});
