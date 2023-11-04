package tp10_e3;

import PaqueteLectura.GeneradorAleatorio;

public abstract class Recital {

    private String nombreRecital;
    private String[] temas;
    private int temasMax;
    private int cantTemas;

    public Recital(String unNombreRecital, int temasMax) {
        setNombre(unNombreRecital);
        setTemasMax(temasMax);
        temas=new String[getTemasMax()];
        inicializar();
    }

    private void inicializar() {
        for (int i=0; i<getTemasMax(); i++)
            getTemas()[i]=new String("null");
    }

    public void setNombre(String unNombreRecital) {
        nombreRecital=unNombreRecital;
    }

    private void setTemasMax(int temasMax) {
        this.temasMax=temasMax;
    }

    public String getNombre() {
        return nombreRecital;
    }

    private String[] getTemas() {
        return temas;
    }

    public int getTemasMax() {
        return temasMax;
    }

    public int getCantTemas() {
        return cantTemas;
    }

    private boolean quedaEspacio() {
        boolean ok=(getCantTemas()<getTemasMax());
        return ok;
    }

    public void agregarTema(String unTema) {
        if (quedaEspacio()) {
            getTemas()[getCantTemas()]=unTema;
            cantTemas++;
        }
        else
            System.out.println("No es posible agregar más temas al recital");
    }

    public String actuar() {
        String aux1;
        String aux2="";
        for (int i=0; i<getCantTemas(); i++)
            aux2+="Y ahora tocaremos " + "'" + getTemas()[i] + "'" + "\n";
        aux1=aux2 + "El costo del recital fue $" + this.calcularCosto(); 
        return aux1;
    }

    public abstract int calcularCosto();

}