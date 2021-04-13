<%-- 
    Document   : executa_inserir
    Created on : 12/04/2021, 20:13:07
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
                Produto pro = new Produto();
                ProdutoDAO prd = new ProdutoDAO();
                if (request.getParameter("descricao").equals("") || request.getParameter("preco").equals("")) {
                    response.sendRedirect("index.jsp");
                } else {
                    pro.setDescricao_produto(request.getParameter("descricao"));
                    pro.setPreco_produto(Double.parseDouble(request.getParameter("preco")));
                    prd.inserir(pro);
                    response.sendRedirect("index.jsp");
                }
            } catch (Exception erro) {
                throw new RuntimeException("Erro 7" + erro);
            }
        %>
    </body>
</html>