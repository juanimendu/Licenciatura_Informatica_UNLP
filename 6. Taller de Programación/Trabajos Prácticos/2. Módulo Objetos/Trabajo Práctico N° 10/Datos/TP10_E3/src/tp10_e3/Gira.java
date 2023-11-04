package tp10_e3;

public class Gira extends Recital {

    private String nombreRecital;
    private String[] temas;
    private int cantTemas;
    private int temasMax;
    private String nombreGira;
    private Fecha[] fechas;
    private int fechasMax;
    private int cantFechas;
    private int actual;

    public Gira(String unNombreRecital, int temasMax, String unNombreGira, int fechasMax) {
        super(unNombreRecital,temasMax);
        setNombreGira(unNombreGira);
        setFechasMax(fechasMax);
        fechas=new Fecha[getFechasMax()];
        inicializar();
    }

    private void inicializar() {
        for (int i=0; i<getFechasMax(); i++)
            getFechas()[i]=new Fecha();
    }

    public void setNombreGira(String unNombreGira) {
        nombreGira=unNombreGira;
    }

    private void setFechasMax(int fechasMax) {
        this.fechasMax=fechasMax;
    }

    public String getNombreGira() {
        return nombreGira;
    }

    private Fecha[] getFechas() {
        return fechas;
    }
    public int getFechasMax() {
        return fechasMax;
    }

    public int getCantFechas() {
        return cantFechas;
    }

    private int getActual() {
        return actual;
    }

    private boolean quedaEspacio() {
        boolean ok=(getCantFechas()<getFechasMax());
        return ok;
    }

    public void agregarFecha(Fecha unaFecha) {
        if (quedaEspacio()) {
            getFechas()[getCantFechas()]=unaFecha;
            cantFechas++;
        }
        else
            System.out.println("No es posible agregar más fechas a la gira");
    }

    @Override
    public String actuar() {
        String aux="Buenas noches. El nombre de la ciudad de la fecha actual es " + "'" + getFechas()[getActual()].getCiudad() + "'";
        aux+="\n" + super.actuar();
        actual++;
        return aux;
    }

    @Override
    public int calcularCosto() {
        int costo=0;
        for (int i=0; i<getCantFechas(); i++)
            costo++;
        costo=costo*30000;
        return costo;
    }

}