/*TRABAJO PRÁCTICO N° 6*/
/*EJERCICIO 2*/
/*Escribir un programa que lea las alturas de los 15 jugadores de un equipo de básquet y las almacene en un vector. Luego, informar:
•	La altura promedio.
•	La cantidad de jugadores con altura por encima del promedio.
NOTA: Se dispone de un esqueleto para este programa en Ej02Jugadores.java.*/

package tp6;

import PaqueteLectura.*;

public class TP6_E2 {

    public static void main(String[] args) {

        // Leer alturas de los 15 jugadores de un equipo de básquet y almacenarlos en un vector
        int dimF=15;
        double[] alturas=new double[dimF];
        double suma=0;
        for (int i=0; i<dimF; i++) {
            System.out.print("Introducir altura del jugador " + (i+1) + ": ");
            alturas[i]=Lector.leerDouble();
            suma+=alturas[i];
        }

        // Informar altura promedio
        double prom=suma/dimF;
        System.out.println("La altura promedio es " + prom + " metros");

        // Informar la cantidad de jugadores con altura por encima del promedio
        int cant=0;
        for (int i=0; i<dimF; i++)
            if (alturas[i]>prom)
                cant++;
        System.out.println("La cantidad de jugadores con altura por encima del promedio es " + cant);

    }

}