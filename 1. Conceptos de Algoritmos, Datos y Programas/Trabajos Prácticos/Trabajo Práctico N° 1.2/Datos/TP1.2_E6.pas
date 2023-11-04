{TRABAJO PRÁCTICO N° 1.2}
{EJERCICIO 6}
{Realizar un programa que lea información de 200 productos de un supermercado.
De cada producto, se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
•	Los códigos de los dos productos más baratos.
•	La cantidad de productos de más de 16 pesos con código par.}

program TP1_E6;
{$codepage UTF8}
uses crt;
const
  productos_total=200;
  precio_corte=16;
var
  i: int16;
  precio, codigo, precio_min1, precio_min2, codigo_min1, codigo_min2, productos_16: int16;
begin
  precio_min1:=high(int16); precio_min2:=high(int16);
  codigo_min1:=0; codigo_min2:=0;
  productos_16:=0;
  for i:= 1 to productos_total do
  begin
    textcolor(green); write('Introducir código del producto: ');
    textcolor(yellow); readln(codigo);
    textcolor(green); write('Introducir precio del producto: ');
    textcolor(yellow); readln(precio);
    if (precio<precio_min1) then
    begin
      precio_min2:=precio_min1;
      codigo_min2:=codigo_min1;
      precio_min1:=precio;
      codigo_min1:=codigo;
    end
    else
      if (precio<precio_min2) then
      begin
        precio_min2:=precio;
        codigo_min2:=codigo;
      end;
    if ((precio>precio_corte) and (codigo mod 2=0)) then
      productos_16:=productos_16+1;
  end;
  textcolor(green); write('Los códigos de los dos productos más baratos son '); textcolor(red); write(codigo_min1); textcolor(green); write(' y '); textcolor(red); writeln(codigo_min2);
  textcolor(green); write('La cantidad de productos de más de 16 pesos con código par es '); textcolor(red); write(productos_16);
end.