{TRABAJO PRÁCTICO N° 0}
{EJERCICIO 4a}
{Implementar un programa que lea el diámetro D de un círculo e imprima:
(a) El radio (R) del círculo (la mitad del diámetro).}

program TP0_E4a;
{$codepage UTF8}
uses crt;
var
  diametro, radio: real;
begin
  textcolor(green); write('Introducir diámetro de un círculo');
  textcolor(yellow); readln(diametro);
  radio:=diametro/2;
  textcolor(green); write('El radio del círculo es '); textcolor(red); write(radio:0:2);
end.