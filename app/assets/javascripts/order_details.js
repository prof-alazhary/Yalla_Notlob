$(function()
{
  $('#pushOrder').click(function (e) {
      var u_id=$('#user_id').val()
      var o_id=$('#order_id').val()
      var item=$('#item').val()
      var price=$('#price').val()
      var amount=$('#amount').val()
      var comment=$('#comment').val()
          $.ajax({
            url: "/users/1/orders/1/order_details",
            method: "post",
            data: {user_id: u_id,
                    order_id: o_id,
                    item: item,
                    price: price,
                    amount: amount,
                    comment: comment
                  },
            success: function(result){
                console.log(result);
                 $("table tbody").append(`  <tr>

                     <td>`+result.user_name+`</td>
                     <td>`+item+`</td>
                     <td>`+price+`</td>
                     <td>`+amount+`</td>
                     <td>`+comment+`</td>

                   </tr>`);
            },
            error: function(error) {
              alert(error);
           }
        });//end ajax method

  })
})
