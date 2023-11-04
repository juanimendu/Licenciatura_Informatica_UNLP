{TRABAJO PRÁCTICO N° 3}
{EJERCICIO 5}
{Realizar un programa que lea información de autos que están a la venta en una concesionaria.
De cada auto, se lee: marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse.
La información se ingresa ordenada por marca. Se pide calcular e informar:
•	El precio promedio por marca.
•	Marca y modelo del auto más caro.}

program TP3_E5;
{$codepage UTF8}
uses crt;
const
  marca_salida='ZZZ';
type
  t_registro_auto=record
    marca: string;
    modelo: string;
    precio: int32;
  end;
procedure leer_auto(var registro_auto: t_registro_auto);
begin
  textcolor(green); write('Introducir marca del auto: '); textcolor(yellow); readln(registro_auto.marca);
  if (registro_auto.marca<>marca_salida) then
  begin
    textcolor(green); write('Introducir modelo del auto: '); textcolor(yellow); readln(registro_auto.modelo);
    textcolor(green); write('Introducir precio del auto: '); textcolor(yellow); readln(registro_auto.precio);
  end;
end;
procedure actualizar_maximos(registro_auto: t_registro_auto; var precio_max: int32; var marca_max, modelo_max: string);
begin
  if (registro_auto.precio>precio_max) then
  begin
    precio_max:=registro_auto.precio;
    marca_max:=registro_auto.marca;
    modelo_max:=registro_auto.modelo;
  end;
end;
procedure leer_autos(var marca_max, modelo_max: string);
var
  registro_auto: t_registro_auto;
  precio_max, precio_sum, autos_total: int32;
  precio_prom: real;
  marca: string;
begin
  precio_max:=0;
  leer_auto(registro_auto);
  while (registro_auto.marca<>marca_salida) do
  begin
    marca:=registro_auto.marca; precio_sum:=0; autos_total:=0; precio_prom:=0;
    while ((registro_auto.marca=marca) and (registro_auto.marca<>marca_salida)) do
    begin
      precio_sum:=precio_sum+registro_auto.precio;
      autos_total:=autos_total+1;
      actualizar_maximos(registro_auto,precio_max,marca_max,modelo_max);
      leer_auto(registro_auto);
    end;
    precio_prom:=precio_sum/autos_total;
    textcolor(green); write('El promedio de la marca '); textcolor(red); write(marca); textcolor(green); write(' es '); textcolor(red); writeln(precio_prom:0:2);
  end;
end;
var
  marca_max, modelo_max: string;
begin
  leer_autos(marca_max,modelo_max);
  textcolor(green); write('La marca y el modelo del auto más caro son '); textcolor(red); write(marca_max); textcolor(green); write(' y '); textcolor(red); write(modelo_max); textcolor(green); write(', respectivamente');
end.