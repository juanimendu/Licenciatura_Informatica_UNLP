{TRABAJO PRÁCTICO N° 2.2}
{EJERCICIO 9}
{Realizar un programa modularizado que lea información de alumnos de una facultad.
Para cada alumno, se lee: número de inscripción, apellido y nombre.
La lectura finaliza cuando se ingresa el alumno con número de inscripción 1200, que debe procesarse.
Se pide calcular e informar:
•	Apellido de los dos alumnos con número de inscripción más chico.
•	Nombre de los dos alumnos con número de inscripción más grande.
•	Porcentaje de alumnos con número de inscripción par.}

program TP2_E9;
{$codepage UTF8}
uses crt;
const
  num_salida=1200;
procedure leer_alumno(var num: int32; var apellido, nombre: string);
begin
  textcolor(green); write('Introducir número de inscripción: ');
  textcolor(yellow); readln(num);
  textcolor(green); write('Introducir apellido: ');
  textcolor(yellow); readln(apellido);
  textcolor(green); write('Introducir nombre: ');
  textcolor(yellow); readln(nombre);
end;
procedure actualizar_minimos(num: int32; apellido: string; var num_min1, num_min2: int32; var apellido_min1, apellido_min2: string);
begin
  if (num<num_min1) then
  begin
    num_min2:=num_min1;
    apellido_min2:=apellido_min1;
    num_min1:=num;
    apellido_min1:=apellido;
  end
  else
    if (num<num_min2) then
    begin
      num_min2:=num;
      apellido_min2:=apellido;
    end;
end;
procedure actualizar_maximos(num: int32; nombre: string; var num_max1, num_max2: int32; var nombre_max1, nombre_max2: string);
begin
  if (num>num_max1) then
  begin
    num_max2:=num_max1;
    nombre_max2:=nombre_max1;
    num_max1:=num;
    nombre_max1:=nombre;
  end
  else
    if (num>num_max2) then
    begin
      num_max2:=num;
      nombre_max2:=nombre;
    end;
end;
procedure leer_alumnos(var apellido_min1, apellido_min2, nombre_max1, nombre_max2: string; var porcentaje: real);
var
  alumnos_par, alumnos_total: int16;
  num, num_min1, num_min2, num_max1, num_max2: int32;
  apellido, nombre: string;
begin
  num_min1:=high(int16); num_min2:=high(int16); num_max1:=low(int16); num_max2:=low(int16); alumnos_par:=0; alumnos_total:=0;
  repeat
    leer_alumno(num,apellido,nombre);
    actualizar_minimos(num,apellido,num_min1,num_min2,apellido_min1,apellido_min2);
    actualizar_maximos(num,nombre,num_max1,num_max2,nombre_max1,nombre_max2);
    alumnos_total:=alumnos_total+1;
    if (num mod 2=0) then
      alumnos_par:=alumnos_par+1;
  until (num=num_salida);
  porcentaje:=alumnos_par/alumnos_total*100;
end;
var
  porcentaje: real;
  apellido_min1, apellido_min2, nombre_max1, nombre_max2: string;
begin
  porcentaje:=0;
  leer_alumnos(apellido_min1,apellido_min2,nombre_max1,nombre_max2,porcentaje);
  textcolor(green); write('Los apellidos de los dos alumnos con número de inscripción más chico son '); textcolor(red); write(apellido_min1); textcolor(green); write(' y '); textcolor(red); writeln(apellido_min2);
  textcolor(green); write('Los nombres de los dos alumnos con número de inscripción más grande son '); textcolor(red); write(nombre_max1); textcolor(green); write(' y '); textcolor(red); writeln(nombre_max2);
  textcolor(green); write('El porcentaje de alumnos con número de inscripción par es '); textcolor(red); write(porcentaje:0:2); textcolor(green); write('%');
end.