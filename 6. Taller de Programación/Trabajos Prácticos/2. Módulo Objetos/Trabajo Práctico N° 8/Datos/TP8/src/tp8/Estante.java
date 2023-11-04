package tp8;

public class Estante {

    private Libro[] libros;
    private int librosMax=20;
    private int cantLibros;

    public Estante() {
        libros=new Libro[librosMax];
        inicializar();
    }

    public Estante(int librosMax) {
        this.librosMax=librosMax;
        libros=new Libro[this.librosMax];
        inicializar();
    }

    private void inicializar() {
        for (int i=0; i<librosMax; i++)
            libros[i]=new Libro();
    }

    private Libro[] getLibros() {
        return libros;
    }

    public int getLibrosMax() {
        return librosMax;
    }

    public int getCantLibros() {
        return cantLibros;
    }

    private boolean quedaEspacio() {
        boolean ok=(cantLibros<librosMax);
        return ok;
    }

    public void agregarLibro(Libro unLibro) {
        if (quedaEspacio()) {
            libros[getCantLibros()]=unLibro;
            cantLibros++;
        }
        else
            System.out.println("No es posible agregar más libros al estante");
    }

    public Libro devolverLibro(String unTitulo) {
        int i=0;
        while ((i<cantLibros) && (!unTitulo.equals(libros[i].getTitulo())))
            i++;
        if (i<cantLibros)
            return libros[i];
        else
            return null;
   }

}