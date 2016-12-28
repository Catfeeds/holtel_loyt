$(document).ready(function(){
    $(".products ul li").each(function(index){     
        $(this).mouseover(function(){
            $(".up-content").eq(index).css({
                "display":"block",
            });
        });
        $(this).mouseleave(function(){
            $(".up-content").eq(index).css({
                "display":"none",
            });
        });
        
    }); 
   // alert($(".more-Category"));
    $(".more-Category").click(function(){
       // alert($(".Category").height());
        /*$("div.Category").animate({
            height:'250px',
            opacity:'0.4'
        },"slow");*/
        //alert("更多");
        //$(".Category").height()+="150px";
    });
    
    

});