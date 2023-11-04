package tp8;

public class Triangulo {

    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;

    public Triangulo(double unLado1, double unLado2, double unLado3, String unColorRelleno, String unColorLinea) {
        lado1=unLado1;
        lado2=unLado2;
        lado3=unLado3;
        colorRelleno=unColorRelleno;
        colorLinea=unColorLinea;
    }

    public Triangulo() {
        
    }

    public void setLado1(double unLado1) {
        lado1=unLado1;
    }

    public void setLado2(double unLado2) {
        lado2=unLado2;
    }

    public void setLado3(double unLado3) {
        lado3=unLado3;
    }

    public void setColorRelleno(String unColorRelleno) {
        colorRelleno=unColorRelleno;
    }

    public void setColorLinea(String unColorLinea) {
        colorLinea=unColorLinea;
    }

    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public double calcularPerimetro() {
        double perimetro=lado1+lado2+lado3;
        return perimetro;
    }

    public double calcularArea() {
        double s=(lado1+lado2+lado3)/2;
        double area=Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
        return area;
    }

    @Override
    public String toString() {
        String aux="El perímetro del triángulo es " + Math.round(calcularPerimetro()) + " y el área del triángulo es " + Math.round(calcularArea());
        return aux;
    }

}