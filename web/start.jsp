<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement" %>
<html>
    <head>
        <title>EXAM INSTRUCTION</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            ul{
                background: #F5F5F5;
                width: 95%;
                overflow: hidden;
                height: 50px;
                margin: 0;
                list-style-type: none;
                
            }
            #header li{
                float: left;
                color: black;
                font-size: 20px;
                text-align: center;
                padding: 13px;
               
            }
            #header li a{
                float: right;
                padding: 0px 15px;
                color: black;
                font-size: 20px;
                text-align: center;                
            }
            ol {
                 font-family: "Trebuchet MS", Helvetica;
                 background: #99CCFF;
                 margin: 10px;
                padding: 50px;
                color: black;
                width: 90%;
             }
           
            
               
            p{
                font-size: 30px;
                color: rgb(59, 145, 195);
                font-family: Impact, Charcoal, sans-serif;
                padding: 20px;
            }
          .button {
    background-color: teal; 
    border: none;
    color: white;
    float: right;
    padding: 15px 42px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 10px 25px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}
.button2:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,1,0.24),0 20px 50px 0 rgba(0,0,0,0.19);
        </style>  
        
    </head>
    <body>        
       
        <div id="header">
            <ul>
                <li>WELCOME.........<%=session.getAttribute("name")%></li>
                <li style="float:right"><a>DATE:-<%=session.getAttribute("date")%></a></li>
            </ul>
            </div>
        <p>EXAMINATION INSTRUCTIONS</p>
           <ol>
          <li>Coffee</li>
          <li>Tea</li>
          <li>Coca Cola</li>
          <li>waste</li>
          <li>css</li>
         </ol> 
        <a href="exam.jsp" id="start" class="button button2">START</a>
    </body>
</html>
<%
    String rollno=(String)session.getAttribute("rollno");
    String date=(String)session.getAttribute("date");     
    
    PreparedStatement ps=null; 
    Statement st=null;
    ResultSet rs=null;
    String query=null,query1=null;
    
    Class.forName("com.mysql.jdbc.Driver");  
           
            InitialContext initialContext = new InitialContext();
            Context context = (Context) initialContext.lookup("java:comp/env");
            //The JDBC Data source that we just created
            DataSource datas = (DataSource)context.lookup("exam");
            Connection con= datas.getConnection();
            query="use exam";         
            ps=con.prepareStatement(query);
             query="select *from answer where rollno='"+rollno+"' and date='"+date+"'";
                 st=con.createStatement();
                 rs=st.executeQuery(query);
            if(!rs.next())
            {         
             try{
                 query="select quesno from questions";
                 st=con.createStatement();
                 rs=st.executeQuery(query);
                 while(rs.next())
                 {
                     String quesno=rs.getString("quesno");
                     query1="insert into answer(rollno,date,quesno) values('"+rollno+"','"+date+"','"+quesno+"')";
                     st=con.createStatement();
               st.executeUpdate(query1);
                 }
             }catch(SQLException e)
             {
                 out.println(e);
             }
            }
            else
            {
                 response.sendRedirect("submit.jsp");           
            }
%>


