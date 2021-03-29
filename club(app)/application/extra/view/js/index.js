 flag=true;
$(document).ready(function(){
    if(flag){
        btnFlag=$("#btnRemove").detach();
        flag=false;
     }

      refreshCoopList();
      btnList();
      //下拉框改变
       $('#serverList').change(function(){
              refreshCoopList();
        });
});

   function refreshCoopList(){
        var strInput =$("#nameInput").val();
        var selectVal = $("#serverList").val();
        $.post('getClubList',{str:strInput,sltSort:selectVal},function(data){
            var content = '';
            if(data.success){
                    var coopdata = data.data;
                    for(var j = 0;j<coopdata.length;j++){
                        content+='<div data-am-widget="intro" class="am-intro am-cf am-intro-default">\
                                          <div class="am-intro-hd" >  \
                                            <h2 class="am-intro-title"><span class="am-icon-group am-fl">&nbsp;'+coopdata[j].Club_name+'</span></h2>\
                                                <a class="am-intro-more am-intro-more-top " href="#more"><i class="am-fr am-margin-left-xs"><span class="am-icon-heart am-text-danger am-text-sm"></span><span style="padding-bottom:0.8rem;margin-left:0.5rem;">'+coopdata[j].Good_nbr+'</span></i></a>\
                                          </div>\
                                        <div class="am-g am-intro-bd" style="margin:0;padding:0;">  \
                                            <div class="am-intro-right am-u-sm-12">\
                                    <div data-am-widget="list_news" class="am-list-news am-list-news-default" >\
                                      <div class="am-list-news-bd">\
                                      <ul class="am-list">\
                                         <!--缩略图在标题左边-->\
                                          <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left" style="border:0px solid #dedede;">\
                                            <div class="am-u-sm-4 am-thumbnails">\
                                              <a href="#" class="">\
                                                <img class="" src="'+coopdata[j].Image+'" alt="'+coopdata[j].Club_name+'"/>\
                                              </a>\
                                            </div>\
                                            <div class="am-u-sm-8 am-list-main">\
                                                <h2 class="am-list-item-hd"><a href="#" style="font-weight:bold;">'+coopdata[j].Title+'</a></h2>\
                                                <div class="" style="overflow : hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 3;-webkit-box-orient: vertical;">'+coopdata[j].Content+'</div>';

                    content+='</div></li></ul></div></div></div></div></div>';
                    }
                
                if(content=='')
                      content+='<div style="text-align:center;color:red;";><h3>抱歉,没有找到!</h3></div>';
                $("#list_div").html(content);
            }
        });
    }
    //按钮，多选框切换
    function btnList(){
        $("input").focus(function(){
          if($("#btnRemove").length == 0){
             $("<span class=\"am-input-group-btn\" id=\"btnRemove\"><button id=\"btnSubmit\" class=\"am-btn am-btn-primary am-round\" type=\"button\"><span>搜索</span></button></span>").insertAfter("#nameInput");
           }
             //按钮提交
             $("#btnSubmit").click(function(){
                  refreshCoopList();
                  $("#btnRemove").detach();
             });
        }); 
    }