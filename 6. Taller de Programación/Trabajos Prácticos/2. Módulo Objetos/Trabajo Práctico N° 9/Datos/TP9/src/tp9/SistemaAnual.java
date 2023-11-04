package tp9;

public class SistemaAnual extends Sistema {

    public SistemaAnual(Estacion unaEstacion, int unAnioInicial, int unaCantAnios) {
        super(unaEstacion, unAnioInicial, unaCantAnios);
    }

    @Override
    public String retornarMedia() {
        String aux="";
        double suma;
        for(int i=0; i<getCantAnios(); i++) {
            suma=0;
            for (int j=0; j<getCantMeses(); j++)
                suma+=getTemp(i,j);
            aux+="Promedio Año " + (i+getAnioInicial()) + ": " + Math.round(suma/getCantMeses()) + "°C" + "\n";
        }
        return aux;
    }

}