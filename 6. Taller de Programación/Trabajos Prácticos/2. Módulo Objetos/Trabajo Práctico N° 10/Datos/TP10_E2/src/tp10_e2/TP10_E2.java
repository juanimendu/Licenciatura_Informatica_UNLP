/*TRABAJO PRÁCTICO N° 10*/
/*EJERCICIO 2*/
/*Se quiere un sistema para gestionar estacionamientos.
Un estacionamiento conoce su nombre, dirección, hora de apertura, hora de cierre y almacena, para cada número de piso (1..N) y número de plaza (1..M), el auto que ocupa dicho lugar.
De los autos, se conoce nombre del dueño y patente.
(a) Generar las clases, incluyendo getters y setters adecuados.
(b) Implementar constructores. En particular, para el estacionamiento:
•	Un constructor debe recibir nombre y dirección e iniciar el estacionamiento con hora de apertura “8:00”, hora de cierre “21:00” y para 5 pisos y 10 plazas por piso. El estacionamiento inicialmente no tiene autos.
•	Otro constructor debe recibir nombre, dirección, hora de apertura, hora de cierre, el número de pisos (N) y el número de plazas por piso (M) e iniciar el estacionamiento con los datos recibidos y sin autos.
(c) Implementar métodos para:
•	Dado un auto A, un número de piso X y un número de plaza Y, registrar al auto en el estacionamiento en el lugar X,Y. Suponga que X, Y son válidos (es decir, están en rango 1..N y 1..M, respectivamente) y que el lugar está desocupado.
•	Dada una patente, obtener un String que contenga el número de piso y plaza donde está dicho auto en el estacionamiento. En caso de no encontrarse, retornar el mensaje “Auto Inexistente”.
•	Obtener un String con la representación del estacionamiento.
Ejemplo: “Piso 1 Plaza 1: libre; Piso 1 Plaza 2: representación del auto; …;  Piso 2 Plaza 1: libre; …”
•	Dado un número de plaza Y, obtener la cantidad de autos ubicados en dicha plaza (teniendo en cuenta todos los pisos).
(d) Realizar un programa que instancie un estacionamiento con 3 pisos y 3 plazas por piso. Registrar 6 autos en el estacionamiento en distintos lugares. Mostrar la representación String del estacionamiento en consola. Mostrar la cantidad de autos ubicados en la plaza 1. Leer una patente por teclado e informar si dicho auto se encuentra en el estacionamiento o no. En caso de encontrarse, la información a imprimir es el piso y plaza que ocupa.*/

package tp10_e2;

import PaqueteLectura.*;

public class TP10_E2 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();

        // Instanciar un estacionamiento con 3 pisos y 3 plazas por piso
        int tam=5;
        int horaApertura=6+GeneradorAleatorio.generarInt(5);
        int horaCierre=18+GeneradorAleatorio.generarInt(5);
        int cantPisos=3;
        int cantPlazas=3;
        Estacionamiento estacionamiento=new Estacionamiento(GeneradorAleatorio.generarString(tam), GeneradorAleatorio.generarString(tam), GeneradorAleatorio.generarInt(horaApertura), GeneradorAleatorio.generarInt(horaCierre), cantPisos, cantPlazas);

        // Registrar 6 autos en el estacionamiento en distintos lugares
        Auto auto;
        int i=6;
        while (i!=0) {
            auto=new Auto(GeneradorAleatorio.generarString(tam), GeneradorAleatorio.generarString(tam));
            estacionamiento.registrarAuto(auto, GeneradorAleatorio.generarInt(cantPisos), GeneradorAleatorio.generarInt(cantPisos));
            i--;
        }

        // Mostrar la representación String del estacionamiento en consola
        System.out.println(estacionamiento.toString());

        // Mostrar la cantidad de autos ubicados en la plaza 1
        System.out.println("La cantidad de autos ubicados en la plaza 1 es " + estacionamiento.autosPorPlaza(0));

        // Leer una patente por teclado e informar si dicho auto se encuentra en el estacionamiento o no. En caso de encontrarse, la información a imprimir es el piso y plaza que ocupa
        System.out.print("Introducir patente para buscar el auto en el estacionamiento: ");
        String patente=Lector.leerString();
        System.out.println(estacionamiento.buscarPatente(patente));

    }
    
}