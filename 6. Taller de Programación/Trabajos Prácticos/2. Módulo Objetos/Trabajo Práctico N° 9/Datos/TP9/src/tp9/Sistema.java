package tp9;

import PaqueteLectura.*;

public abstract class Sistema {

    private String[] meses=new String[]{"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
    private Estacion estacion;
    private int anioInicial;
    private double[][] sistemas;
    private int cantAnios;
    private int cantMeses=12;

    public Sistema(Estacion unaEstacion, int unAnioInicial, int unaCantAnios) {
        setEstacion(unaEstacion);
        setAnioInicial(unAnioInicial);
        setCantAnios(unaCantAnios);
        sistemas=new double[getCantAnios()][getCantMeses()];
        inicializar();
    }

    private void inicializar() {
        for (int i=0; i<getCantAnios(); i++)
            for (int j=0; j<getCantMeses(); j++)
                getSistemas()[i][j]=50+GeneradorAleatorio.generarDouble(50);
    }

    public void setEstacion(Estacion unaEstacion) {
        estacion=unaEstacion;
    }

    public void setAnioInicial(int unAnioInicial) {
        anioInicial=unAnioInicial;
    }

    private void setCantAnios(int cantAnios) {
        this.cantAnios=cantAnios;
    }

    public Estacion getEstacion() {
        return estacion;
    }

    public int getAnioInicial() {
        return anioInicial;
    }

    private double[][] getSistemas() {
        return sistemas;
    }

    public int getCantAnios() {
        return cantAnios;
    }

    public int getCantMeses() {
        return cantMeses;
    }

    public void setTemp(int unAnio, int unMes, double unaTemp) {
        getSistemas()[unAnio][unMes]=unaTemp;
    }

    public double getTemp(int unAnio, int unMes) {
        return getSistemas()[unAnio][unMes];
    }

    public String mayorTemp() {
        double tempMax=0;
        int anioMax=-1;
        int mesMax=-1;
        for (int i=0; i<getCantAnios(); i++)
            for (int j=0; j<getCantMeses(); j++) {
                if (getTemp(i,j)>tempMax) {
                    tempMax=getTemp(i,j);
                    anioMax=i;
                    mesMax=j;
                }
            }
        String aux="La temperatura máxima de " + Math.round(tempMax) + "°C se registró en el mes de " + meses[mesMax] + " del año " + (anioMax+getAnioInicial());
        return aux;
    }

    @Override
    public String toString() {
        String aux=getEstacion().toString() + "\n" + this.retornarMedia();
        return aux;
    }

    public abstract String retornarMedia();

}