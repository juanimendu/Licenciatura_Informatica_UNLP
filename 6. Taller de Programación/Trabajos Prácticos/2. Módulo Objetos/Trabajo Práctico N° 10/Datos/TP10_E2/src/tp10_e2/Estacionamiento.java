package tp10_e2;

public class Estacionamiento {

    private String nombre;
    private String direccion;
    private int horaApertura=8;
    private int horaCierre=21;
    private Auto[][] autos;
    private int cantPisos=5;
    private int cantPlazas=10;

    public Estacionamiento(String unNombre, String unaDireccion) {
        setNombre(unNombre);
        setDireccion(unaDireccion);
        autos=new Auto[getCantPisos()][getCantPlazas()];
        inicializar();
    }

    public Estacionamiento(String unNombre, String unaDireccion, int unaHoraApertura, int unaHoraCierre, int cantPisos, int cantPlazas) {
        setNombre(unNombre);
        setDireccion(unaDireccion);
        setHoraApertura(unaHoraApertura);
        setHoraCierre(unaHoraCierre);
        setCantPisos(cantPisos);
        setCantPlazas(cantPlazas);
        autos=new Auto[getCantPisos()][getCantPlazas()];
        inicializar();
    }

    private void inicializar() {
        for (int i=0; i<getCantPisos(); i++)
            for (int j=0; j<getCantPlazas(); j++)
                getAutos()[i][j]=new Auto();
    }

    public void setNombre(String unNombre) {
        nombre=unNombre;
    }

    public void setDireccion(String unaDireccion) {
        direccion=unaDireccion;
    }

    public void setHoraApertura(int unaHoraApertura) {
        horaApertura=unaHoraApertura;
    }

    public void setHoraCierre(int unaHoraCierre) {
        horaCierre=unaHoraCierre;
    }

    private void setCantPisos(int cantPisos) {
        this.cantPisos=cantPisos;
    }

    private void setCantPlazas(int cantPlazas) {
        this.cantPlazas=cantPlazas;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public int getHoraApertura() {
        return horaApertura;
    }

    public int getHoraCierre() {
        return horaCierre;
    }

    private Auto[][] getAutos() {
        return autos;
    }

    public int getCantPisos() {
        return cantPisos;
    }

    public int getCantPlazas() {
        return cantPlazas;
    }

    public void registrarAuto(Auto unAuto, int numPiso, int numPlaza) {
        getAutos()[numPiso][numPlaza]=unAuto;
    }

    public String buscarPatente(String unaPatente) {
        String aux="Auto Inexistente";
        int piso=0;
        int plaza=0;
        while ((piso<getCantPisos()) && (!getAutos()[piso][plaza].getPatente().equals(unaPatente))) {
            while ((plaza<getCantPlazas()) && (!getAutos()[piso][plaza].getPatente().equals(unaPatente)))
                plaza++;
            if (plaza==getCantPlazas()) {
                piso++;
                plaza=0;
            }
        }
        if ((piso<getCantPisos()))
            aux="El auto con patente " + unaPatente + " se encuentra en la Plaza " + (plaza+1) + " del Piso " + (piso+1);
        return aux;
    }

    @Override
    public String toString() {
        String aux1="";
        String aux2;
        for (int i=0; i<getCantPisos(); i++)
            for (int j=0; j<getCantPlazas(); j++) {
                if (getAutos()[i][j].getPatente().equals("null"))
                    aux2="libre";
                else
                    aux2=getAutos()[i][j].toString();
                aux1+="Piso " + (i+1) + " Plaza " + (j+1) + ": " + aux2 + "\n";
            }
        return aux1;
    }

    public int autosPorPlaza(int unaPlaza){
        int suma=0;
        for (int i=0; i<getCantPisos(); i++)
            if (!getAutos()[i][unaPlaza].getPatente().equals("null"))
                suma++;
        return suma;
    }

}