
<!DOCTYPE html>
<html>
    <head>
         <script src="js/jquery-1.8.0.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>exam</title>
        <link rel="stylesheet" href="./css/exam.css"/>
        <script>
            
            function preventback(){window.history.forward();}
            setTimeout("preventback()",0);
            window.onunload=function (){null};
                    
              window.onbeforeunload = function() { 
    window.setTimeout(function () { 
        window.location = 'submit.jsp';
    }, 0); 
    window.onbeforeunload = null; // necessary to prevent infinite loop, that kills your browser 
}
                
            <!-- 
<% 
String clock = request.getParameter( "clock" ); 
if( clock == null ) clock = "2000"; 
%> 
    
var timeout = <%=clock%>; 
function timer() 
{ 
if( --timeout > 0 ) 
{    
document.forma.clock.value = timeout; 
window.setTimeout( "timer()", 1000 ); 
} 
else 
{ 
window.location ="submit.jsp";
document.forma.clock.value = "Time over"; 
///disable submit-button etc 

}

} 
//--> 
            
        </script>
    </head>
  
    <body> 
        <div id="timer">
        <form  name="forma"> 
        Seconds remaining:<input type="text" name="clock" value="<%=clock%>" style="border:0px solid white">         
        </form>
        </div>
    
          
<script> 
<!-- 
timer(); 

</script> 
        <div id="session">
        <h3>Select the session:</h3>        
        <select name="list" id="list">
            <option>        </option> 
            <option>computer</option> 
            <option>aptitude</option>
            <option>reasoning</option>
            <option>gk</option>
            <option>technical</option>
        </select> 
        </div>
        <br>
        <ul id="text">
           <li id="quesno"></li>
          <li id="question"></li>
          <li id="a">Tea</li>
          <li id="b">Coca Cola</li>
          <li id="c">waste</li>
          <li id="d">css</li>
        </ul>   
        
        <div id="options">
        A:<input type="radio" name="1" value="a" />
        B:<input type="radio" name="1" value="b"/>
        C:<input type="radio" name="1" value="c"/>
        D:<input type="radio" name="1" value="d"/>
        </div>
        <input class="button-block" type="submit"  id="save" value="SAVE & NEXT">
        
           <a href="submit.jsp" id="end" class="button2"><strong>END-EXAM</strong></a>            
            <p id="caution"></p>
    </body>
     <script src="js/exam.js"></script>
</html>
