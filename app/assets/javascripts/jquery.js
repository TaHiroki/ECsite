$(document).on('turbolinks:load',function(){

    $('.jq-delete').click(function(){
        if(!confirm("本当に削除しますか？")){
            return false;
        }else{

        }
    });

    $('#buy').click(function(){
        if(!confirm("本当に購入しますか？")){
            return false;
        }else{
            
        }
    });

});