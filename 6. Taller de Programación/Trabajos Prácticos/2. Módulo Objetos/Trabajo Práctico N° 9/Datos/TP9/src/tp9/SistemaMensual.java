package tp9;

public class SistemaMensual extends Sistema {

    private String[] meses=new String[]{"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};

    public SistemaMensual(Estacion unaEstacion, int unAnioInicial, int unaCantAnios) {
    super(unaEstacion, unAnioInicial, unaCantAnios);
    }

    @Override
    public String retornarMedia() {
        String aux="";
        double suma;
        for(int j=0; j<getCantMeses(); j++) {
            suma=0;
            for (int i=0; i<getCantAnios(); i++)
                suma+=getTemp(i,j);
            aux+="Promedio Mes " + meses[j] + ": " + Math.round(suma/getCantAnios()) + "°C" + "\n";
        }
        return aux;
    }

}