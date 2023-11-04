package tp8;

public class Circulo {

    private double radio;
    private String colorRelleno;
    private String colorLinea;

    public Circulo(double unRadio, String unColorRelleno, String unColorLinea) {
        radio=unRadio;
        colorRelleno=unColorRelleno;
        colorLinea=unColorLinea;
    }

    public Circulo() {
        
    }

    public void setRadio(double unRadio) {
        radio=unRadio;
    }

    public void setColorRelleno(String unColorRelleno) {
        colorRelleno=unColorRelleno;
    }

    public void setColorLinea(String unColorLinea) {
        colorLinea=unColorLinea;
    }

    public double getRadio() {
        return radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public double calcularPerimetro() {
        double perimetro=2*radio*Math.PI;
        return perimetro;
    }

    public double calcularArea() {
        double area=Math.PI*Math.pow(radio,2);
        return area;
    }

    @Override
    public String toString() {
        String aux="El perímetro del círculo es " + Math.round(calcularPerimetro()) + " y el área del círculo es " + Math.round(calcularArea());
        return aux;
    }

}