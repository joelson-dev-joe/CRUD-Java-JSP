<%-- 
    Document   : inserir
    Created on : 12/04/2021, 20:58:22
    Author     : Joelson Correia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="executa_inserir.jsp" method="POST">
            <!--<label>Código: </label></br>
            <input type="text" name="codigo"></br> -->
            
            <label>Descrição: </label></br>
            <input type="text" name="descricao"></br>
            
            <label>Preço: </label></br>
            <input type="text" name="preco"></br>
            
            <button type="submit">
                Ok
            </button>
        </form>
    </body>
</html>
