$(document).ready(function(){
      refreshUserList();  
});
   function refreshUserList(){
        $.post('getUserList',{},function(data){
            if(data.success){
                    var userdata = data.data;
                    $('#username').text(userdata[0].Nickname);
                    $('img').attr({"src":userdata[0].image});
                   } 
                 });
   
    }