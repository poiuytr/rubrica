<%-- 
    Document   : new
    Created on : Mar 14, 2016, 5:22:46 PM
    Author     : mattia
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuovo contatto</title>
    </head>
            <script>
            function submitF(i) {
                if (i === 1) {
                    var x = confirm("Sei sicuro di voler aggiungere il contatto?")
                    if (x === true) {
                        document.form.action = "add.jsp";
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
    <body>
        <h1>Nuovo contatto</h1>
        <form method="post"  name="form" action="add.jsp">
            <table>
                <tr>
                    <td>Nome:</td>
                    <td><input type="text" name="nome"></td>
                </tr>
                <tr>
                    <td>Cognome:</td>
                    <td><input type="text" name="cognome"></td>
                </tr>
                <tr>

                    <td>Indirizzo:</td>
                    <td><input type="text" name="indirizzo"></td>
                </tr>
                <tr>
                    <td>Telefono:</td>
                    <td><input type="text" name="telefono"></td>
                </tr>
                <tr>
                    <td>Eta:</td>
                    <td><input type="text" name="eta"></td>
                </tr>
                <tr>
                    <td><input type="button" value="salva" onclick="submitF(1)"></td>
                    <td><input type="button" value="annulla" onclick="submitF(2)"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
