/*TRABAJO PRÁCTICO N° 9*/
/*EJERCICIO 3*/
/*
(a) Implementar las clases para el siguiente problema. Una garita de seguridad quiere identificar los distintos tipos de personas que entran a un barrio cerrado. Al barrio, pueden entrar: personas, que se caracterizan por nombre, DNI y edad; y trabajadores, estos son personas que se caracterizan, además, por la tarea realizada en el predio. Implementar constructores, getters y setters para las clases. Además, tanto las personas como los trabajadores, deben responder al mensaje toString siguiendo el formato:
•	Personas: “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años.”
•	Trabajadores: “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años. Soy jardinero.”
(b) Realizar un programa que instancie una persona y un trabajador y mostrar la representación de cada uno en consola.
NOTA: Reutilizar la clase Persona (carpeta tema2).
*/

package tp9;

import PaqueteLectura.*;

public class TP9_E3 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();

        // Instanciar una persona y un trabajador
        int nombre_tam=5;
        int dni_max=5000000;
        int edad_max=100;
        int tarea_tam=10;
        Persona persona=new Persona(GeneradorAleatorio.generarString(nombre_tam), GeneradorAleatorio.generarInt(dni_max), GeneradorAleatorio.generarInt(edad_max));
        Trabajador trabajador=new Trabajador(GeneradorAleatorio.generarString(nombre_tam), GeneradorAleatorio.generarInt(dni_max), GeneradorAleatorio.generarInt(edad_max), GeneradorAleatorio.generarString(tarea_tam));

        // Mostrar la representación de cada uno en consola
        System.out.println("REPRESENTACIÓN DE LA PERSONA: " + persona.toString());
        System.out.println("REPRESENTACIÓN DEL TRABAJADOR: " + trabajador.toString());

    }

}