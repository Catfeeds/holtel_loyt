// JavaScript Document
(function(){
var doc=document;
addLoadEvent = function(func){var oldonload=window.onload;if (typeof window.onload !='function'){window.onload=func;}else{window.onload=function(){oldonload();func();}}}
  
//删除这个class
function removeClass(ele,cls) {if(hasClass(ele,cls)){var reg = new RegExp('(\\s|^)'+cls+'(\\s|$)');ele.className=ele.className.replace(reg,' ');}} 
//添加class
function addClass(ele,cls) {if(!hasClass(ele,cls)) ele.className += " "+cls;}
  //通过class获取元素
function getByClass(classname,ele){
if(typeof ele == 'string'){ele=doc.getElementById(ele)}
var nodes = ele ? ele.getElementsByTagName('*') : doc.getElementsByTagName('*'), 
ret=[];
for(var i=0;i<nodes.length;i++){
if(hasClass(nodes[i],classname)){ret.push(nodes[i]);}
} 
return ret; 
}
/***获取class****/
function getByClass2(oparent,oclass){
    try{
        return oparent.querySelectorAll("."+oclass);
    }catch (ex){
            var reset = [];
            var reg = new RegExp("\\b" + oclass + "\\b");
            var oCur = oparent.all;
            for (var i = 0; i < oCur.length; i++) {
                if (reg.test(oCur[i].className)) {
                    reset.push(oCur[i]);
                }
            };
          return reset;
    }
}
//判断是否有这个class
function hasClass(node,className){ 
var names = node.className.split(/\s+/); 
for(var i=0;i<names.length;i++){ 
if(names[i]==className) 
return true; 
}return false;
} 
//下一个兄弟元素
function getNextSibling(startBrother){endBrother=startBrother.nextSibling;while(endBrother.nodeType!=1){endBrother = endBrother.nextSibling;}return endBrother;}

  
function isMouseLeaveOrEnter(e,handler,eleName) {if (e.type != 'mouseout' && e.type != 'mouseover') return false;var reltg = e.relatedTarget ? e.relatedTarget : e.type == 'mouseout' ? e.toElement : e.fromElement;while (reltg && reltg != handler && reltg.nodeName!=eleName)reltg = reltg.parentNode;return (reltg != handler);}  
function getDocSize(){
   if(doc.compatMode == 'BackCompat')//BackCompat和CSS1Compat
   return {width:Math.max(doc.body.clientWidth,doc.body.scrollWidth),
           height:Math.max(doc.body.clientHeight,doc.body.scrollHeight)
	   };
   //opare9.0在有滚条时 client 和scroll都是文档高度  没滚条时client为文档高度 scroll为可视区高度 和其他浏览器相反  
   return {width:Math.max(doc.documentElement.clientWidth,doc.documentElement.scrollWidth),
           height:Math.max(doc.documentElement.clientHeight,doc.documentElement.scrollHeight)
	   };
}
function getCoords(el){
  var box = el.getBoundingClientRect(),
  doc = el.ownerDocument,
  body = doc.body,
  html = doc.documentElement,
  clientTop = html.clientTop || body.clientTop || 0,
  clientLeft = html.clientLeft || body.clientLeft || 0,
  top  =Math.floor( box.top  + (self.pageYOffset || html.scrollTop  ||  body.scrollTop ) - clientTop ),
  left =Math.floor( box.left + (self.pageXOffset || html.scrollLeft ||  body.scrollLeft) - clientLeft )
  return { 'top': top, 'left': left };
}
//-----------------------------------------------------------------------------------------------
function getViewport(){if(window.innerHeight)return {width:window.innerWidth,height:window.innerHeight};if(doc.compatMode == 'BackCompat')return {width:doc.body.clientWidth,height:doc.body.clientHeight};return {width:Math.max(doc.documentElement.clientWidth,doc.documentElement.scrollWidth),height:Math.max(doc.documentElement.clientHeight,doc.documentElement.scrollHeight)};}


function css(obj, attr, value)
{
	switch (arguments.length)
	{
		case 2:
			if(typeof arguments[1] == "object")
			{
				for (var i in attr) i == "opacity" ? (obj.style["filter"] = "alpha(opacity=" + attr[i] + ")", obj.style[i] = attr[i] / 100) : obj.style[i] = attr[i];
			}
			else
			{	
			    if(attr == "opacity"){return obj.currentStyle ? obj.currentStyle[attr]*100 : getComputedStyle(obj, null)[attr]*100}
				else{return obj.currentStyle ? obj.currentStyle[attr] : getComputedStyle(obj, null)[attr]}
			}
			break;
		case 3:
			attr == "opacity" ? (obj.style["filter"] = "alpha(opacity=" + value + ")", obj.style[attr] = value / 100) : obj.style[attr] = value;
			break;
	}
};

function animate(obj, sStyleName, nNedV, time, fn){
	var nStartTime = + new Date(),
	    nStartV = parseFloat(css(obj, sStyleName)),
	    sUnit = sStyleName == 'opacity' ? '' : 'px',
        nDistance = nStartV - nNedV;
		
		function easeInOutCubic(pos){
          if ((pos/=0.5) < 1) return 0.5*Math.pow(pos,3);
          return 0.5 * (Math.pow((pos-2),3) + 2);
        }
		
	 if(obj['_' + sStyleName]){clearInterval(obj['_'+sStyleName])};
	 
     obj['_'+sStyleName] = setInterval(function (){
		   var nFraction = easeInOutCubic((+new Date() - nStartTime) / time), 
		       thisV = nStartV - nDistance * nFraction,
		       oCss = {};
		   if(nFraction < 1){
			   oCss[sStyleName] = (thisV) + sUnit;
			   css(obj, oCss);
		   }else if(nFraction > 1){
			   oCss[sStyleName] = (nNedV) + sUnit;
			   css(obj, oCss);
			   if(fn) fn();
			   clearInterval(obj['_' + sStyleName]);
			   obj = null;
		   }
    }, 20);
}   


show_list = function (btn){

	var LB=getNextSibling(btn),
	    parentEle=btn.parentNode;
		
		if(!-[1,]&&!window.XMLHttpRequest){//ie6
		LB.style.width=btn.offsetWidth-14+'px';
	    }else{LB.style.minWidth=btn.offsetWidth-14+'px';}
		
		LB.style.display='block';
		
	parentEle.onmouseout=function(e){
		var e=e||window.event,fuEle;
		var ele=e.target||e.srcElement;
				
		if (isMouseLeaveOrEnter(e,this,parentEle.nodeName)) {
		LB.style.display='none';
	    };		
	}
	return false;
}
index_js_setFl = function(btn,textId,hiddenId){
    
	if(hiddenId)doc.getElementById(hiddenId).value=btn.getAttribute('v');
	doc.getElementById(textId).firstChild.nodeValue=btn.firstChild.nodeValue;

}
//-----------------------------------------------------------------------------------------------





/////////////////////////////////////////////////导航
addLoadEvent(_nav);
function _nav(){
   var ulEle=doc.getElementById('top'),
       allLiEle=ulEle.getElementsByTagName('li'),
       liEle=[],
	   ulW=ulEle.offsetWidth;
   
   for(var k=0;k<allLiEle.length;k++){
	   var thisLi_=allLiEle[k];
       if(thisLi_.className!='nav_line'){liEle.push(thisLi_)}
   }
   for(var i=0;i<liEle.length;i++){
	   var thisLi=liEle[i];
	   thisLi.onmouseover=function(e){
	      var e=e||window.event,
		      ele=e.target||e.srcElement;
		  
		  if (isMouseLeaveOrEnter(e,this,'LI')) {
		     var thisP=this.getElementsByTagName('div')[0];
			 
			 if(!-[1,]&&!window.XMLHttpRequest && this.className!='in'){this.className='ie6Hover'}
			 if(!thisP){return false}
			 thisP.style.display='block';
			 
			 var num=ulW-this.offsetLeft-thisP.offsetWidth;
			 //if(num>=0){thisP.style.left=0;}else{thisP.style.left=num+'px';}
			 
			 /*
			 var num=(this.offsetWidth-thisP.offsetWidth)/2;
			 if(this.offsetLeft+num+thisP.offsetWidth>ulW){num=ulW-this.offsetLeft-thisP.offsetWidth}
			 thisP.style.left=num+'px';
			 */
	      }
	   }
	   thisLi.onmouseout=function(e){
	      var e=e||window.event,
		      ele=e.target||e.srcElement;
		  
		  if (isMouseLeaveOrEnter(e,this,'LI')) {
		     var thisP=this.getElementsByTagName('div')[0];
			 if(!-[1,]&&!window.XMLHttpRequest && this.className!='in'){this.className=''}
			 if(!thisP){return false}
			 thisP.style.display='none';
	      }
	   }
   }
  
}
addLoadEvent(_nav1);
function _nav1(){
   var ulEle=doc.getElementById('nav'),
       allLiEle=ulEle.getElementsByTagName('li'),
       liEle=[],
	   ulW=ulEle.offsetWidth;
   
   for(var k=0;k<allLiEle.length;k++){
	   var thisLi_=allLiEle[k];
       if(thisLi_.className!='nav_line'){liEle.push(thisLi_)}
   }
   for(var i=0;i<liEle.length;i++){
	   var thisLi=liEle[i];
	   thisLi.onmouseover=function(e){
	      var e=e||window.event,
		      ele=e.target||e.srcElement;
		  
		  if (isMouseLeaveOrEnter(e,this,'LI')) {
		     var thisP=this.getElementsByTagName('p')[0];
			 
			 if(!-[1,]&&!window.XMLHttpRequest && this.className!='in'){this.className='ie6Hover'}
			 if(!thisP){return false}
			 thisP.style.display='block';
			 
			 var num=ulW-this.offsetLeft-thisP.offsetWidth;
			 if(num>=0){thisP.style.left=0;}else{thisP.style.left=num+'px';}
			 
			 /*
			 var num=(this.offsetWidth-thisP.offsetWidth)/2;
			 if(this.offsetLeft+num+thisP.offsetWidth>ulW){num=ulW-this.offsetLeft-thisP.offsetWidth}
			 thisP.style.left=num+'px';
			 */
	      }
	   }
	   thisLi.onmouseout=function(e){
	      var e=e||window.event,
		      ele=e.target||e.srcElement;
		  
		  if (isMouseLeaveOrEnter(e,this,'LI')) {
		     var thisP=this.getElementsByTagName('p')[0];
			 if(!-[1,]&&!window.XMLHttpRequest && this.className!='in'){this.className=''}
			 if(!thisP){return false}
			 thisP.style.display='none';
	      }
	   }
   }
  
}
/*
box    盒子
num    显示几个li
liw    一个li盒子所占宽度 包括外边距
bAuto  可选 是否自动轮播
b      可选 设置true时 bAuto的值应该为true 鼠标经过ul时是否关闭轮播
*/
addLoadEvent(function(){
  if(doc.getElementById('picShow_2')){
	  picShow(doc.getElementById('picShow_2'),3,339,true,true)
  }
  /*if(doc.getElementById('picShow_3')){
	  picShow(doc.getElementById('picShow_3'),3,339,true,true)
  }*/
});
function picShow(boxs,num,liW,bAuto,b){
	var ul=boxs.getElementsByTagName('ul')[0],
	    btnL=boxs.getElementsByTagName('a')[0],
		btnR=boxs.getElementsByTagName('a')[1],
		allLi=ul.getElementsByTagName('li'),
		minLeft=-(allLi.length)*liW,
		maxLeft=-(num-1)*liW,
		bBtn=false,//当动画运行时 点击事件无效
		addLi='';
		if(allLi.length<=num){return false}
		var k=0;
		for(var i=0;i<2*num-1;i++){
			if(k>=allLi.length){k=0}
		    addLi+='<li>'+allLi[k].innerHTML+'</li>';
			k++;
		}
		ul.innerHTML+=addLi;
		
	btnL.onclick=btnR.onclick=function(){clickFun(this,num);return false;};
		
	if(bAuto&&b){
		 ul.onmouseover=function(){bAuto=false}
	     ul.onmouseout =function(){bAuto=true}
	}
	if(bAuto){
		 setTimeout(cycle,5000);
		 //如果是自动轮播 当鼠标经过两边按钮时关闭自动轮播
		 btnL.onmouseover=btnR.onmouseover=function(){bAuto=false}
	     btnL.onmouseout =btnR.onmouseout =function(){bAuto=true}
	}
	function cycle(){
	  if(!bAuto){setTimeout(cycle,5000);return false;}
	  clickFun(btnR,1);
	  setTimeout(cycle,5000);
	 
    }
	function clickFun(ele,goNum){
		if(bBtn){return false;}//这里应该写在注册事件前面的 但是为了兼容ie6的hover a要给# 所以在不需要滚动的时候 a按钮也要false一下
		bBtn=true;
	    var nLeftV=parseFloat(css(ul,'left'));
		if(hasClass(ele,"L")){
			
			if(nLeftV>=maxLeft){
				nLeftV+=minLeft;
				css(ul,'left',nLeftV+'px');
			}
			nLeftV+=goNum*liW;
		}
		else if(hasClass(ele,"R")){
			if(nLeftV<=minLeft){
				nLeftV-=minLeft;
				css(ul,'left',nLeftV+'px');
			}
			nLeftV-=goNum*liW;
		}
		animate(ul,'left',nLeftV,800,function(){bBtn=false});
	}
};
addLoadEvent(function(){
	if(!doc.getElementById("side")){return false}
     var map=doc.getElementById("side"),
         oul=map.getElementsByTagName("ul")[0],
         oli=oul.getElementsByTagName("li");
         for (var i = 0; i < oli.length; i++) {
         	oli[i].onmouseover=function(){
         	      var op=this.children[1];
         	      if(!-[1,]&&!window.XMLHttpRequest && this.className!='in'){this.className='ie6Hover';}
                 if(op){
                 	op.style.display="block";
                 }
         		 
         	}
         	oli[i].onmouseout=function(){
         		 var op=this.children[1];
         		  if(!-[1,]&&!window.XMLHttpRequest && this.className!='in'){this.className=''}
         		  if(op){
                 	 op.style.display="none";
                 }
         		
         	 }
         };
        
	
})	

})();



$(function(){
		   
		   menu();
		   menu1();
		   tabs(".Product .title h2 a");
		   tabs(".gyqh1 .title h2 a");
		   
		   tabs(".new .title h2 a");
		   tabs1(".Details_tab .title h2 a");	   
})

function menu(){
	   $(".menu .nav ul li a").mouseover(function(){	
		   $(this).parent("li").removeClass("no");									  
		   $(this).parent("li").addClass("act").siblings().removeClass("act").removeClass("no");	
		   $(this).parent("li").prev().addClass("no");
		});
	
	}
	
function tabs(obj){
	        var len= $(obj).length; 
			$(obj).first().addClass("active");
			$(obj).parent().siblings(".more:first").show();
			$(obj).parent().parent().siblings(".tabli:first").show();
	        $(obj).mousemove(function(){
			   		var index=$(obj).index(this);				  
	                $(obj).removeClass("active").eq(index).addClass("active");		
					$(obj).parent().siblings(".more").hide().eq(index).show();
					$(obj).parent().parent().siblings(".tabli").hide().eq(index).show();
					
			});
	
}
function menu1(){
	   $(".menu1 .nav ul li a").click(function(){	
		   $(this).parent("li").removeClass("no");									  
		   $(this).parent("li").addClass("act").siblings().removeClass("act").removeClass("no");	
		   $(this).parent("li").prev().addClass("no");
		});
	
	}
	
function tabs1(obj){
	        var len= $(obj).length; 
			$(obj).first().addClass("active");
			$(obj).parent().siblings(".more:first").show();
			$(obj).parent().parent().siblings(".tabli:first").show();
	        $(obj).click(function(){
			   		var index=$(obj).index(this);				  
	                $(obj).removeClass("active").eq(index).addClass("active");		
					$(obj).parent().siblings(".more").hide().eq(index).show();
					$(obj).parent().parent().siblings(".tabli").hide().eq(index).show();
					
			});
	
}


$(document).ready(function(){
	for(i=0; i<$(".Guide_nav ul li").length ; i++){
		$(".Guide_nav ul li a span").eq(i).css("background","url(images/Guide"+(i +8 )+ ".png) no-repeat left center" )
		
		}
	for(i=0; i<$(".Dynamic ul li").length ; i=i+2){
	$(".Dynamic ul li a").eq(i).css("background","#f2f2f2" )
	
	}
	for(i=1; i<$(".xiaz_01 li").length ; i=i+2){
		
	$(".xiaz_01 li a").eq(i).css("background","#f2f2f2" )
	
	}
	for(i=1; i<$(".zp_list tr").length ; i=i+2){
		
	$(".zp_list tr").eq(i).css("background","#f2f2f2" )
	
	}
	for(i=0; i<$(".Guide .Recommend ul li").length ; i=i+4){
		
	$(".Guide .Recommend ul li").eq(i).css("padding-left","0" )
	
	}
	$(function(){
	$('.partner_ul li').hover(function() {
		$(this).find('img').stop(true,true).animate({
			'width':148,
			'height':84,
			'top':5,
			'right':10
		},300);
	}, function() {
		$(this).find('img').stop(true,true).animate({
			'width':168,
			'height':94,
			'top':0,
			'right':0
		},300);
	});
});
	$(".Details_tab .tabli2 ul li").click(function (e) {
		for(i=0; i<$(".Details_tab .tabli2 ul li").length ; i++){
		var dataImg = $(".Details_tab .tabli2 ul li").eq(i).attr('data-img'),
			dataVid = $(".Details_tab .tabli2 ul li").eq(i).attr('data-vid');
		//alert(dataImg)
		function dataIMG(){
			$(".Details_tab .tabli2 ul li").eq(i).html("<a><img src='"+dataImg+"' width='760' height='360' alt='' /><p></p><span></span>")
			
			}
			dataIMG();
			
			
			}
		var tdataImg =$(this).attr('data-vid')
		dataIMG();
		$(this).html('<object type="application/x-shockwave-flash" autostart="false" data="/images/vcastr3.swf" width="760" height="360" id="vcastr3"><param name="movie" value="/images/vcastr3.swf" /><param name="allowFullScreen" value="true" /><param name="wmode" value="transparent"><param name="FlashVars" value="xml={vcastr}{channel}{item}{source}'+tdataImg+'{/source}{duration}{/duration}{title}{/title}{/item}{/channel}{config}{controlPanelBgColor}0x010101{/controlPanelBgColor}{isAutoPlay}true{/isAutoPlay}{isLoadBegin}true{/isLoadBegin}{/config}{/vcastr}" /></object>')
		
	});
	$(".scp_zh ul li").click(function (e) {
		
		var tdataImg =$(this).attr('data-vid')
		
		$(this).html('<object type="application/x-shockwave-flash" autostart="false" data="/images/vcastr3.swf" width="760" height="360" id="vcastr3"><param name="movie" value="/images/vcastr3.swf" /><param name="allowFullScreen" value="true" /><param name="wmode" value="transparent"><param name="FlashVars" value="xml={vcastr}{channel}{item}{source}'+tdataImg+'{/source}{duration}{/duration}{title}{/title}{/item}{/channel}{config}{controlPanelBgColor}0x010101{/controlPanelBgColor}{isAutoPlay}true{/isAutoPlay}{isLoadBegin}true{/isLoadBegin}{/config}{/vcastr}" /></object>')
		
	});
	
　　
}); 




