$(function()
{
  $('#pushOrder').click(function (e) {
      var user_id=$('#user_id').val()
      var user_name=$('#user_name').val()
      var order_id=$('#order_id').val()
      var item=$('#item').val()
      var price=$('#price').val()
      var amount=$('#amount').val()
      var comment=$('#comment').val()
          $.ajax({
            url: "/users/1/orders/1/order_details",
            method: "post",
            data: {u_id: user_id,
                    o_id: order_id,
                    item: item,
                    price: price,
                    amount: amount,
                    comment: comment
                  },
            success: function(result){
                console.log(result);
                 $("table tbody").append(`  <tr>

                     <td>`+user_name+`</td>
                     <td>`+item+`</td>
                     <td>`+amount+`</td>
                     <td>`+price+`</td>
                     <td>`+comment+`</td>

                   </tr>`);
            },
            error: function(error) {
              alert(error);
           }
        });//end ajax method
  })
  function getOrders() {
      // if ($('#order_id').val()!=undefined) {
      //   window.setInterval(function(){
      //     console.log('njjj')
      //
      //   },3000)
      }
  }
})
