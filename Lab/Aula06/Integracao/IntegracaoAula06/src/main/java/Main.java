import DAO.UserDAO;
import Model.User;

public class Main {

    public static void main(String[] args) {

        UserDAO userDAO= new UserDAO();
        User u1 =  new User("Pedro", "123456789");
        User u2 = new User("Mario", "987654321");
        User u3 = new User("Joao", "1234567");

        userDAO.insertUser(u1);
        userDAO.insertUser(u2);
        userDAO.insertUser(u3);

        System.out.println("Deletando o usuário 3:");
        userDAO.deleteUser(3);

        userDAO.selectUser();

        System.out.println("Atualizando o usuario 2:");
        userDAO.updateUser(2, u3);

        userDAO.selectUser();


    }
}
