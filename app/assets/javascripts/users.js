$(document).on('turbolinks:load', function(){
  showAccounts();
});

  class Account {
    constructor(data){
    this.id = data.id;
    this.type_of_account = data.type_of_account;
    this.balance = data.balance;
    }
    accountInformation() {
      return `Your ${this.type_of_account} account has a balance of $${this.balance}.`
    }
  }

  function showAccounts(){
    $('#user_accounts').on("click", function(e){
      let $div = $('div.accounts');
      if ($('#user_accounts').text() === "View Accounts"){
      $('#user_accounts').text("Hide Accounts")
      $div.html("")
        fetch("/users/" + $('#user_accounts')[0].dataset.id + "/accounts" + ".json")
        .then((res) => res.json())
        .then((data) => {
          let output = '';
          data.forEach(function(account){
            var new_account = new Account(account);
              output += `
                <p><a href='/accounts/${new_account.id}'>${new_account.type_of_account}</a></p>
                $${new_account.balance}<br><br>

                <button class="accountTransactions">View Transactions</button><br><br>
              `;
          })
          $div.append(output);
        })
    } else {
      $('#user_accounts').text("View Accounts")
      $div.html("")
    }
    });
  }
