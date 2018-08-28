$(function(){
  showAccounts();
});

  function showAccounts(){
    $("#user_accounts").on("click", function(e){
        $.ajax({
        url: "/users/" + this.dataset.id + "/accounts",
        dataType: 'script'
      })
    })
  }


  function browseTransactions(){
    $()

  }
