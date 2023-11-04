/*TRABAJO PRÁCTICO N° 7*/
/*EJERCICIO 2*/
/*Utilizando la clase Persona, realizar un programa que almacene en un vector, a lo sumo, 15 personas.
La información (nombre, DNI, edad) se debe generar aleatoriamente hasta obtener edad 0. Luego de almacenar la información:
•	Informar la cantidad de personas mayores de 65 años.
•	Mostrar la representación de la persona con menor DNI.*/

package tp7;

import PaqueteLectura.*;

public class TP7_E2 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();

        // Almacenar en un vector, a lo sumo, 15 personas
        int dimF=15;
        Persona[] personas=new Persona[dimF];
        Persona persona=new Persona();
        int dimL=0;
        int nombre_tam=10;
        int dni_max=50000000;
        int edad_max=100;
        int edad_salida=0;
        persona.setEdad(GeneradorAleatorio.generarInt(edad_max));
        while ((persona.getEdad()!=edad_salida) && (dimL<dimF)) {
            persona.setNombre(GeneradorAleatorio.generarString(nombre_tam));
            persona.setDni(GeneradorAleatorio.generarInt(dni_max));
            personas[dimL]=persona;
            persona=new Persona();
            persona.setEdad(GeneradorAleatorio.generarInt(edad_max));
            dimL++;
        }

        // Informar la cantidad de personas mayores de 65 años
	// Mostrar la representación de la persona con menor DNI
        int edad_corte=65;
        int cant=0;
        Persona personaMenorDni=new Persona();
        int dni_min=dni_max;
        for (int i=0; i<dimL; i++) {
            if (personas[i].getEdad()>edad_corte)
                cant++;
            if (personas[i].getDni()<dni_min) {
                dni_min=personas[i].getDni();
                personaMenorDni=personas[i];
            }
        }
        System.out.println("La cantidad de personas mayores de 65 años es " + cant);
        System.out.println("La representación de la persona con menor DNI es " + "'" + personaMenorDni.toString() + "'");

    }

}