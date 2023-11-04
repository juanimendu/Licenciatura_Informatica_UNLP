{TRABAJO PRÁCTICO N° 1.2}
{EJERCICIO 7}
{Realizar un programa que lea desde teclado información de autos de carrera.
Para cada uno de los autos, se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera.
En la carrera, participaron 100 autos. Informar en pantalla:
•	Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
•	Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}

program TP1_E7;
{$codepage UTF8}
uses crt;
const
  productos_salida=200;
var
  tiempo, tiempo_min1, tiempo_min2, tiempo_max1, tiempo_max2: int8;
  i: int16;
  nombre, nombre_min1, nombre_min2, nombre_max1, nombre_max2: string;
begin
  tiempo_min1:=high(int8); tiempo_min2:=high(int8);
  tiempo_max1:=0; tiempo_max2:=0;
  nombre_min1:='XXX'; nombre_min2:='XXX';
  nombre_max1:='XXX'; nombre_max2:='XXX';
  for i:= 1 to productos_salida do
  begin
    textcolor(green); write('Introducir nombre de un piloto: ');
    textcolor(yellow); readln(nombre);
    textcolor(green); write('Introducir tiempo total que le tomó finalizar la carrera: ');
    textcolor(yellow); readln(tiempo);
    if (tiempo<tiempo_min1) then
    begin
      tiempo_min2:=tiempo_min1;
      nombre_min2:=nombre_min1;
      tiempo_min1:=tiempo;
      nombre_min1:=nombre;
    end
    else
      if (tiempo<tiempo_min2) then
      begin
        tiempo_min2:=tiempo;
        nombre_min2:=nombre;
      end;
    if (tiempo>tiempo_max1) then
    begin
      tiempo_max2:=tiempo_max1;
      nombre_max2:=nombre_max1;
      tiempo_max1:=tiempo;
      nombre_max1:=nombre;
    end
    else
      if (tiempo>tiempo_max2) then
      begin
        tiempo_max2:=tiempo;
        nombre_max2:=nombre;
      end;
  end;
  textcolor(green); write('Los nombres de los dos pilotos que finalizaron en los dos primeros puestos son '); textcolor(red); write(nombre_min1); textcolor(green); write(' y '); textcolor(red); writeln(nombre_min2);
  textcolor(green); write('Los nombres de los dos pilotos que finalizaron en los dos últimos puestos son '); textcolor(red); write(nombre_max2); textcolor(green); write(' y '); textcolor(red); write(nombre_max1);
end.