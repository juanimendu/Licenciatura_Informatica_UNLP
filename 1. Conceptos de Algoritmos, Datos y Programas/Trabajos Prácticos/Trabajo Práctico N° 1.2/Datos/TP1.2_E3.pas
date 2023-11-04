{TRABAJO PRÁCTICO N° 1.2}
{EJERCICIO 3}
{Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera Analista en TIC.
De cada alumno, se lee nombre y nota obtenida en el módulo EPA (la nota es un número entre 1 y 10).
La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe procesarse. Al finalizar la lectura, informar:
•	La cantidad de alumnos aprobados (nota 8 o mayor).
•	La cantidad de alumnos que obtuvieron un 7 como nota.}

program TP1_E3;
{$codepage UTF8}
uses crt;
const
  nombre_salida='Zidane Zinedine';
var
  nota, alumnos_aprobados, alumnos_con_7: int8;
  nombre: string;
begin
  alumnos_aprobados:=0;
  alumnos_con_7:=0;
  repeat
    textcolor(green); write('Introducir apellido y nombre de un alumno: ');
    textcolor(yellow); readln(nombre);
    textcolor(green); write('Introducir nota obtenida en el módulo de EPA: ');
    textcolor(yellow); readln(nota);
    if (nota>=8) then
      alumnos_aprobados:=alumnos_aprobados+1;
    if (nota=7) then
      alumnos_con_7:=alumnos_con_7+1;
  until (nombre=nombre_salida);
  textcolor(green); write('La cantidad de alumnos aprobados (nota 8 o mayor) es '); textcolor(red); writeln(alumnos_aprobados);
  textcolor(green); write('La cantidad de alumnos que obtuvieron un 7 como nota es '); textcolor(red); write(alumnos_con_7);
end.