$(document).ready( () => {


});

function displayAccounts(){
  $("#accounts").on("click", function(e){
    $.ajax({
      method: "GET",
      url: `/users/${}/accounts`
    })

  });
}
