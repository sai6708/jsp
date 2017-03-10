
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Sign-Up/Login Form</title>
    
    <link rel="stylesheet" href="./css/normalize.css"/>
    <link rel="stylesheet" href="./css/login.css"/>
      <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  </head>
<body>
  <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Sign Up </h1>
          
          <form >
          
          <div class="top-row">
            <div class="field-wrap">
              <label>
                DEPARTMENT<span class="req">*</span>
              </label>
              <input type="text" required autocomplete="off" name="dept" id="dept"/>
            </div>
        
            <div class="field-wrap">
              <label>
                Name<span class="req">*</span>
              </label>
                <input type="text"required autocomplete="off" name="name" id="name"/>
            </div>
          </div>

          <div class="field-wrap">
            <label>
              ROLL NUMBER<span class="req">*</span>
            </label>
            <input type="text"required autocomplete="off" name="rollno" id="rollno"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Set A Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off" name="pass" id="pass"/>
          </div>          
          <button type="submit" class="button button-block" name="reg" id="sign"/>Get Started</button>          
          </form>
        </div>        
        <div id="login">   
          <h1>Welcome Back!</h1>          
          <form action="./login.jsp" method="post">          
            <div class="field-wrap">
            <label>
              ROLL NUMBER<span class="req">*</span>
            </label>
            <input type="text"required autocomplete="off"  name="rollno"/>
          </div>          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off"  name="pass"/>
          </div>          
                   
          <button class="button button-block"/>Log In</button>          
          </form>
        </div>        
      </div><!-- tab-content -->      
</div> <!-- /form -->
     <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
     <script src="js/login.js"></script>
     <script>
         $(document).ready(function (){            
         $("#sign").click(function (){           
             var name=$('#name').val();
             var dept=$('#dept').val();
             var rollno=$('#rollno').val();
             var pass=$('#pass').val();
         $.ajax({               
             data:{name:name,
                    dept:dept,
                    rollno:rollno,
                    pass:pass
            },
             type:'GET',             
             url:'reg.jsp',             
             success: function () {
                        alert("registration success");
                    }
         });
         return false;
         });
         });
     </script>
</body>
</html>
