<%@page import="br.com.mercado.dao.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>

    <body>
        <form action="index.jsp">
            <label>Descrição:</label></br>
            <input type="text" name="descricao"></br>
            
            <button type="submit">
                Enviar
            </button>
        </form>
        
        <%
            try {
                out.print("<table>");
                out.print("<tr>");
                out.print("<th>Código</th><th>Descrição</th><th>Preço</th><th>Editar</th><th>Excluir</th>");
                ProdutoDAO prd = new ProdutoDAO();
                if(request.getParameter("descricao") == " " || request.getParameter("") == null){
                    
                }
                out.print("</tr>");
                out.print("</table>");
                    
                } catch (Exception erro) {
                    throw new RuntimeException("Erro 10" + erro );
                }
        %>
    </body>
</html>
