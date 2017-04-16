$(function()
{
  $('#invite_friend').keyup(function (e) {
    if (e.keyCode==32) {
      console.log($(this).val())
      $.ajax({
        url: "/invite_friend",
        method: "post",
        data: {email: $(this).val().trim() },
        success: function(result){
          if (result.name!=undefined) {
            console.log(result);
            $("#friends").prepend(`
              <div class="col-sm-3">
              <h4>`+result.name+`</h4>
              <img src="`+result.img+`" width="80px" height="80px" class="img-thumbnail"/>
              <br/>
              <br>
              <a val=`+result.id+` href="" class='btn btn-danger'>
              <i class="icon-remove icon-white"></i>
              remove
              </a>
              </div>
              </div>`);
              $("#new_order").append('<input type="hidden" name="order[friends][]" value='+result.id+'>');
            }else {
              alert(result+" not valid email!");
            }
            $(this).val('')
          },
          error: function(error) {
            alert(error);
          }
        });
        $(this).val("");
    }
  })
})
