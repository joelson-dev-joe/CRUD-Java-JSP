<%-- 
    Document   : executa_alterar
    Created on : 12/04/2021, 20:13:22
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
                    if(request.getParameter("descricao").equals("") || request.getParameter("preco").equals("")){
                        response.sendRedirect("index.jsp");
                    }else{
                        pro.setDescricao_produto(request.getParameter("descricao"));
                        pro.setPreco_produto(Double.parseDouble(request.getParameter("preco")));
                        pro.setCodigo_produto(Integer.parseInt(request.getParameter("codigo")));
                        prd.alterar(pro);
                        response.sendRedirect("index.js");
                    }
                } catch (Exception erro) {
                    throw new RuntimeException("Erro 8" + erro);
                }
        %>
    </body>
</html>
