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
    Connection con=null;
    PreparedStatement ps=null; 
    Statement st=null;
    ResultSet rs=null;
    String rollno=(String)session.getAttribute("rollno");    
    String dept=(String)session.getAttribute("dept");
    String query=null;
    String quesno1=null;
     Class.forName("com.mysql.jdbc.Driver");
     InitialContext initialContext = new InitialContext();
            Context context = (Context) initialContext.lookup("java:comp/env");
            //The JDBC Data source that  just created
            DataSource datas = (DataSource)context.lookup("exam");
          con= datas.getConnection();
   String quesno=request.getParameter("quesno");
   String sesion=request.getParameter("session");
  String alsodo=request.getParameter("alsodo");
  String answer=request.getParameter("answer");  
   int no=Integer.parseInt(request.getParameter("sno"));   
   int no1=no-1;
   int load=0;
   System.out.println(alsodo);
   System.out.println(no);
   System.out.println(sesion);
   System.out.println(answer);
    DateFormat dateFormat = new SimpleDateFormat("ddMM");
	   //get current date time with Date()
	   Date date = new java.util.Date();            
            String da=dateFormat.format(date);           
            query="use exam";
            ps=con.prepareStatement(query);
          if(sesion.equals("aptitude"))
          {
              System.out.println(no);              
              query="select quesno,question,A,B,C,D from questions where session='"+sesion+"' and quesno='"+no+"'";
              if(no<6)
              {
                  load=1;
              }
          }
          else if(sesion.equals("computer"))
          {
              no=5+no;
              no1=5+no1;
              query="select quesno,question,A,B,C,D from questions where session='"+sesion+"'and quesno='"+no+"'";
              if(no<11)
              {
                  load=1;
              }
          }
           else if(sesion.equals("reasoning"))
          {
              no=no+10; 
              no1=no1+10; 
              query="select quesno,question,A,B,C,D from questions where session='"+sesion+"'and quesno='"+no+"'";
              if(no<16)
              {
                  load=1;
              }
          }
           else if(sesion.equals("technical"))
          {
              if(dept.equals("ece"))
              {
                    no=no+25;
                    no1=no1+25;                    
                    if(no<=30)
                    {
                            query="select quesno,question,A,B,C,D from questions where session='"+sesion+"'and dept='"+dept+"'and quesno='"+no+"'";
                            load=1;
                    }
              }
              else{
                        no=15+no;
                        no1=15+no1;
                        if(no<=20)
                        {
                                query="select quesno,question,A,B,C,D from questions where session='"+sesion+"'and dept='"+dept+"'and quesno='"+no+"'";
                                load=1;
                        }
              }
          }
           else if(sesion.equals("gk"))
          {
              no=20+no;       
              no1=no1+20; 
              query="select quesno,question,A,B,C,D from questions where session='"+sesion+"' and quesno='"+no+"'";
             if(no<26)
              {
                  load=1;
              }
          }
          try
     {
         if(load==1){
         st=con.createStatement();
         rs=st.executeQuery(query);
         rs.next(); 
         String ques=rs.getString("question");
         String a=rs.getString("A");
         String b=rs.getString("B");
         String c=rs.getString("C");
         String d=rs.getString("D");         
         String qsno=rs.getString("quesno");
         out.println(ques+"_split_"+a+"_split_"+b+"_split_"+c+"_split_"+d+"_split_"+qsno);
           }
         if(alsodo.equals("1"))
         {
             System.out.println(alsodo);
             String query1="update answer set ans='"+answer+"',session='"+sesion+"' where rollno='"+rollno+"' and quesno='"+no1+"'";
             System.out.println(no1);
             System.out.println("ended");
             st=con.createStatement();
               st.executeUpdate(query1);
         }
        }catch(SQLException e)
     {
         System.out.println(e);
     }  
      con.close();
%>