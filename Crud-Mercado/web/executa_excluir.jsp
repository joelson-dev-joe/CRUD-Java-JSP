<%-- 
    Document   : executa_excluir
    Created on : 12/04/2021, 20:13:38
    Author     : Joelson Correia
--%>

<%@page import="br.com.mercado.dao.ProdutoDAO"%>
<%@page import="br.com.mercado.model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                    ProdutoDAO prd = new ProdutoDAO();
                    prd.exluir(Integer.parseInt(request.getParameter("codigo")));
                    response.sendRedirect("index.jsp");
                } catch (Exception erro) {
                    throw new RuntimeException("Erro 9" + erro);
                }
        %>
    </body>
</html>
