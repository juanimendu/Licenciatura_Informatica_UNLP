/*TRABAJO PRÁCTICO N° 7*/
/*EJERCICIO 4*/
/*Sobre un nuevo programa, modificar el ejercicio anterior para considerar que:
(a) Durante el proceso de inscripción, se pida a cada persona sus datos (nombre, DNI, edad) y el día en que se quiere presentar al casting. La persona debe ser inscripta, en ese día, en el siguiente turno disponible. En caso de no existir un turno en ese día, informar la situación. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de casting.
(b) Una vez finalizada la inscripción, informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la persona a entrevistar en cada turno asignado.*/

package tp7;

import PaqueteLectura.*;

public class TP7_E4 {

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
        int[] vectorDias=new int[dias];
        int i;
        for (i=0; i<dias; i++)
            vectorDias[i]=0;

        // INCISO (A)
        i=0;
        int dia;
        int dimL=0;
        persona.setNombre(GeneradorAleatorio.generarString(nombre_tam));
        while ((!persona.getNombre().equals(nombre_salida)) && (i<dias*turnos)) {
            dia=GeneradorAleatorio.generarInt(dias);
            if (vectorDias[dia]==turnos)
                System.out.println("No quedan más turnos para el día " + dia);
            else {
                persona.setDni(GeneradorAleatorio.generarInt(dni_max));
                persona.setEdad(GeneradorAleatorio.generarInt(edad_max));
                personas[dia][vectorDias[dia]]=persona;
                persona=new Persona();
                dimL++;
                vectorDias[dia]++;
            }
            persona.setNombre(GeneradorAleatorio.generarString(nombre_tam));
            i++;
        }

        // INCISO (B)
        int j=0;
        for (i=0; i<dias; i++) {
            System.out.println("La cantidad de inscriptos al casting en el día " + (i+1) + " es " + vectorDias[i]);
            while ((dimL>0) && (vectorDias[i]>0)) {
                System.out.println("El nombre de la persona a entrevistar en el (día,turno) = (" + (i+1) + "," + (j+1) + ") es " + "'" + personas[i][j].getNombre() + "'");
                vectorDias[i]--;
                j++;
            }
            j=0;
        }

    }

}