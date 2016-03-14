<%-- 
    Document   : delete
    Created on : Mar 14, 2016, 7:24:08 PM
    Author     : mattia
--%>

<%@page import="org.rubrica.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String telefono = request.getParameter("telefono");
    DbConnection db=new DbConnection();
    db.elimina(telefono);
%>
<script>
    document.location.href = "index.jsp";
</script>