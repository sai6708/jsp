<%-- 
    Document   : submit
    Created on : 19 Oct, 2016, 12:19:40 PM
    Author     : sai
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit</title>
        <script src="js/jquery-1.8.0.min.js"></script>
        <script src="js/exam.js"></script>
        <style>
            .button {
    background-color: #FFFF33; 
    border: none;
    color: black;
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
             p{
                font-size: 30px;
                color: rgb(59, 145, 195);
                font-family: Papyrus,fantasy;
                padding: 20px;
            }
             ol {
                 font-family: "Trebuchet MS", Helvetica;
                 background: #99CCFF;
                 margin: 10px;
                padding: 50px;
                color: black;
                width: 90%;
             }
             a {
    text-decoration: none ;
}
        </style>
    </head>
    <body>
          <p>Congratulations</p>
           <ol>
          <li>Coffee</li>
          <li>Tea</li>
          <li>Coca Cola</li>
          <li>waste</li>         
           </ol>
          <a href="index.jsp" class="button">SUBMIT EXAM</a>
    </body>
</html>
<%
    
    session.invalidate();    
    %>
