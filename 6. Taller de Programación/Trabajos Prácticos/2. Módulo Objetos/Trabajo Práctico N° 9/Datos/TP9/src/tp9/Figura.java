package tp9;

public abstract class Figura {

    private String colorRelleno;
    private String colorLinea;

    public Figura(String unColorRelleno, String unColorLinea) {
        setColorRelleno(unColorRelleno);
        setColorLinea(unColorLinea);
    }

    public void setColorRelleno(String unColor) {
        colorRelleno=unColor;
    }

    public void setColorLinea(String unColor) {
        colorLinea=unColor;       
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;       
    }

    public void despintar() {
        setColorRelleno("Blanco");
        setColorLinea("Negro");
    }

    @Override
    public String toString() {
        String aux="Perímetro: " + Math.round(this.calcularPerimetro()) + "; Área: " + Math.round(this.calcularArea()) + "; Color Relleno: "  + getColorRelleno() + "; Color Línea: " + getColorLinea();
        return aux;
    }

    public abstract double calcularPerimetro();
    public abstract double calcularArea();

}