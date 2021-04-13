<%@page import="br.com.mercado.model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.mercado.dao.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD - MERCADO</title>
        <link rel="stylesheet" type="text/css" href="../src/java/br/com/mercado/view/mercado.css" />
    </head>

    <body>

    <header>
        <h1>Sistema de Cadastro de Produtos</h1>
    </header>

    <div id="principal">

    </div>

    <form action="index.jsp">
        <label>Descrição:</label></br>
        <input type="text" name="descricao"></br>

        <button type="submit">
            Ok
        </button>
    </form>

    <%
        try {
            out.print("<table border = '1'>");
            out.print("<tr>");
            out.print("<th>CÓDIGO</th><th>DESCRIÇÃO</th><th>PREÇO</th><th>EDITAR</th><th>EXCLUIR</th>");
            ProdutoDAO prd = new ProdutoDAO();
            if (request.getParameter("descricao") == "" || request.getParameter("descricao") == null) {
                ArrayList<Produto> lista = prd.listarTodos();
                for (int num = 0; num < lista.size(); num++) {
                    out.print("<tr>");
                    out.print("<td>" + lista.get(num).getCodigo_produto() + "</td>");
                    out.print("<td>" + lista.get(num).getDescricao_produto() + "</td>");
                    out.print("<td>" + lista.get(num).getPreco_produto() + "</td>");
                    out.print("<td><a href = 'alterar.jsp?codigo=" + lista.get(num).getCodigo_produto() + ""
                            + "&descricao=" + lista.get(num).getDescricao_produto() + ""
                            + "&preco=" + lista.get(num).getPreco_produto() + "'>Editar</a></td>");
                    out.print("<td><a href ='excluir.jsp?codigo=" + lista.get(num).getCodigo_produto() + ""
                            + "&descricao=" + lista.get(num).getDescricao_produto() + "'>Excluir</a></td>");
                    out.print("</tr>");
                }
            } else {
                ArrayList<Produto> lista = prd.listarTodosDescricao(request.getParameter("descricao"));
                for (int num = 0; num < lista.size(); num++) {
                    out.print("<tr>");
                    out.print("<td>" + lista.get(num).getCodigo_produto() + "</td>");
                    out.print("<td>" + lista.get(num).getDescricao_produto() + "</td>");
                    out.print("<td>" + lista.get(num).getPreco_produto() + "</td>");
                    out.print("<td><a href = 'alterar.jsp?codigo=" + lista.get(num).getCodigo_produto() + ""
                            + "&descricao=" + lista.get(num).getDescricao_produto() + ""
                            + "&preco=" + lista.get(num).getPreco_produto() + "&'>Editar</a></td>");
                    out.print("<td><a href = 'excluir.jsp?codigo=" + lista.get(num).getCodigo_produto() + ""
                            + "&descricao=" + lista.get(num).getDescricao_produto() + ""
                            + "&preco=" + lista.get(num).getPreco_produto() + "&'>Excluir</a></td>");

                    out.print("</tr>");
                }
            }
            out.print("</tr>");
            out.print("</table>");

        } catch (Exception erro) {
            throw new RuntimeException("Erro 10" + erro);
        }
    %>

    <a href="inserir.jsp">NOVO </a>
</body>
</html>
