$(document).ready(function(){
     tabs1(".product-tab .title h2 a");	
      // alert($(".subNva .subNav_main a").size());
        /*$(".subNva .subNav_main").each(function(index){     
        $(this).live('click',function(){
            //alert($(this).parent().next().html());
            //$(".up-content").eq(index).css({
             //   "display":"block",
            //});
            //alert($(this).next().html());
            $(this).next().show().css({
                "display":"block",
            })
            //setTimeout($(this).next().show(),100);
            //$(this).next().removeClass("navContent-hidde").hasClass("navContent-show");
        });
    }); */
	/*$("#firstpane .menu_body:eq(0)").show();
	$("#firstpane h3.menu_head").click(function(){
       // alert($("#firstpane h3.menu_head").children("span").size());
		$(this).next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
        if ($(this).children().hasClass("glyphicon-minus")){
            $(this).children().removeClass("glyphicon-minus").addClass("glyphicon-plus");
            //$("#firstpane h3.menu_head").children().siblings().removeClass("glyphicon-minus");
         }else{
            $(this).children().removeClass("glyphicon-plus").addClass("glyphicon-minus");
           // $("#firstpane h3.menu_head").children().siblings().removeClass("glyphicon-plus");
         }

	});*/
    $("#firstpane .menu_body:eq(0)").show();
	$("#firstpane h3.menu_head").click(function(){
		//alert($(this).addClass("current").next("div.menu_body").html());
		$(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
		$(this).siblings().removeClass("current");
	});
	
    /*$(".product-tab .title a").each(function(){
      $(this).click(function(){
        //alert($(this).get());
        $(this).addClass("active");
        });  
    });*/

    $(".product-tab .title h2 a").click(function(){
        //alert($(this).hasClass('active'));
        //$(this).addClass("active").siblings().removeClass("active");
        //alert($(this).hasClass('active'));
        //$(this).addClass("active").siblings().removeClass();
        //$(".product-tab .title h2 a").removeClass("active")
        /*$(this).parent().find("a").css({
            "background": "red",
            "color": "#ffffff",
            "box-shadow": "3px 3px 10px #888888"
        });*/
    });
    
    $(".tabli video").click(function(){
       	if(this.paused){
		        this.play();	
            }else{
                this.pause();
        }
    });
    /*$(".product-tab .title h2 a").click(function(){
        if($(this).hasClass("active")){ 
            $(this).addClass("active").parent("h2").siblings("h2").find("a").removeClass("active");
        }
    }); */

    function tabs1(obj){
	        var len= $(obj).length;
			$(obj).first().addClass("active");
			//$(obj).parent().siblings(".more:first").show();
			$(obj).parent().parent().siblings(".tabli:first").show();
	        $(obj).click(function(){
			   		var index=$(obj).index(this);
                    //alert(index);
	                $(obj).removeClass("active").eq(index).addClass("active");
					//$(obj).parent().siblings(".more").hide().eq(index).show();
					$(obj).parent().parent().siblings(".tabli").hide().eq(index).show();
			});
	}
    
    
    
   /* var ie6 = document.all;
    var dv = $('.new-products'), st;
    alert(st);
    dv.attr('otop', dv.offset().top); //存储原来的距离顶部的距离 
    $(window).scroll(function () { 
        st = Math.max(document.body.scrollTop || document.documentElement.scrollTop);
        if (st > parseInt(dv.attr('otop'))) {
        if (ie6) {//IE6不支持fixed属性，所以只能靠设置position为absolute和top实现此效果
            dv.css({ position: 'absolute', top: st });
        } else if (dv.css('position') != 'fixed')
            dv.css({ 'position': 'fixed', top: -20 });
        } else if (dv.css('position') != 'static')
           dv.css({ 'position': 'static' });
    }); */

    var elm = $('.new-products');
    var startPos = $(elm).offset().top;
    $.event.add(window, "scroll", function() {
        var p = $(window).scrollTop();
        $(elm).css({
            'position':((p) > startPos) ? 'static' : 'static',
        });
        $(elm).css('top',((p) > startPos) ? '-20px' : '');
        //((p) > startPos) ? $(elm).addClass('col-xs-3').css({"clear":"both"}):$(elm).removeClass('col-xs-3');
    });



    var elm1 = $('.title');
    var startPos1 = $(elm1).offset().top;
    $.event.add(window, "scroll", function() {
        var p1 = $(window).scrollTop();
        $(elm1).css('position',((p1) > startPos) ? 'fixed' : 'static');
        $(elm1).css('top',((p1) > startPos) ? '100px' : '');
        //((p1) > startPos1) ? $(elm1).removeClass('col-xs-12').addClass('col-xs-2'):$(elm1).removeClass('col-xs-2').addClass('col-xs-12');
    });


    $(window).scroll(function(){
        var scrollTop=$(this).scrollTop();
        var scrollHeight=$(document).height();
        var windowHeight=$(this).height();
       if(((scrollHeight-windowHeight-scrollTop)<=200)){
           //alert($(elm).html());
           $('.new-products').css({
               "display" : "none",

           });
       }else{
           $('.new-products').css({
               "display" : "block"
           });
       }
    });


});