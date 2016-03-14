<%-- 
    Document   : add
    Created on : Mar 14, 2016, 6:01:53 PM
    Author     : mattia
--%>

<%@page import="org.rubrica.DbConnection"%>
<%@page import="org.rubrica.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String nome = request.getParameter("nome");
    String cognome = request.getParameter("cognome");
    String indirizzo = request.getParameter("indirizzo");
    String telefono = request.getParameter("telefono");
    String eta = request.getParameter("eta");
    int e = Integer.parseInt(eta);
    Persona p = new Persona(nome, cognome, indirizzo, telefono, e);
    DbConnection db = new DbConnection();
    boolean ret=db.nuovoContatto(p,telefono);
%>
<script>
    if(<%= ret %> ===false){
        alert('Contatto Già esistente')
    }
    document.location.href = "index.jsp";
</script>

