package tp9;

public class Rectangulo extends Figura {

    private double base;
    private double altura;

    public Rectangulo(double unaBase, double unaAltura, String unColorRelleno, String unColorLinea) {
        super(unColorRelleno, unColorLinea);
        setBase(unaBase);
        setAltura(unaAltura);
    }

    public void setBase(double unaBase) {
        base=unaBase;
    }

    public void setAltura(double unaAltura) {
        altura=unaAltura;
    }

    public double getBase() {
        return base;
    }

    public double getAltura() {
        return altura;
    }

    @Override
    public double calcularArea() {
        double area=getBase()*getAltura();
        return area;
    }

    @Override
    public double calcularPerimetro() {
        double perimetro=2*getBase()+2*getAltura();
        return perimetro;
    }

    @Override
    public String toString() {
       String aux=super.toString() + "; Base: " + getBase() + "; Altura: " + getAltura();
       return aux;
    }

}