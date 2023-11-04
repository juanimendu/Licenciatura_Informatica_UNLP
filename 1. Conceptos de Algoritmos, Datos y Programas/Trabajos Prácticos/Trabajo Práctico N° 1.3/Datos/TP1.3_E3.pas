{TRABAJO PRÁCTICO N° 1.3}
{EJERCICIO 3}
{Un fabricante de tanques de agua está analizando las ventas de sus tanques durante el 2020.
La empresa fabrica tanques a medida, que pueden ser rectangulares (tanques “R”) o cilíndricos (tanques “C”).
•	De cada tanque R, se conoce su ancho (A), su largo (B) y su alto (C).
•	De cada tanque C, se conoce su radio y su alto.
Todas las medidas se ingresan en metros. Realizar un programa que lea la información de los tanques vendidos por la empresa.
La lectura finaliza al ingresar un tanque de tipo ‘Z’. Al finalizar la lectura, el programa debe informar:
•	Volumen de los dos mayores tanques vendidos.
•	Volumen promedio de todos los tanques cilíndricos vendidos.
•	Volumen promedio de todos los tanques rectangulares vendidos.
•	Cantidad de tanques cuyo alto sea menor a 1.40 metros.
•	Cantidad de tanques cuyo volumen sea menor a 800 metros cúbicos.}

program TP1_E3;
{$codepage UTF8}
uses crt;
const
  tanque_salida='Z';
  alto_corte=1.4;
  volumen_corte=800.0;
var
  tanques_c, tanques_r, tanques_140cm, tanques_menor_800m3: int8;
  ancho, largo, alto, radio, volumen, volumen_max1, volumen_max2, volumen_sum_c, volumen_sum_r, volumen_prom_c, volumen_prom_r: real;
  tanque: char;
begin
  tanques_c:=0; tanques_r:=0; tanques_140cm:=0; tanques_menor_800m3:=0;
  volumen_max1:=0; volumen_max2:=0; volumen_sum_c:=0; volumen_sum_r:=0; volumen_prom_c:=0; volumen_prom_r:=0;
  {Introducir tipo de tanque vendido (R o C)}
  textcolor(green); write('Introducir tipo de tanque vendido (R o C): ');
  textcolor(yellow); readln(tanque);
  while (tanque<>tanque_salida) do
  begin
    volumen:=0;
    if (tanque='R') then
    begin
      {Introducir ancho, largo y alto del tanque vendido R}
      textcolor(green); writeln('Introducir ancho, largo y alto del tanque vendido R: ');
      textcolor(yellow); readln(ancho); readln(largo); readln(alto);
      volumen:=ancho*largo*alto;
      volumen_sum_r:=volumen_sum_r+volumen;
      tanques_r:=tanques_r+1;
      if (alto<alto_corte) then
        tanques_140cm:=tanques_140cm+1;
      if (volumen<volumen_corte) then
        tanques_menor_800m3:=tanques_menor_800m3+1;
    end;
    if (tanque='C') then
    begin
      {Introducir radio y alto del tanque vendido C}
      textcolor(green); writeln('Introducir radio y alto del tanque vendido C: ');
      textcolor(yellow); readln(radio); readln(alto);
      volumen:=pi*radio*radio*alto;
      volumen_sum_c:=volumen_sum_c+volumen;
      tanques_c:=tanques_c+1;
      if (alto<alto_corte) then
        tanques_140cm:=tanques_140cm+1;
      if (volumen<volumen_corte) then
        tanques_menor_800m3:=tanques_menor_800m3+1;
    end;
    {Volumen de los dos mayores tanques vendidos}
    if (volumen>volumen_max1) then
    begin
      volumen_max2:=volumen_max1;
      volumen_max1:=volumen;   
    end
    else
      if (volumen>volumen_max2) then
        volumen_max2:=volumen;
    {Introducir tipo de otro tanque vendido (R o C)}
    textcolor(green); write('Introducir tipo de otro tanque vendido (R o C): ');
    textcolor(yellow); readln(tanque);
  end;
  {Volumen promedio de todos los tanques cilíndricos vendidos}
  volumen_prom_c:=volumen_sum_c/tanques_c;
  {Volumen promedio de todos los tanques rectangulares vendidos}
  volumen_prom_r:=volumen_sum_r/tanques_r;
  textcolor(green); write('El volumen de los mayores tanques vendidos es '); textcolor(red); write(volumen_max1:0:2); textcolor(green); write(' y '); textcolor(red); writeln(volumen_max2:0:2);
  textcolor(green); write('El volumen promedio de todos los tanques cilíndricos (C) vendidos es '); textcolor(red); writeln(volumen_prom_c:0:2);
  textcolor(green); write('El volumen promedio de todos los tanques rectangulares (R) vendidos es '); textcolor(red); writeln(volumen_prom_r:0:2);
  textcolor(green); write('La cantidad de tanques cuyo alto es menor a 1.40 metros es '); textcolor(red); writeln(tanques_140cm);
  textcolor(green); write('La cantidad de tanques cuyo volumen es menor a 800 metros cúbicos es '); textcolor(red); writeln(tanques_menor_800m3);
end.