package com.company;

import java.text.Normalizer;
import java.util.*;

public class Main {

    public static void main(String[] args) {
        List<QuantidadeNome> x = processList(Arrays.asList(new String[]{"Pedro", "João", "Maria", "JOAO", "Alberto", "João", "MARiA"}));
        System.out.println(x.toString());
    }

    public static String normalizarLista(String str) {
        return Normalizer.normalize(str, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").toUpperCase(Locale.ROOT);
    }

    public static List<QuantidadeNome> processList(List<String> strings) {

        List<String> listaNomalizada = new ArrayList<>();

        List<QuantidadeNome> resultado = new ArrayList<>();

        for (String str1 : strings) {
            listaNomalizada.add(normalizarLista(str1));
        }

        Collections.sort(listaNomalizada);

        for (String str1 : listaNomalizada) {
            QuantidadeNome QuantidadeNome = new QuantidadeNome(str1, Collections.frequency(listaNomalizada, str1));
            if (!resultado.contains(QuantidadeNome)) {
                resultado.add(QuantidadeNome);
            }
        }

        return resultado;
    }


}
