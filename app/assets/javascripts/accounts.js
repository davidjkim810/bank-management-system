$(document).on('turbolinks:load', function(){
  toggleTransactionForm();
  newTransaction();
});

  function toggleTransactionForm(){
    $(".transaction-link").on('click', function(e){
      $('div.quickTransactionForm').toggle();
    });
  }

  function newTransaction(){
    $('#new_transaction').on('submit', function(e){
      debugger
        $.ajax({
        type: this.method,
        url: this.action,
        data: $(this).serialize(),
        success: function(response){
          var $transactions = $('div.transactions')
          $transactions.append(response);
        }

      });
      e.preventDefault();
    });
  }
