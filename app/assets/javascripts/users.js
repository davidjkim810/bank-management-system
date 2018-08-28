$(function(){
  showAccounts();
});

  function showAccounts(){
    $('#user_accounts').on("click", function(e){
      let $div = $('div.accounts');
      if ($('#user_accounts').text() === "View Accounts"){

      $('#user_accounts').text("Hide Accounts")
      $.get("/users/" + this.dataset.id + "/accounts" + ".json", function(data){
        $div.html("")
        data.forEach(function(account){
          $div.append('<br>' + '<a href=/accounts/' + `${account.id}` + '>' + `${account.type_of_account}` + '</a>' + '<br><br>$' + account.balance + '<br>')
        });
      });
    } else {
      $('#user_accounts').text("View Accounts")
      $div.html("")
    }
    });
  }


  function browseTransactions(){
    $()

  }
