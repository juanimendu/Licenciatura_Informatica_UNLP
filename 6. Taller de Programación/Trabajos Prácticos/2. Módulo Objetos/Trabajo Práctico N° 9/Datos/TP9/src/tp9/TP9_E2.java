/*TRABAJO PRÁCTICO N° 9*/
/*EJERCICIO 2*/
/*Se quiere representar a los empleados de un club: jugadores y entrenadores.
•	Cualquier empleado se caracteriza por su nombre, sueldo básico y antigüedad.
•	Los jugadores son empleados que se caracterizan por el número de partidos jugados y el número de goles anotados.
•	Los entrenadores son empleados que se caracterizan por la cantidad de campeonatos ganados.
(a) Implementar la jerarquía de clases declarando atributos, métodos para obtener/modificar su valor y constructores que reciban los datos necesarios.
(b) Cualquier empleado debe responder al mensaje calcularEfectividad. La efectividad del entrenador es el promedio de campeonatos ganados por año de antigüedad, mientras que la del jugador es el promedio de goles por partido.
(c) Cualquier empleado debe responder al mensaje calcularSueldoACobrar. El sueldo a cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad y además:
•	Para los jugadores: si el promedio de goles por partido es superior a 0,5, se adiciona un plus de otro sueldo básico.
•	Para los entrenadores: se adiciona un plus por campeonatos ganados ($5000 si ha ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos; $50.000 si ha ganado más de 10 campeonatos).
(d) Cualquier empleado debe responder al mensaje toString, que devuelve un String que lo representa, compuesto por nombre, sueldo a cobrar y efectividad.
(f) Realizar un programa que instancie un jugador y un entrenador. Informar la representación String de cada uno.
NOTA: Para cada método a implementar, pensar en qué clase/s se debe definir el método.*/

package tp9;

import PaqueteLectura.*;

public class TP9_E2 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();

        // Instanciar un jugador y un entreador
        int nombre_tam=5;
        int sueldo_max=100;
        int antiguedad_max=10;
        int partidos_max=100;
        int goles_max=100;
        int campeonatos_max=20;
        Jugador jugador=new Jugador(GeneradorAleatorio.generarString(nombre_tam), GeneradorAleatorio.generarDouble(sueldo_max), GeneradorAleatorio.generarInt(antiguedad_max), GeneradorAleatorio.generarInt(partidos_max), GeneradorAleatorio.generarInt(goles_max));
        Entrenador entrenador=new Entrenador(GeneradorAleatorio.generarString(nombre_tam), GeneradorAleatorio.generarDouble(sueldo_max), GeneradorAleatorio.generarInt(antiguedad_max), GeneradorAleatorio.generarInt(campeonatos_max));

        // Informar la representación string de cada uno
        System.out.println("REPRESENTACIÓN STRING DEL JUGADOR: " + jugador.toString());
        System.out.println("REPRESENTACIÓN STRING DEL ENTRENADOR: " + entrenador.toString());

    }

}