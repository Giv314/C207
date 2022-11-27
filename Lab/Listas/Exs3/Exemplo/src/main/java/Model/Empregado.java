package Model;

public class Empregado {
    private String nome;
    private String cpf;
    private int projeto;

    public int id;

    public Empregado(String nome, String cpf, int projeto){
        this.nome = nome;
        this.cpf = cpf;
        this.projeto = projeto;
    }

    public String getNome() {
        return nome;
    }

    public String getCpf() {
        return cpf;
    }

    public int getProjeto() {
        return projeto;
    }

}
