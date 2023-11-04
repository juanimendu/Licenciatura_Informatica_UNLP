package tp8;

public class Hotel {

    private Habitacion[] habitaciones;
    private int habMax=100;
    private int cantHab;

    public Hotel(int habMax) {
        this.habMax=habMax;
        habitaciones=new Habitacion[this.habMax];
        inicializar();
    }

    public Hotel() {
        habitaciones=new Habitacion[habMax];
        inicializar();
    }

    private void inicializar() {
        for (int i=0; i<habMax; i++)
            habitaciones[i]=new Habitacion();
    }

    private void setHabMax(int habMax) {
        this.habMax=habMax;
    }

    public Habitacion[] getHabitaciones() {
        return habitaciones;
    }

    public int getHabMax() {
        return habMax;
    }

    public int getCantHab() {
        return cantHab;
    }

    public void ocuparHab(int unaHabitacion, Cliente unCliente) {
        if (!habitaciones[unaHabitacion].getOcupada()) {
            habitaciones[unaHabitacion].setOcupada(true);
            habitaciones[unaHabitacion].setCliente(unCliente);
            cantHab++;
        }
    }
    
    public void aumentarPrecios(double unPrecio) {
        for (int i=0; i<habMax; i++)
            habitaciones[i].aumentarPrecio(unPrecio);
    }

    @Override
    public String toString() {
        String aux="";
        for (int i=0; i<habMax; i++)
          aux+="Habitación " + (i+1) + ": " + habitaciones[i].toString() + "\n";
        return aux;
    }

}