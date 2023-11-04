{TRABAJO PRÁCTICO N° 0}
{EJERCICIO 4b}
{Implementar un programa que lea el diámetro D de un círculo e imprima:
(b) El área del círculo. Para calcular el área de un círculo, se debe utilizar la fórmula PI x R2.}

program TP0_E4b;
{$codepage UTF8}
uses crt;
var
  diametro, superficie: real;
begin
  textcolor(green); write('Introducir diámetro de un círculo');
  textcolor(yellow); readln(diametro);
  superficie:=pi*sqr(diametro/2);
  textcolor(green); write('La superficie del círculo es '); textcolor(red); write(superficie:0:2);
end.