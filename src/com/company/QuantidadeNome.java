package com.company;

import java.util.Objects;

public class QuantidadeNome {
    private String nome;
    private Integer quantidade;

    public QuantidadeNome(String nome, Integer quantidade) {
        this.nome = nome;
        this.quantidade = quantidade;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        QuantidadeNome xpto = (QuantidadeNome) o;
        return Objects.equals(nome, xpto.nome) && Objects.equals(quantidade, xpto.quantidade);
    }

    @Override
    public int hashCode() {
        return Objects.hash(nome, quantidade);
    }

    @Override
    public String toString() {
        return "\"" + nome + "\"" + " = " + quantidade ;
    }

}
