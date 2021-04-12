/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.mercado.dao;

import br.com.mercado.model.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Joelson Correia
 */
public class ProdutoDAO {

    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ArrayList<Produto> lista = new ArrayList<>();
    private ResultSet rs;

    public ProdutoDAO() {
        conn = new ConnectionFactory().getConexao();
    }

    public void inserir(Produto produto) {
        String sql = "INSERT INTO produto (descricao_produto, preco_produto) VALUES (?, ?)";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, produto.getDescricao_produto());
            stmt.setDouble(2, produto.getPreco_produto());
            stmt.execute();
            stmt.close();

        } catch (Exception erro) {
            throw new RuntimeException("Erro 2" + erro);
        }
    }

    public void alterar(Produto produto) {
        String sql = "UPDATE produto SET descricao_produto = ?, preco_produto = ? WHERE codigo_produto = ?";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, produto.getDescricao_produto());
            stmt.setDouble(2, produto.getPreco_produto());
            stmt.setInt(3, produto.getCodigo_produto());
            stmt.execute();
            stmt.close();

        } catch (Exception erro) {
            throw new RuntimeException("Erro 3" + erro);
        }
    }

    public void exluir(int valor) {
        String sql = "DELETE *from produto WHERE codigo_produto = " + valor;
        try {
            st = conn.createStatement();
            st.execute(sql);
            st.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro 4" + erro);
        }
    }

    public ArrayList<Produto> listarTodos(){
        String sql = "SELECT *from produto";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Produto produto = new Produto();
                produto.setCodigo_produto(rs.getInt("codigo_produto)"));
                produto.setDescricao_produto(rs.getString("descricao_produto"));
                produto.setPreco_produto(rs.getDouble("preco_produto"));
                lista.add(produto);
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro 5" + erro);
        }
        return lista;
    }

    public ArrayList<Produto> listarTodosDescricao(String valor){
        String sql = "SELECT *FROM produto WHERE descricao_produto LIKE '%"+valor+"%' ";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Produto produto = new Produto();
                produto.setCodigo_produto(rs.getInt("codigo_produto)"));
                produto.setDescricao_produto(rs.getString("descricao_produto"));
                produto.setPreco_produto(rs.getDouble("preco_produto"));
                lista.add(produto);
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro 5" + erro);
        }
        return lista;
    }
}
