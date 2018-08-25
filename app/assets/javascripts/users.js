$(function(){
  $("a.user_accounts").on("click", function(e){
    let $div = $("div.accounts")

    if ($("a.user_accounts").text() === "View Accounts") {

      $("a.user_accounts").text("Hide Accounts");
      $.ajax({
      method: "GET",
      url: this.href
    }).done(function (data){

      $div.html("")
      data.forEach(function(account){
        $("div.accounts").append("<p>" + "<a href='/accounts/" + account.id + "'>" + account.type_of_account + "</a></p>$" + account.balance);
      })
  });

} else if ($("a.user_accounts").text("Hide Accounts")){
  $("a.user_accounts").text("View Accounts");
  $div.html("")
}
      e.preventDefault();
  });

});
