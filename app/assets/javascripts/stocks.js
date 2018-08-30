$(function(){
  stockBrowser();
})

  function stockBrowser(){
    $('#stock_browser').on('click', function(e){
      let $stocks = $('div.stocks')
      $stocks.html("")

      $.get('/users/' + this.dataset.user_id + '/shares/' + this.dataset.stock_id, function(data){
        debugger
      });



    })

  }
