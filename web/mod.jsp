<%-- 
    Document   : mod
    Created on : Mar 14, 2016, 6:52:05 PM
    Author     : mattia
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="org.rubrica.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica contatto</title>
    </head>
    <%
        DbConnection db = new DbConnection();
        ResultSet rs = db.modificaContatto(request.getParameter("telefono"));
        while (rs.next()) {
    %>
    <body>
        <script>
            function submitF(i) {
                if (i === 1) {
                    var x = confirm("Sei sicuro di voler modificare il contatto?")
                    if (x === true) {
                        document.form.action = "add2.jsp";
                        document.form.submit();
                    } else {
                    }
                }
                if (i === 2) {
                    document.form.action = "index.jsp";
                    document.form.submit();
                }
            }
        </script>
        <h1>Modifica contatto</h1>
        <form name="form" method="post">
            <table>
                <tr>
                <input type="hidden" name="tel" value="<%= request.getParameter("telefono")%>">
                    <td>Nome:</td>
                    <td><input type="text" name="nome" value="<%= rs.getString(2)%>"></td>
                </tr>
                <tr>
                    <td>Cognome:</td>
                    <td><input type="text" name="cognome" value="<%= rs.getString(3)%>"></td>
                </tr>
                <tr>

                    <td>Indirizzo:</td>
                    <td><input type="text" name="indirizzo" value="<%= rs.getString(4)%>"></td>
                </tr>
                <tr>
                    <td>Telefono:</td>
                    <td><input type="text" name="telefono" value="<%= rs.getString(5)%>"></td>
                </tr>
                <tr>
                    <td>Eta:</td>
                    <td><input type="text" name="eta" value="<%= rs.getString(6)%>"></td>
                </tr>
                <tr>
                    <td><input type="button" value="salva" onclick="submitF(1)"></td>
                    <td><input type="button" value="annulla" onclick="submitF(2)"></td>
                </tr>
            </table>
        </form>
    </body>
    <% }%>
</html>
