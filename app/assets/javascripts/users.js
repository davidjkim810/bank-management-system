$(function(){
  showAccounts();
});

  function showAccounts(){
    $("#user_accounts").on("click", function(e){
      let $div = $("div.accounts")

      if ($("#user_accounts").text() === "View Accounts") {

        // $("#user_accounts").text("Hide Accounts");
        $.ajax({
        url: this.baseURI + "/accounts",
        dataType: 'script'
      })
  //     .done(function (data){
  //
  //       $div.html("")
  //       data.forEach(function(account){
  //         $("div.accounts").append("<p class='account-" + account.id + "'>" + "<a href='/accounts/" + account.id + "'>" + account.type_of_account + "</a></p>$" + account.balance);
  //       })
  //   });
  //
  // } else if ($("#user_accounts").text("Hide Accounts")){
  //   $("#user_accounts").text("View Accounts");
  //   $div.html("")
  }

    });
  }

  function browseTransactions(){
    $()

  }
