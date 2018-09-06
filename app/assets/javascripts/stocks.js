$(document).on('turbolinks:load', function(){
  sortStocks();
});



function sortStocks(){
 let $sortedStocks = $('.sortedStocks')
  $('#stockSorter').on('click', function(e){
      $.get(`/users/${this.dataset.id}/stocks`, function(data){
        $sortedStocks.html("");
        var sortedData = data.sort(function(a, b){
          return a.company_name > b.company_name;
        });

        sortedData.forEach(e =>     $sortedStocks.append(`
          Company Name: ${e.company_name}<br>
          Shares Available: ${e.shares_available}<br>
          Price: $${e.price}<br><br>
          `)
          );
      }, "json"
    );
    });
}
