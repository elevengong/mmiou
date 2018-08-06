function $(id){return document.getElementById(id);}
var n=0;
var mybox = document.getElementById("newbox");
var mylist = $("plist").getElementsByTagName("li");
var mytitle = $("imgtitle").getElementsByTagName("li");
var mybtn = $("imgbtn").getElementsByTagName("li");
mylist[0].style.display="block";
mytitle[0].style.display="block";
mybtn[0].className="newon";
function picfocus(value){
   n=value;
   setBg(value);
   plays(value);
}
function setBg(value){
   for(var i=0;i<5;i++){
	  if(i==value){
         mytitle[i].style.display="block";
         mybtn[i].className="newon";
	  }else{
         mytitle[i].style.display="none";
	     mybtn[i].className="";
	  }
   }
}
function plays(value){
   try{
      with (plist){
         filters[0].Apply();
         for(i=0;i<5;i++)i==value?children[i].style.display="block":children[i].style.display="none";
         filters[0].play();
      }
   }
   catch(e){
      for(i=0;i<5;i++)i==value?mylist[i].style.display="block":mylist[i].style.display="none";
   }
}
function clearAuto(){clearInterval(autoStart)}
function setAuto(){autoStart=setInterval("auto(n)",3000)}
function auto(){
   n++;
   if(n>4){n=0;};
   picfocus(n);
}
mybox.onmouseover = function (){
   clearAuto();
}
mybox.onmouseout = function (){
   setAuto();
}
for(var u=0;u<5;u++){
   mybtn[u].uid=u;
   mybtn[u].onmouseover=function(){picfocus(this.uid);clearAuto();}
}
setAuto();