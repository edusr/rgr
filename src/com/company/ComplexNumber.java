package com.company;

public class ComplexNumber {

    private Integer real;
    private Integer complex;

    public ComplexNumber(){
        this.real = 0;
        this.complex = 0;
    }

    public ComplexNumber(Integer real, Integer complex) {
        this.real = real;
        this.complex = complex;
    }

    private ComplexNumber sum(ComplexNumber complexNumber){
        return new ComplexNumber(this.real + complexNumber.getReal(),
                this.complex + complexNumber.getComplex());
    }

    public static ComplexNumber sum(ComplexNumber complexNumberOne, ComplexNumber complexNumberTwo){
        return complexNumberOne.sum(complexNumberTwo);
    }

    public Integer getReal() {
        return real;
    }

    public void setReal(Integer real) {
        this.real = real;
    }

    public Integer getComplex() {
        return complex;
    }

    public void setComplex(Integer complex) {
        this.complex = complex;
    }
}
