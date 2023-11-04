package tp10_e1;

public class Investigador {

    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio[] subsidios;
    private int subMax=5;
    private int cantSub;

    public Investigador(String unNombre, int unaCategoria, String unaEspecialidad) {
        setNombre(unNombre);
        setCategoria(unaCategoria);
        setEspecialidad(unaEspecialidad);
        subsidios=new Subsidio[getSubMax()];
        inicializar();
    }

    public Investigador() {
        subsidios=new Subsidio[getSubMax()];
        inicializar();
    }

    private void inicializar() {
        for (int i=0; i<getSubMax(); i++)
            getSub()[i]=new Subsidio();
    }

    public void setNombre(String unNombre) {
        nombre=unNombre;
    }

    public void setCategoria(int unaCategoria) {
        categoria=unaCategoria;
    }

    public void setEspecialidad(String unaEspecialidad) {
        especialidad=unaEspecialidad;
    }

    public String getNombre() {
        return nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    private Subsidio[] getSub() {
        return subsidios;
    }

    public int getSubMax() {
        return subMax;
    }
 
    public int getCantSub() {
        return cantSub;
    }

    public boolean quedaEspacio() {
        boolean ok=(getCantSub()<getSubMax());
        return ok;
    }

    public void agregarSubsidio(double unMonto, String unMotivo) {
        if (quedaEspacio()) {
            getSub()[getCantSub()].setMonto(unMonto);
            getSub()[getCantSub()].setMotivo(unMotivo);
            getSub()[getCantSub()].setOtorgado(true);
            cantSub++;
        }
        else
            System.out.println("No es posible agregar más subsidios al investigador");
    }

    public double totalSubsidio() {
        double suma=0;
        for (int i=0; i<getCantSub(); i++)
            suma+=getSub()[i].getMonto();
        return suma;
    }

    @Override
    public String toString() {
        String aux="Nombre: " + getNombre() + "; Categoría: " + (getCategoria()+1) + "; Especialidad: " + getEspecialidad() + "; Monto total subsidiado: $" + Math.round(totalSubsidio());
        return aux;
    }

}