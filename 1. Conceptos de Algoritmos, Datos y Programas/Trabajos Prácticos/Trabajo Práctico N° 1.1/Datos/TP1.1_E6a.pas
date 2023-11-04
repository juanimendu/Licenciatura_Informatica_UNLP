{TRABAJO PRÁCTICO N° 1.1}
{EJERCICIO 6a}
{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad.
La lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Por ejemplo, se lee la siguiente secuencia: 33423, 8.40, 19003, 6.43, -1. En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo 19003, cuyo promedio fue 6.43 y, finalmente, el legajo -1 (para el cual no es necesario leer un promedio). Al finalizar la lectura, informar:
(a) La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).}

program TP1_E6a;
{$codepage UTF8}
uses crt;
const
  legajo_salida=-1;
var
  legajo, alumnos_leidos: int16;
  promedio: real;
begin
  alumnos_leidos:=0;
  textcolor(green); write('Introducir número de legajo: ');
  textcolor(yellow); readln(legajo);
  while (legajo<>legajo_salida) do
  begin
    textcolor(green); write('Introducir promedio de ese legajo: ');
    textcolor(yellow); readln(promedio);
    alumnos_leidos:=alumnos_leidos+1;
    textcolor(green); write('Introducir número de legajo: ');
    textcolor(yellow); readln(legajo);
  end;
  textcolor(green); write('La cantidad de alumnos leída es '); textcolor(red); write(alumnos_leidos);
end.