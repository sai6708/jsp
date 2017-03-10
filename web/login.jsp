<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement" %>
<%
    Class.forName("com.mysql.jdbc.Driver"); 
    PreparedStatement ps=null;
            InitialContext initialContext = new InitialContext();
            Context context = (Context) initialContext.lookup("java:comp/env");
            //The JDBC Data source that we just created
            DataSource datas = (DataSource)context.lookup("exam");
            Connection con= datas.getConnection();
   
    
    
    Statement st=null;
    ResultSet rs=null;
    
    String query=null;
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	   //get current date time with Date()
	   Date date = new java.util.Date();            
            String da=dateFormat.format(date);
String rollno=request.getParameter("rollno");
String pass=request.getParameter("pass");
 
            
            query="use exam";
            ps=con.prepareStatement(query);
             try
     {                
         query="select password,name,dept from user where rollno='"+rollno+"'";
         st=con.createStatement();
         rs=st.executeQuery(query);
         rs.next();
         String g=rs.getString("password");
         String n=rs.getString("name").toUpperCase();
         String dept=rs.getString("dept");
         
        if(pass.equals(g)) 
         {    
             session.setAttribute("rollno", rollno);
             session.setAttribute("name",n);
             session.setAttribute("date",da);
             session.setAttribute("dept",dept);
             response.sendRedirect("start.jsp");
         }
         else   
         {
            out.print("<h1>enter your password correctly<h1>");             
         }
     }
     catch(SQLException e)
     {
        out.print("<h1>user not found ,register if not registered"+e+"<h1>");
     }
           
%>