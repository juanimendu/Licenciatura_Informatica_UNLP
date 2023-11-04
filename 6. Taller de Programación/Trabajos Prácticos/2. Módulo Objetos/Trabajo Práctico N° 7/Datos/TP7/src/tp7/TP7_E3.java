/*TRABAJO PRÁCTICO N° 7*/
/*EJERCICIO 3*/
/*Se realizará un casting para un programa de TV. El casting durará, a lo sumo, 5 días y, en cada día, se entrevistarán a 8 personas en distinto turno.
(a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las personas primero completan el primer día en turnos sucesivos, luego el segundo día y así siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de casting.
(b) Una vez finalizada la inscripción, informar, para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: Utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar Strings use el método equals.*/

package tp7;

import PaqueteLectura.*;

public class TP7_E3 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();

        int dias=5;
        int turnos=8;
        Persona[][] personas=new Persona[dias][turnos];
        Persona persona=new Persona();
        int nombre_tam=3;
        String nombre_salida="ZZZ";
        int dni_max=50000000;
        int edad_max=100;

        // INCISO (A)
        int i=0;
        int j=0;
        int dimL=0;
        persona.setNombre(GeneradorAleatorio.generarString(nombre_tam));
        while ((!persona.getNombre().equals(nombre_salida)) && (i<dias)) {
            while ((!persona.getNombre().equals(nombre_salida)) && (j<turnos)) {
                persona.setDni(GeneradorAleatorio.generarInt(dni_max));
                persona.setEdad(GeneradorAleatorio.generarInt(edad_max));
                personas[i][j]=persona;
                persona=new Persona();
                persona.setNombre(GeneradorAleatorio.generarString(nombre_tam));
                dimL++;
                j++;
            }
            i++;
            j=0;
        }

        // INCISO (B)
        i=0;
        j=0;
        while ((i<dias) && (dimL>0)) {
            while ((j<turnos) && (dimL>0)) {
                System.out.println("El nombre de la persona a entrevistar en el (día,turno) = (" + (i+1) + "," + (j+1) + ") es " + "'" + personas[i][j].getNombre() + "'");
                dimL--;
                j++;
            }
            i++;
            j=0;
        }

    }

}