package tp9;

public class Trabajador extends Persona {

    private String tarea;

    public Trabajador(String unNombre, int unDni, int unaEdad, String unaTarea) {
        super(unNombre, unDni, unaEdad);
        setOcupacion(unaTarea);
    }

    public void setOcupacion(String unaTarea) {
        tarea=unaTarea;
    }

    public String getTarea() {
        return tarea;
    }

    @Override
    public String toString() {
        String aux=super.toString() + " Soy " + getTarea();
        return aux;
    }

}