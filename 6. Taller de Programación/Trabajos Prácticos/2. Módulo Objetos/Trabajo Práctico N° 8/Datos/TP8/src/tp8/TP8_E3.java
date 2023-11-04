/*TRABAJO PRÁCTICO N° 8*/
/*EJERCICIO 3*/
/*
(a) Definir una clase para representar estantes. Un estante almacena, a lo sumo, 20 libros. Implementar un constructor que permita iniciar el estante sin libros. Proveer métodos para:
•	Devolver la cantidad de libros que almacenados.
•	Devolver si el estante está lleno.
•	Agregar un libro al estante.
•	Devolver el libro con un título particular que se recibe.
(b) Realizar un programa que instancie un estante. Cargar varios libros. A partir del estante, buscar e informar el autor del libro “Mujercitas”.
(c) ¿Qué se modificaría en la clase definida para, ahora, permitir estantes que almacenen como máximo N libros? ¿Cómo se instanciaría el estante?
*/

package tp8;

import PaqueteLectura.*;

public class TP8_E3 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();

        // Instanciar un estante
        System.out.print("Introducir número de libros que almacena el estante: ");
        int cantLibros=Lector.leerInt();
        Estante estante=new Estante(cantLibros);

        // Cargar varios libros
        int tam=5;
        for (int i=0; i<cantLibros; i++) {
            Autor autor=new Autor(GeneradorAleatorio.generarString(tam), GeneradorAleatorio.generarString(tam), GeneradorAleatorio.generarString(tam));
            Libro libro=new Libro(GeneradorAleatorio.generarString(tam), GeneradorAleatorio.generarString(tam), GeneradorAleatorio.generarInt(tam), autor, GeneradorAleatorio.generarString(tam), GeneradorAleatorio.generarDouble(tam));
            if (i==cantLibros-1)
                libro.setTitulo("Mujercitas");
            estante.agregarLibro(libro);
        }

        // A partir del estante, buscar e informar el autor del libro "Mujercitas"
        System.out.println("El autor del libro 'Mujercitas' es " + estante.devolverLibro("Mujercitas").getPrimerAutor().getNombre());

    }

}