{TRABAJO PRÁCTICO N° 2.2}
{EJERCICIO 6}
{Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa.
Para cada producto, debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
•	Código de los dos productos más baratos.
•	Código del producto de tipo “pantalón” más caro.
•	Precio promedio.}

program TP2_E6;
{$codepage UTF8}
uses crt;
const
  productos_total=100;
procedure leer_producto(var precio, codigo: int16; var tipo: string);
begin
  textcolor(green); write('Introducir precio de producto: ');
  textcolor(yellow); readln(precio);
  textcolor(green); write('Introducir código de producto: ');
  textcolor(yellow); readln(codigo);
  textcolor(green); write('Introducir tipo de producto: ');
  textcolor(yellow); readln(tipo);
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
procedure actualizar_pantalon_mas_caro(precio, codigo: int16; tipo: string; var precio_max, codigo_max: int16);
begin
  if ((tipo='pantalon') and (precio>precio_max)) then
    begin
      precio_max:=precio;
      codigo_max:=codigo;
    end;
end;
procedure leer_productos(var codigo_min1, codigo_min2, codigo_max: int16; var precio_prom: real);
var
  i: int8;
  precio, codigo, precio_min1, precio_min2, precio_max, precio_sum: int16;
  tipo: string;
begin
  precio_min1:=high(int16); precio_min2:=high(int16); precio_max:=low(int16); precio_sum:=0;
  for i:= 1 to productos_total do
  begin
    leer_producto(precio,codigo,tipo);
    actualizar_minimos(precio,codigo,precio_min1,precio_min2,codigo_min1,codigo_min2);
    actualizar_pantalon_mas_caro(precio,codigo,tipo,precio_max,codigo_max);
    precio_sum:=precio_sum+precio;
  end;
  precio_prom:=precio_sum/100;
end;
var
  codigo_min1, codigo_min2, codigo_max: int16;
  precio_prom: real;
begin
  codigo_min1:=0; codigo_min2:=0; codigo_max:=0; precio_prom:=0;
  leer_productos(codigo_min1,codigo_min2,codigo_max,precio_prom);
  textcolor(green); write('Los códigos de los dos productos más baratos son '); textcolor(red); write(codigo_min1); textcolor(green); write(' y '); textcolor(red); writeln(codigo_min2);
  textcolor(green); write('El código del producto de tipo "pantalón" más caro es '); textcolor(red); writeln(codigo_max);
  textcolor(green); write('El precio promedio es $'); textcolor(red); write(precio_prom:0:2);
end.