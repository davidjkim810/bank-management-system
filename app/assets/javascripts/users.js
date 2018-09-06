$(document).on('turbolinks:load', function(){
  showAccounts();

});

  class Account {
    constructor(data){
    this.id = data.id;
    this.type_of_account = data.type_of_account;
    this.balance = data.balance;
    this.transactions = data.transactions
    }
    accountInformation(){
      return `Your ${this.type_of_account} account has a balance of $${this.balance}.`
    }

    unprocessedTransactions(){
      let unprocessed = [];
      let unprocessedHtml = '';
      this.transactions.forEach(e=> e.processed === false ? unprocessed.push(e) : '');
      unprocessed.forEach(e=> unprocessedHtml += `<br>${e.type_of_transaction}<br>
        $${e.amount}<br>
        `);
      if (unprocessed.length > 0) {return unprocessedHtml;}
      else {
        return '<br>No Transactions'
      }
    }
  }


  function showAccounts(){
    $('#user_accounts').on("click", function(e){
      let $div = $('div.accounts');
      let $userAccounts = $('#user_accounts')
      if ($userAccounts.text() === "View Accounts"){
      $userAccounts.text("Hide Accounts")
      $div.html("")
      // demonstration of using the fetch method to get JSON
        fetch("/users/" + $userAccounts[0].dataset.id + "/accounts" + ".json")
        .then((res) => res.json())
        .then((data) => {
          let output = '';
          data.forEach(function(account){
            // creation of JS object
            var new_account = new Account(account);
              output += `<br>
              ---------------------------------
                <p><a href='/accounts/${new_account.id}'>${new_account.type_of_account}</a></p>
                $${new_account.balance}<br><br>
                <div id="account-transactions">
                <b>Pending Transactions</b><br>
                ${new_account.unprocessedTransactions()}
                </div>
              `;
          })
          $div.append(output);

        })
    } else {
      $userAccounts.text("View Accounts")
      $div.html("")
    }
    });
  }
