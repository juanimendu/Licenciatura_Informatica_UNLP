package tp9;


public class Cuadrado extends Figura {

    private double lado;

    public Cuadrado(double unLado, String unColorRelleno, String unColorLinea) {
        super(unColorRelleno, unColorLinea);
        setLado(unLado);
    }

    public void setLado(double unLado) {
        lado=unLado;
    }

    public double getLado() {
        return lado;
    }

    @Override
    public double calcularArea() {
        double area=getLado()*getLado();
        return area;
    }

    @Override
    public double calcularPerimetro() {
        double perimetro=4*getLado();
        return perimetro;
    }

    @Override
    public String toString() {
       String aux=super.toString() + "; Lado: " + getLado();
       return aux;
    }

}