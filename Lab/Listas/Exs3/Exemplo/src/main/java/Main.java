import DAO.EmpregadoDAO;
import Model.Empregado;

public class Main {

    public static void main(String[] args) {
        EmpregadoDAO empregadoDAO = new EmpregadoDAO();
        // Trocar o projeto do funcionário de id 3 para o projeto 5
        empregadoDAO.updateProjetoEmpregado(3, 5);
        // Adicionar 2 novos funcionários para o projeto 5
        Empregado empregado1 = new Empregado("Joao", "12345678", 5);
        Empregado empregado2 = new Empregado("Andre", "24681012", 5);

        empregadoDAO.insertEmpregado(empregado1);
        empregadoDAO.insertEmpregado(empregado2);

        // Buscar todos os funcionários mostrando todas as informações da tabela.
        empregadoDAO.selectEmpregado();
        // Buscar todos os funcionários do projeto 2
        empregadoDAO.selectEmpregadoProjeto(2);
        // Buscar os dados do(s) funcionário(s) que se chama(m) Alexandre.
        empregadoDAO.selectEmpregadoNome("Alexandre");
        // Deletar o funcionário de id 6.
        empregadoDAO.deleteEmpregado(6);
        


    }
}
