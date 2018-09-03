$(document).on('turbolinks:load', function(){
  showAccounts();
  toggleTransactions()
});

  class Account {
    constructor(data){
    this.id = data.id;
    this.type_of_account = data.type_of_account;
    this.balance = data.balance;
    this.transactions = data.transactions
    }
    accountInformation() {
      return `Your ${this.type_of_account} account has a balance of $${this.balance}.`
    }

    unprocessedTransactions(){
      debugger
      let unprocessed = [];
      let unprocessedHtml = '';
      this.transactions.forEach(e=> e.processed === false ? unprocessed.push(e) : '');
      unprocessed.forEach(e=> unprocessedHtml += `<br>${e.type_of_transaction}<br>
        $${e.amount}<br>

        `);
      if (unprocessed.length > 1) {return unprocessedHtml;}
      else {
        return '<br>No Transactions'
      }
    }
  }

  function toggleTransactions(){
    $('#account-transactions').on('click', function(e){
      alert('hi')
    });
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
      $('#user_accounts').text("View Accounts")
      $div.html("")
    }
    });
  }
