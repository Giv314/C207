package DAO;

import Model.Empregado;

import java.sql.SQLException;
import java.util.ArrayList;

public class EmpregadoDAO extends ConnectionDAO{

    //DAO - Data Access Object
    boolean sucesso = false; //Para saber se funcionou

    //INSERT
    public boolean insertEmpregado(Empregado novoEmpregado) {

        connectToDB(); //Conecta ao banco de dados

        //Comando em SQL:
        String sql = "INSERT INTO empregado (nome,cpf, projeto) values (?,?,?)";
        //O comando recebe paramêtros -> consulta dinâmica (pst)
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, novoEmpregado.getNome()); // 1- refere-se à primeira interrogação
            pst.setString(2, novoEmpregado.getCpf());  // 2- refere-se à segunda interrogação
            pst.setInt(3, novoEmpregado.getProjeto());// 3- refere-se à terceira interrogação
            pst.execute();
            sucesso = true;
        } catch (SQLException ex) {
            System.out.println("Erro = " + ex.getMessage());
            sucesso = false;
        } finally {
            try {   //Encerra a conexão
                con.close();
                pst.close();
            } catch (SQLException ex) {
                System.out.println("Erro = " + ex.getMessage());
            }
        }
        return sucesso;
    }

    //UPDATE
    /**UPDATE NOME DO EMPREGADO**/
    public boolean updateNomeEmpregado(int id, String novoNome) {

        connectToDB();

        String sql = "UPDATE empregado SET nome=? WHERE id=?";

        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, novoNome);
            pst.setInt(2, id);
            pst.execute();
            sucesso = true;
        } catch (SQLException ex) {
            System.out.println("Erro = " + ex.getMessage());
            sucesso = false;
        } finally {
            try {
                con.close();
                pst.close();
            } catch (SQLException ex) {
                System.out.println("Erro = " + ex.getMessage());
            }

        }
        return sucesso;
    }

    /**UPDATE PROJETO DO EMPREGADO**/
    public boolean updateProjetoEmpregado(int id, int novoProjeto) {

        connectToDB();

        String sql = "UPDATE empregado SET projeto=? WHERE id=?";

        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, novoProjeto);
            pst.setInt(2, id);
            pst.execute();
            sucesso = true;
        } catch (SQLException ex) {
            System.out.println("Erro = " + ex.getMessage());
            sucesso = false;
        } finally {
            try {
                con.close();
                pst.close();
            } catch (SQLException ex) {
                System.out.println("Erro = " + ex.getMessage());
            }

        }
        return sucesso;
    }

    //DELETE
    public boolean deleteEmpregado(int id) {

        connectToDB();

        String sql = "DELETE FROM empregado WHERE id=?";

        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            pst.execute();
            sucesso = true;
        } catch (SQLException ex) {
            System.out.println("Erro = " + ex.getMessage());
            sucesso = false;
        } finally {
            try {
                con.close();
                pst.close();
            } catch (SQLException ex) {
                System.out.println("Erro = " + ex.getMessage());
            }
        }
        return sucesso;
    }

    //SELECT
    /**SELECT EMPREGADO SEM FILTRO*/
    public ArrayList<Empregado> selectEmpregado() {
        ArrayList<Empregado> listaDeEmpregados = new ArrayList<>();

        connectToDB();

        String sql = "SELECT * FROM empregado";

        try {
            st = con.createStatement();
            rs = st.executeQuery(sql); //ref. a tabela resultante da busca
            System.out.println("Lista de empregado: ");
            while (rs.next()) {
                //System.out.println(rs.getString("nome"));
                Empregado empregadoTemp = new Empregado(rs.getString("nome"), rs.getString("cpf"), rs.getInt("projeto"));
                empregadoTemp.id = Integer.parseInt(rs.getString("id"));
                System.out.println("ID = " + empregadoTemp.id);
                System.out.println("Nome = " + empregadoTemp.getNome());
                System.out.println("CPF = " + empregadoTemp.getCpf());
                System.out.println("Projeto =" + empregadoTemp.getProjeto());
                System.out.println("---------------------------------");
                listaDeEmpregados.add(empregadoTemp);
            }
            sucesso = true;
        } catch (SQLException ex) {
            System.out.println("Erro = " + ex.getMessage());
            sucesso = false;
        } finally {
            try {
                con.close();
                st.close();
            } catch (SQLException ex) {
                System.out.println("Erro = " + ex.getMessage());
            }
        }
        return listaDeEmpregados;
    }

    /**SELECT EMPREGADO POR NOME**/
    public ArrayList<Empregado> selectEmpregadoNome(String nome) {
        ArrayList<Empregado> listaDeEmpregados = new ArrayList<>();

        connectToDB();

        String sql = "SELECT * FROM empregado WHERE nome = '" + nome + "'";

        try {
            st = con.createStatement();
            rs = st.executeQuery(sql); //ref. a tabela resultante da busca
            System.out.println("Lista de empregado: ");
            while (rs.next()) {
                //System.out.println(rs.getString("nome"));
                Empregado empregadoTemp = new Empregado(rs.getString("nome"), rs.getString("cpf"), rs.getInt("projeto"));
                System.out.println("Nome = " + empregadoTemp.getNome());
                System.out.println("CPF = " + empregadoTemp.getCpf());
                System.out.println("Projeto =" + empregadoTemp.getProjeto());
                System.out.println("---------------------------------");
                listaDeEmpregados.add(empregadoTemp);
            }
            sucesso = true;
        } catch (SQLException ex) {
            System.out.println("Erro = " + ex.getMessage());
            sucesso = false;
        } finally {
            try {
                con.close();
                st.close();
            } catch (SQLException ex) {
                System.out.println("Erro = " + ex.getMessage());
            }
        }
        return listaDeEmpregados;
    }

    /**SELECT EMPREGADO POR PROJETO**/
    public ArrayList<Empregado> selectEmpregadoProjeto(int projeto) {
        ArrayList<Empregado> listaDeEmpregados = new ArrayList<>();

        connectToDB();

        String sql = "SELECT * FROM empregado WHERE projeto = '" + projeto + "'";

        try {
            st = con.createStatement();
            rs = st.executeQuery(sql); //ref. a tabela resultante da busca
            System.out.println("Lista de empregado: ");
            while (rs.next()) {
                //System.out.println(rs.getString("nome"));
                Empregado empregadoTemp = new Empregado(rs.getString("nome"), rs.getString("cpf"), rs.getInt("projeto"));
                System.out.println("Nome = " + empregadoTemp.getNome());
                System.out.println("CPF = " + empregadoTemp.getCpf());
                System.out.println("Projeto =" + empregadoTemp.getProjeto());
                System.out.println("---------------------------------");
                listaDeEmpregados.add(empregadoTemp);
            }
            sucesso = true;
        } catch (SQLException ex) {
            System.out.println("Erro = " + ex.getMessage());
            sucesso = false;
        } finally {
            try {
                con.close();
                st.close();
            } catch (SQLException ex) {
                System.out.println("Erro = " + ex.getMessage());
            }
        }
        return listaDeEmpregados;
    }
}

