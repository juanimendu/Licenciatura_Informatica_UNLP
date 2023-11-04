{TRABAJO PRÁCTICO N° 2.1}
{EJERCICIO 6}
{(a) Realizar un módulo que lea de teclado números enteros hasta que llegue un valor negativo.
Al finalizar la lectura, el módulo debe imprimir en pantalla cuál fue el número par más alto.
(b) Implementar un programa que invoque al módulo del inciso a.}

program TP2_E6;
{$codepage UTF8}
uses crt;
const
  num_salida=0;
var 
  num, max: int16;
procedure num_par_mayor;
begin
  num:=0; max:=low(int16);
  textcolor(green); write('Introducir número entero: ');
  textcolor(yellow); readln(num);
  while (num>=num_salida) do
  begin
    if ((num mod 2=0) and (num>max)) then
      max:=num;
    textcolor(green); write('Introducir número entero: ');
    textcolor(yellow); readln(num);
  end;
  textcolor(green); write('El número par más alto fue '); textcolor(red); write(max);
end;
begin
  num_par_mayor;
end.