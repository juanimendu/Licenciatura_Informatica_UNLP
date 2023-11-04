{TRABAJO PRÁCTICO N° 1.1}
{EJERCICIO 7}
{Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un almacén.
La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.
Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un 10% al precio anterior.
Por ejemplo:
•	Si se ingresa el código 10382, con precio actual 40 y nuevo precio 44, deberá imprimir: “El aumento de precio del producto 10382 no supera el 10%”.
•	Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “El aumento de precio del producto 32767 es superior al 10%”.}

program TP1_E7;
{$codepage UTF8}
uses crt;
const
  codigo_salida=32767;
  porcentaje_corte=10;
var
  codigo, precio_anterior, precio_nuevo: int16;
  variacion: real;
begin
  while (codigo<>codigo_salida) do
  begin
    textcolor(green); write('Introducir código: ');
    textcolor(yellow); readln(codigo);
    textcolor(green); write('Introducir precio actual: ');
    textcolor(yellow); readln(precio_anterior);
    textcolor(green); write('Introducir precio nuevo: ');
    textcolor(yellow); readln(precio_nuevo);
    variacion:=(precio_nuevo/precio_anterior-1)*100;
    if (variacion<=porcentaje_corte) then
    begin
      textcolor(green); write('El aumento de precio del producto '); textcolor(red); write(codigo); textcolor(green); write(' no supera el '); textcolor(red); write(porcentaje_corte); textcolor(green); writeln('%');
    end
    else
    begin
      textcolor(green); write('El aumento de precio del producto '); textcolor(red); write(codigo); textcolor(green); write(' es superior al '); textcolor(red); write(porcentaje_corte); textcolor(green); write('%');
    end;
  end;
end.