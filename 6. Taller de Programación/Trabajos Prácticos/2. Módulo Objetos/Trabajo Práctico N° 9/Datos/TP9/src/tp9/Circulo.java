package tp9;

public class Circulo extends Figura {

    private double radio;
    
    public Circulo(double unRadio, String unColorRelleno, String unColorLinea) {
        super(unColorRelleno, unColorLinea);
        setRadio(unRadio);
    }

    public void setRadio(double unRadio) {
        radio=unRadio;
    }

    public double getRadio() {
        return radio;
    }

    @Override
    public double calcularPerimetro() {
        double perimetro=2*getRadio()*Math.PI;
        return perimetro;
    }

    @Override
    public double calcularArea() {
        double area=Math.PI*Math.pow(getRadio(),2);
        return area;
    }

    @Override
    public String toString() {
        String aux=super.toString() + "; Radio: " + getRadio();
        return aux;
    }

}