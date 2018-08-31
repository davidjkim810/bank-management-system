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
      let $stocks = $('div.stocks');
      let $stockId =  $('#stock_browser')[0].dataset.stock_id;
      let userShareLength = $('#stock_browser')[0].dataset.share_length;
      let shareIndex = parseInt($('#stock_browser')[0].dataset.share_index);
        shareIndex += 1;

      if (shareIndex <= userShareLength - 1) {
        $.get('/users/' + this.dataset.user_id + '/shares/' + this.dataset.stock_id, function(data){

          $('#stock_browser')[0].dataset.share_index = shareIndex;

          $stockId = $('#stock_browser')[0].dataset.stock_id =  data.user.shares[shareIndex].id.toString();

          $.get('/users/' + data.user.id + '/shares/' + $stockId, function (data){
            var newShare = new Share(data)

            $stocks.html("")
            $stocks.append(`
              <p>Company Name: ${newShare.company_name}<br>
              Shares: ${newShare.quantity}<br>
              Equity: $${newShare.price * newShare.quantity}</p>
              `)
          });
        });
      };
    });
  }

  function nextStockBrowser(){
    
  }
