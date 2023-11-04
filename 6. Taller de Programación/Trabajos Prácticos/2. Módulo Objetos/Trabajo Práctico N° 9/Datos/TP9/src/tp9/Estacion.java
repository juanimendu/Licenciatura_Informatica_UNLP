package tp9;

public class Estacion {

    private String nombre;
    private double latitud;
    private double longitud;

    public Estacion(String unNombre, double unaLatitud, double unaLongitud) {
        setNombre(unNombre);
        setLatitud(unaLatitud);
        setLongitud(unaLongitud);
    }

    public void setNombre(String unNombre) {
        nombre=unNombre;
    }

    public void setLatitud(double unaLatitud) {
        latitud=unaLatitud;
    }

    public void setLongitud(double unaLongitud) {
        longitud=unaLongitud;
    }

    public String getNombre() {
        return nombre;
    }

    public double getLatitud() {
        return latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    @Override
    public String toString() {
        String aux="ESTACIÓN: " + getNombre() + "; (Latitud, Longitud): (" + getLatitud() + ", " + getLongitud() + ")";
        return aux;
    }

}