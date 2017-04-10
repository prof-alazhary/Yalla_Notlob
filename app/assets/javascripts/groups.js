var ready;
ready = function () {

  $("#addGroup").click(function(e){
    console.log("i am heeer");
    g_name=$("#group_name").val();
      $.ajax({
        url: "/users/1/groups",
        method: "post",
        data: {name: g_name.trim()},
        success: function(result){
          console.log(result)
          $("#allGroups").prepend(`<div id='group_row' class='row'>
          <div class='col-sm-4'>
              <h5>`+result.name+`</h5>
        </div>
        <div class='col-sm-4'>
          <button id='add_members' name='`+result.name+`' val='`+result.id+`' class='glyphicon glyphicon-plus-sign btn btn-primary'></button>
        </div>
        <div class='col-sm-4'>
          <button id='delete_group' name='`+result.name+`' val='`+result.id+`' class='glyphicon glyphicon-remove-sign btn btn-danger'></button>
        </div>
        </div>
        <br/>`)
        },
        error: function(error) {
          alert(error);
       }
    });
  });

  $('#allGroups').on('click', 'button' ,function (e) {
    var group_name=$(e.target).attr('name')
    var group_id=$(e.target).attr('val')
    if($(e.target).attr('id')=='add_members') {
        $('#g_title').text(group_name);
        $('#g_title').attr('val',group_id);
        $('#members').empty();
        $.ajax({
          url: '/get_all_members',
          method: 'post',
          data: {g_id: group_id },
          success: function (result) {
            console.log(result);
            result.members.forEach(function (item) {
              $("#members").prepend(`
                  <div class="col-sm-3">
                  <h4>`+item.name+`</h4>
                  <img src="`+item.img+`" width="80px" height="80px" class="img-thumbnail"/>
                <br/>
                    <br>
                    <a val=`+item.id+` href="" class='btn btn-danger'>
                    <i class="icon-remove icon-white"></i>
                    remove
                    </a>
                    </div>
              </div>`)
            })
          },
          error: function (error) {
            alert(error);
          }
        })
    }else {
        $(e.target).parents('#group_row').remove();
        $('#members').empty();
        $('#g_title').text('sellect Group');
        $('#g_title').attr('val','0');
        $.ajax({
          url: '/users/1/groups/'+group_id+'',
          method: 'DELETE',
          success: function (result) {
            console.log(result);
          },
          error: function (error) {
            console.log(error);
          }
        })
    }
  })

  $('#addFriend').click(function () {

    g_name=$("#group_name").val();
      $.ajax({
        url: "/add_member",
        method: "post",
        data: {email: $('#friend_email').val().trim(), g_id: $('#g_title').attr('val') },
        success: function(result){
          if (result.name!=undefined) {
            console.log(result);
            $("#members").prepend(`
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
            </div>`)
          }else {
            alert(result+" not valid email!");
          }

        },
        error: function(error) {
          alert(error);
       }
    });

  })
}
////////////////////////////////////////////////////////
$(document).ready(ready);
$(document).on('page:load', ready);
