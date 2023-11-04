{TRABAJO PRÁCTICO N° 1.2}
{EJERCICIO 5}
{Realizar un programa que lea números enteros desde teclado.
La lectura debe finalizar cuando se ingrese el número 100, el cual debe procesarse. Informar en pantalla:
•	El número máximo leído.
•	El número mínimo leído.
•	La suma total de los números leídos.}

program TP1_E5;
{$codepage UTF8}
uses crt;
const
  num_salida=100;
var
  num, max, min, suma: int16;
begin
  max:=low(int16);
  min:=high(int16);
  suma:=0;
  textcolor(green); write('Introducir número entero: ');
  textcolor(yellow); readln(num);
  while (num<>num_salida) do
  begin
    if (num>max) then
      max:=num;
    if (num<min) then
      min:=num;
    suma:=suma+num;
    textcolor(green); write('Introducir número entero: ');
    textcolor(yellow); readln(num);
  end;
  textcolor(green); write('El número máximo leído es '); textcolor(red); writeln(max);
  textcolor(green); write('El número mínimo leído es '); textcolor(red); writeln(min);
  textcolor(green); write('La suma total de los números leídos es '); textcolor(red); write(suma);
end.