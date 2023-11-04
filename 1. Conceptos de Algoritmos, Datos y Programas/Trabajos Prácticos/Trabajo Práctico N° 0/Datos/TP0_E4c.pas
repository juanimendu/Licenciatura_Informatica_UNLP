{TRABAJO PRÁCTICO N° 0}
{EJERCICIO 4c}
{Implementar un programa que lea el diámetro D de un círculo e imprima:
(c) El perímetro del círculo. Para calcular el perímetro del círculo, se debe utilizar la fórmula D * PI (o también R * 2 * PI).}

program TP0_4c;
{$codepage UTF8}
uses crt;
var
  diametro, perimetro: real;
begin
  textcolor(green); write('Introducir diámetro de un círculo');
  textcolor(yellow); readln(diametro);
  perimetro:=pi*diametro;
  textcolor(green); write('El perímetro del círculo es '); textcolor(red); write(perimetro:0:2);
end.