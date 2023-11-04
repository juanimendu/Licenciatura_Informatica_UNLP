{TRABAJO PRÁCTICO N° 1.1}
{EJERCICIO 6c}
{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad.
La lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Por ejemplo, se lee la siguiente secuencia: 33423, 8.40, 19003, 6.43, -1. En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo 19003, cuyo promedio fue 6.43 y, finalmente, el legajo -1 (para el cual no es necesario leer un promedio). Al finalizar la lectura, informar:
(c) El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajos sean menor al valor 2500 (en el ejemplo anterior, se debería informar 0%).}


program TP1_E6c;
{$codepage UTF8}
uses crt;
const
  legajo_salida=-1;
  legajo_max=2500;
  promedio_corte=8.5;
var
  legajo, alumnos_destacados, alumnos_leidos: int16;
  promedio, porcentaje_alumnos_destacados: real;
begin
  alumnos_destacados:=0;
  alumnos_leidos:=0;
  porcentaje_alumnos_destacados:=0;
  textcolor(green); write('Introducir número de legajo: ');
  textcolor(yellow); readln(legajo);
  while (legajo<>legajo_salida) do
  begin
    textcolor(green); write('Introducir promedio de ese legajo: ');
    textcolor(yellow); readln(promedio);
    alumnos_leidos:=alumnos_leidos+1;
    if ((promedio>promedio_corte) and (legajo<legajo_max)) then
      alumnos_destacados:=alumnos_destacados+1;
    textcolor(green); write('Introducir número de legajo: ');
    textcolor(yellow); readln(legajo);
  end;
  porcentaje_alumnos_destacados:=alumnos_destacados/alumnos_leidos*100;
  textcolor(green); write('El porcentaje de alumnos destacados cuyos legajos son menor al valor '); textcolor(red); write(legajo_max); textcolor(green); write(' es del '); textcolor(red); write(porcentaje_alumnos_destacados:0:2); textcolor(green); write('%')
end.