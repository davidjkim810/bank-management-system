$(document).on('turbolinks:load', function(){
  toggleTransactionForm();
  newTransaction();
});

class Transaction{
  constructor(response){
    this.id = response.id;
    this.processed = response.processed;
    this.type_of_transaction = response.type_of_transaction;
    this.amount = response.amount;
  }
}


  function toggleTransactionForm(){
    $(".transaction-link").on('click', function(e){
      $('div.quickTransactionForm').toggle();
    });
  }


  function newTransaction(){
    $('#new_transaction').on('submit', function(e){

        $.ajax({
        type: this.method,
        url: this.action,
        data: $(this).serialize(),
        success: function(response){
          var $transactions = $('div.transactions')
          var newTransaction = new Transaction(response)

          var accountId = $('#new_transaction')[0].action
          $transactions.append(`
            ${newTransaction.type_of_transaction}<br>
            $${newTransaction.amount}<br>
            <a href="${accountId}/${newTransaction.id}/edit">Process</a><br><br>
            `);
          $('#new_transaction')[0][6].disabled = false
        }
      });
      e.preventDefault();
    });
  }
