$(document).on('turbolinks:load', function(){
  toggleTransactionForm();
  newTransaction();
});

class Transaction {
  constructor(data){
    this.id = data.id;
    this.processed = data.processed;
    this.type_of_transaction = data.type_of_transaction;
    this.amount = data.amount;
  }
}

  function toggleTransactionForm(){
    $(".transaction-link").on('click', function(e){
      $('div.quickTransactionForm').toggle();
    });
  }

  function newTransaction(){
    // references the new transaction form
    let $newTransaction = $('#new_transaction');

    $newTransaction.on('submit', function(e){

        $.ajax({
        type: this.method,
        url: this.action,
        data: $(this).serialize(),
        success: function(data){
          var $transactions = $('div.transactions')
          var newTransaction = new Transaction(data)
          var accountId = $newTransaction[0].action

          $transactions.append(`
            ${newTransaction.type_of_transaction}<br>
            $${newTransaction.amount}<br>
            <a href="${accountId}/${newTransaction.id}/edit">Process</a><br><br>
            `);

            // this enables resubmission of form otherwise button disables
          $newTransaction[0][6].disabled = false
        }
      });
      e.preventDefault();
    });
  }
