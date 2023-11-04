package tp10_e1;

import PaqueteLectura.*;

public class Proyecto {

    private String proyecto;
    private int codigo;
    private String director;
    private Investigador[] investigadores;
    private int invesMax=50;
    private int cantInves;

    public Proyecto(String unProyecto, int unCodigo, String unDirector) {
        setProyecto(unProyecto);
        setCodigo(unCodigo);
        setDirector(unDirector);
        investigadores=new Investigador[getInvesMax()];
        inicializar();
    }

    private void inicializar() {
        for (int i=0; i<getInvesMax(); i++)
            getInvestigadores()[i]=new Investigador();
    }

    public void setProyecto(String unProyecto) {
        proyecto=unProyecto;
    }

    public void setCodigo(int unCodigo) {
        codigo=unCodigo;
    }

    public void setDirector(String unDirector) {
        director=unDirector;
    }

    public String getProyecto() {
        return proyecto;
    }

    public int getCodigo() {
        return codigo;
    }

    public String getDirector() {
        return director;
    }

    private Investigador[] getInvestigadores() {
        return investigadores;
    }

    public int getInvesMax() {
        return invesMax;
    }

    public int getCantInves() {
        return cantInves;
    }

    public void agregarInvestigador(Investigador unInvestigador) {
        if (getCantInves()<getInvesMax()) {
            getInvestigadores()[getCantInves()]=unInvestigador;
            cantInves++;
        }
        else
            System.out.println("No es posible agregar más investigadores al proyecto");
    }

    public void agregarSubsidio(int unInvestigador, double unMonto, String unMotivo) {
        getInvestigadores()[unInvestigador].agregarSubsidio(unMonto,unMotivo);
    }

    public double dineroTotalOtorgado() {
        double suma=0;
        for (int i=0; i<getCantInves(); i++)
            suma+=getInvestigadores()[i].totalSubsidio();
        return suma;
    }

    public int buscarInves(String unInvestigador) {
        int inv=0;
        while ((inv<getCantInves()) && (!getInvestigadores()[inv].getNombre().equals(unInvestigador)))
            inv++;
        if (inv<getCantInves())
            return inv;
        else
            return -1;
    }

    public void otorgarTodos(String unInvestigador) {
        int inv=buscarInves(unInvestigador);
        if (inv!=-1)
            while ((getInvestigadores()[inv].quedaEspacio()))
                getInvestigadores()[inv].agregarSubsidio(GeneradorAleatorio.generarDouble(1000), GeneradorAleatorio.generarString(10));
        else
            System.out.println("Este investigador no existe");
    }

    @Override
    public String toString() {
        String aux1;
        String aux2="";
        for (int i=0; i<getCantInves(); i++)
            aux2+=getInvestigadores()[i].toString() + "\n";
        aux1="Nombre del Proyecto: " + getProyecto() + "; Código del Proyecto: " + getCodigo() + "; Nombre del Director del Proyecto: " + getDirector() + "; Dinero total otorgado al Proyecto: $" + Math.round(dineroTotalOtorgado()) + "\n" + "INFORMACIÓN DE LOS INVESTIGADORES DEL PROYECTO:" + "\n" + aux2;
        return aux1;
    }

}