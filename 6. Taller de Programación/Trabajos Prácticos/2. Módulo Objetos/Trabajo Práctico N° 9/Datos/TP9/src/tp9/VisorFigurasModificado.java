package tp9;

public class VisorFigurasModificado {

    private Figura[] figuras;
    private int cantFiguras;
    private int figurasMax=5;

    public VisorFigurasModificado() {
        figuras=new Figura[getFigurasMax()];
        inicializar();
    }

    private void inicializar() {
        for (int i=0; i<getFigurasMax(); i++)
            getFiguras()[i]=null;
    }

    private Figura[] getFiguras() {
        return figuras;
    }

    public int getCantFiguras() {
        return cantFiguras;
    }

    public int getFigurasMax() {
        return figurasMax;
    }

    private boolean quedaEspacio() {
        boolean ok=(getCantFiguras()<getFigurasMax());
        return ok;
    }

    public void guardar(Figura unaFigura) {
        if (quedaEspacio()) {
            getFiguras()[getCantFiguras()]=unaFigura;
            cantFiguras++;
        }
        else
            System.out.println("No es posible agregar más figuras al visor");
    }

    public void mostrar() {
        for (int i=0; i<getCantFiguras(); i++)
            System.out.println(getFiguras()[i].toString());
    }

}