package tp8;

import PaqueteLectura.*;

public class Habitacion {

    private double costo;
    private boolean ocupada;
    private Cliente cliente;
    
    public Habitacion() {
        costo=2000+GeneradorAleatorio.generarDouble(6001);
    }

    public void setCosto(double unCosto) {
        costo=unCosto;
    }

    public void setOcupada(boolean Ocupada) {
        ocupada=Ocupada;
    }

    public void setCliente(Cliente unCliente) {
        cliente=unCliente;
    }

    public double getCosto() {
        return costo;
    }

    public boolean getOcupada() {
        return ocupada;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void aumentarPrecio(double unPrecio) {
        costo=costo+unPrecio;
    }

    @Override
    public String toString() {
        String aux;
        if (getOcupada())
            aux="Costo $" + Math.round(getCosto()) + "; Ocupada; " + getCliente().toString();
        else
            aux="Costo $" + Math.round(getCosto()) + "; Libre";   
        return aux;
    }

}