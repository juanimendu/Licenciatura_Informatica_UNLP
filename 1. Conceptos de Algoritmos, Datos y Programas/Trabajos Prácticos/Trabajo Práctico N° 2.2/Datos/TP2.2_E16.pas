{TRABAJO PRÁCTICO N° 2.2}
{EJERCICIO 16}
{(a) Realizar un módulo que reciba como parámetro el radio de un círculo y retorne su diámetro y su perímetro.
(b) Utilizando el módulo anterior, realizar un programa que analice información de planetas obtenida del Telescopio Espacial Kepler.
De cada planeta, se lee su nombre, su radio (medido en kilómetros) y la distancia (medida en años luz) a la Tierra.
La lectura finaliza al leer un planeta con radio 0, que no debe procesarse. Informar:
•	Nombre y distancia de los planetas que poseen un diámetro menor o igual que el de la Tierra (12.700 km) y mayor o igual que el de Marte (6.780 km).
•	Cantidad de planetas con un perímetro superior al del planeta Júpiter (439.264 km).}

program TP2_E16;
{$codepage UTF8}
uses crt;
const
  radio_salida=0; diametro_tierra=12700; perimetro_jupiter=439264;
procedure circulo(radio: real; var diametro, perimetro: real); 
begin
  diametro:=radio*2;
  perimetro:=pi*diametro;
end;
procedure leer_planeta(var nombre: string; var radio, distancia: real);
begin
  textcolor(green); write('Introducir nombre del planeta: ');
  textcolor(yellow); readln(nombre);
  textcolor(green); write('Introducir radio del planeta (medido en kilómetros): ');
  textcolor(yellow); readln(radio);
  textcolor(green); write('Introducir distancia a la tierra (medida en años luz): ');
  textcolor(yellow); readln(distancia);
end;
procedure leer_planetas(var planetas: int16);
var
  radio, distancia, diametro, perimetro: real;
  nombre: string;
begin
  radio:=0; distancia:=0; diametro:=0; perimetro:=0;
  leer_planeta(nombre,radio,distancia);
  while (radio<>radio_salida) do
  begin
    circulo(radio,diametro,perimetro);
    if (diametro<=diametro_tierra) then
      textcolor(green); write('El planeta '); textcolor(red); write(nombre); textcolor(green); write(' tiene un diámetro menor o igual al de la Tierra (12.700 km), de la que queda a '); textcolor(red); write(distancia:0:2); textcolor(green); writeln(' años luz');
    if (perimetro>perimetro) then
      planetas:=planetas+1;
    leer_planeta(nombre,radio,distancia);
  end;
end;
var
  planetas: int16;
begin
  planetas:=0;
  leer_planetas(planetas);
  textcolor(green); write('La cantidad de planetas con un perímetro superior al del planeta Júpiter (439.264 km) es '); textcolor(red); write(planetas);
end.