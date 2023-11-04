{TRABAJO PRÁCTICO N° 2.2}
{EJERCICIO 15}
{Realizar un programa modularizado que lea información de 200 productos de un supermercado.
De cada producto, se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
•	Los códigos de los dos productos más baratos.
•	La cantidad de productos de más de 16 pesos con código par.}

program TP2_E15;
{$codepage UTF8}
uses crt;
const
  productos_total=200; precio_corte=16;
procedure leer_producto(var codigo, precio: int16);
begin
  textcolor(green); write('Introducir código de producto: ');
  textcolor(yellow); readln(codigo);
  textcolor(green); write('Introducir precio de producto: ');
  textcolor(yellow); readln(precio);
end;
procedure actualizar_minimos(precio, codigo: int16; var precio_min1, precio_min2, codigo_min1, codigo_min2: int16);
begin
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
end;
procedure leer_productos(var codigo_min1, codigo_min2, productos_16: int16);
var
  i, codigo, precio, precio_min1, precio_min2: int16;
begin
  for i:= 1 to productos_total do
  begin
    leer_producto(codigo,precio);
    actualizar_minimos(precio,codigo,precio_min1,precio_min2,codigo_min1,codigo_min2);
    if ((precio>precio_corte) and (codigo mod 2=0)) then
      productos_16:=productos_16+1;
  end
end;
var
  codigo_min1, codigo_min2, productos_16: int16;
begin
  codigo_min1:=0; codigo_min2:=0; productos_16:=0;
  leer_productos(codigo_min1,codigo_min2,productos_16);
  textcolor(green); write('Los códigos de los dos productos más baratos son '); textcolor(red); write(codigo_min1); textcolor(green); write(' y '); textcolor(red); writeln(codigo_min2);
  textcolor(green); write('La cantidad de productos de más de 16 pesos con código par es '); textcolor(red); write(productos_16);
end.