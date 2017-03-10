<%@page import="java.sql.SQLException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%
            PreparedStatement ps=null;
            InitialContext initialContext = new InitialContext();
            Context context = (Context) initialContext.lookup("java:comp/env");
            //The JDBC Data source that we just created
            DataSource datas = (DataSource)context.lookup("exam");
            Connection con= datas.getConnection();
                    if (con == null)
            {
                throw new SQLException("Error establishing connection!");
            }
                    else
                    {
                        System.out.println("connection created");
                    }
    String query=null;
String rollno=request.getParameter("rollno");
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String dept=request.getParameter("dept");
Class.forName("com.mysql.jdbc.Driver");              
            query="use exam";
            ps=con.prepareStatement(query);
            Class.forName("com.mysql.jdbc.Driver");  
           ps=con.prepareStatement("insert into user values(?,?,?,?)");
           ps.setString(1,rollno);
           ps.setString(2,name );
           ps.setString(3,pass );
           ps.setString(4,dept );
           ps.executeUpdate();
           con.close();
%>