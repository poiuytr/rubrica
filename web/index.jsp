<%-- 
    Document   : index
    Created on : Mar 14, 2016, 4:17:41 PM
    Author     : mattia
--%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="org.rubrica.DbConnection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rubrica</title>

    </head>
    <body>
        <script>
            function submitF(i) {
                if (i === 1) {
                    document.form.action = "new.jsp";
                    document.form.submit();
                }
                if (i === 2) {
                    if ($('input[type=radio]:checked').size() > 0) {
                        document.form.action = "mod.jsp";
                        document.form.submit();
                    } else {
                        alert("Devi selezionare un nominativo");
                    }
                }
                if (i === 3) {
                    if ($('input[type=radio]:checked').size() > 0) {
                        var x = confirm("Sei sicuro di voler eliminare il contatto?")
                        if (x === true) {
                            document.form.action = "delete.jsp";
                            document.form.submit();
                        } else {
                        }
                    } else {
                        alert("Devi selezionare un nominativo");
                    }
                }
            }

        </script>
        <h1>Rubrica</h1>
        <form id="form" name="form">
            <table> 
                <th>Nome</th>
                <th>Cognome</th>
                <th>Telefono</th>
                    <% DbConnection db = new DbConnection();
                        ResultSet rs = db.readDb();
                        while (rs.next()) {%>
                <tr> 
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(5)%></td>
                    <td><input type="radio" id="radioT" name="telefono" value="<%= rs.getString(5)%>"/></td>
                </tr>
                <% }%>

            </table>
            <p>
            <div style="float:left; margin-right:10px;">
                <input type="button" value="Nuovo" onclick="submitF(1)">
            </div> 
            <div style="float:left; margin-right:10px;">
                <input type="button" value="Modifica" onclick="submitF(2)">
            </div>
            <div style="float:left; margin-right:10px;">
                <input type="button" value="Elimina" onclick="submitF(3)">
                </form>
            </div>

        </p>
</body>
</html>
