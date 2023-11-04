package tp9;

public abstract class Empleado {

    private String nombre;
    private double sueldoBasico;
    private int antiguedad;

    public Empleado(String unNombre, double unSueldo, int unaAntiguedad){
        setNombre(unNombre);
        setSueldo(unSueldo);
        setAntiguedad(unaAntiguedad);
    }

    public void setNombre(String unNombre){
        nombre=unNombre;
    }

    public void setSueldo(double unSueldo){
        sueldoBasico=unSueldo;
    }

    public void setAntiguedad(int unaAntiguedad){
        antiguedad=unaAntiguedad;
    }

    public String getNombre() {
        return nombre;
    }

    public double getSueldo() {
        return sueldoBasico;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    @Override
    public String toString() {
        String aux="Nombre: " + getNombre() + "; Sueldo a cobrar: $" + Math.round(this.calcularSueldoACobrar()) + "; Efectividad: " + Math.round(this.calcularEfectividad()) + "%";
        return aux;
    }

    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();

}