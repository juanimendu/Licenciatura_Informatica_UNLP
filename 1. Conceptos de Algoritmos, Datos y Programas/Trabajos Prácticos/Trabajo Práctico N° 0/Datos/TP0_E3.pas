{TRABAJO PRÁCTICO N° 0}
{EJERCICIO 3}
{Implementar un programa que lea dos números reales e imprima el resultado de la división de los mismos con una precisión de dos decimales.
Por ejemplo, si se ingresan los valores 4,5 y 7,2, debe imprimir: “El resultado de dividir 4,5 por 7,2 es 0,62”.}

program TP0_E3;
{$codepage UTF8}
uses crt;
var
  num1, num2: real;
begin
  textcolor(green); write('Introducir número real como dividendo: ');
  textcolor(yellow); readln(num1);
  textcolor(green); write('Introducir número real como divisor: ');
  textcolor(yellow); readln(num2);
  textcolor(green); write('El resultado de dividir '); textcolor(red); write(num1:0:2); textcolor(green); write(' por '); textcolor(red); write(num2:0:2); textcolor(green); write(' es '); textcolor(red); write(num1/num2:0:2);
end.