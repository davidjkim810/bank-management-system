$(function(){
  stockBrowser();
})

  class Share {
    constructor(data){
      this.id = data.id;
      this.price = data.price;
      this.quantity = data.quantity;
      this.company_name = data.stock.company_name;
    }
  }

  function stockBrowser(){
    $('#stock_browser').on('click', function(e){
      let $stocks = $('div.stocks')
      $stocks.html("")

      $.get('/users/' + this.dataset.user_id + '/shares/' + this.dataset.stock_id, function(data){
debugger
        var newShare = new Share(data)
        $stocks.append(`
          <p>Company Name: ${newShare.company_name}<br>
          Shares: ${newShare.quantity}<br>
          Equity: $${newShare.price * newShare.quantity}</p>
          `)
      });

      $('#stock_browser')[0].dataset.share_index = parseInt($('#stock_browser')[0].dataset.share_index) + 1;

      $('#stock_browser')[0].dataset.stock_id = `"<%= @user.shares[${$('#stock_browser')[0].dataset.share_index}].id %>"`

    })

  }
