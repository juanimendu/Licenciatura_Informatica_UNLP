package tp10_e1;

public class Subsidio {

    private double monto;
    private String motivo;
    private boolean otorgado;

    public Subsidio(double unMonto, String unMotivo) {
        setMonto(unMonto);
        setMotivo(unMotivo);
    }

    public Subsidio() {
        
    }

    public void setMonto(double unMonto) {
        monto=unMonto;
    }

    public void setMotivo(String unMotivo) {
        motivo=unMotivo;
    }

    public void setOtorgado(boolean Otorgado) {
        otorgado=Otorgado;
    }

    public double getMonto() {
        return monto;
    }

    public String getMotivo() {
        return motivo;
    }

    public boolean getOtorgado() {
        return otorgado;
    }

}