{TRABAJO PRÁCTICO N° 1.1}
{EJERCICIO 6b}
{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad.
La lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Por ejemplo, se lee la siguiente secuencia: 33423, 8.40, 19003, 6.43, -1. En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo 19003, cuyo promedio fue 6.43 y, finalmente, el legajo -1 (para el cual no es necesario leer un promedio). Al finalizar la lectura, informar:
(b) La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1).}

program TP1_E6b;
{$codepage UTF8}
uses crt;
const
  legajo_salida=-1;
  promedio_corte=6.5;
var
  legajo, alumnos_promedio_corte: int16;
  promedio: real;
begin
  alumnos_promedio_corte:=0;
  textcolor(green); write('Introducir número de legajo: ');
  textcolor(yellow); readln(legajo);
  while (legajo<>legajo_salida) do
  begin
    textcolor(green); write('Introducir promedio de ese legajo: ');
    textcolor(yellow); readln(promedio);
    if (promedio>promedio_corte) then
      alumnos_promedio_corte:=alumnos_promedio_corte+1;
    textcolor(green); write('Introducir número de legajo: ');
    textcolor(yellow); readln(legajo);
  end;
  textcolor(green); write('La cantidad de alumnos con promedio superior a '); textcolor(red); write(promedio_corte:0:2); textcolor(green); write(' es '); textcolor(red); write(alumnos_promedio_corte);
end.