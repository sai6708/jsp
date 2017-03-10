$(document).ready(function(){  
    var n=0;
    var z=null;
    var y=null;
    var alsodo=null;
    $("#save").click(function(){
        n=n+1;
        if(n<=6)
        {    
            alert("1");
            y=$('input:radio[name=1]:checked').val(); 
            alsodo=1;
            load(n,alsodo);            
            $('input:radio[name=1]:checked').each(function(){
     $(this).prop('checked', false); 
  });
        }
        else
        {
            alert("select another session");
            n=0;
        }
    });
    $("#list").change(function(){
        n=1;
        alsodo=0;        
        load(n,alsodo);
        alert("2");
    });
    function load(n,alsodo)
    {
        var x = document.getElementById("list").value;
        alert("3");
        $.post("d.jsp", {
             session : x,             
              sno :n,
              answer : y,
              quesno : z ,
              alsodo : alsodo
         },function(data, status){
             alert("4");
             var div=data.split("_split_");
            $('#question').text(div[0]); 
             $('#a').text("A : "+div[1]); 
              $('#b').text("B : "+div[2]); 
               $('#c').text("C : "+div[3]); 
                $('#d').text("D : "+div[4]);
                 $('#quesno').text("QUESTION NO:-"+div[5]);
                 z=div[5];
                 y=null;
    });       
    }
});
 
   
    
  


