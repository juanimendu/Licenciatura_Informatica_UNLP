{TRABAJO PRÁCTICO N° 2.2}
{EJERCICIO 17b1}
{Realizar un programa que analice las inversiones de las empresas más grandes del país.
Para cada empresa, se lee su código (un número entero), la cantidad de inversiones que tiene y el monto dedicado a cada una de las inversiones.
La lectura finaliza al ingresar la empresa con código 100, que debe procesarse. El programa deberá informar:
•	Para cada empresa, el monto promedio de sus inversiones.
•	Código de la empresa con mayor monto total invertido.
•	Cantidad de empresas con inversiones de más de $50.000.}

program TP2_E17b1;
{$codepage UTF8}
uses crt;
const
  codigo_salida=100; monto_corte=50000;
procedure empresa_mayor_inversion(monto_sum: int32; codigo: int16; var monto_max: int32; var codigo_max: int16);
begin
  if (monto_sum>monto_max) then 
  begin
    monto_max:=monto_sum;
    codigo_max:=codigo;
  end;
end;
function empresas_50000(monto_sum: int32): int16;
begin
  if (monto_sum>monto_corte) then
    empresas_50000:=1
  else
    empresas_50000:=0;
end;
function promedio_inversiones(monto_sum: int32; inversiones: int16): real;
begin
  promedio_inversiones:=0;
  promedio_inversiones:=monto_sum/inversiones;
end;
procedure leer_empresas(var codigo_max, codigos_50000: int16);
var 
  i, codigo, monto, inversiones: int8;
  monto_sum, monto_max: int32;
  monto_prom: real;
begin
  monto_max:=0;
  repeat
    textcolor(green); write('Introducir código de empresa: ');
    textcolor(yellow); readln(codigo);
    textcolor(green); write('Introducir cantidad de inversiones: ');
    textcolor(yellow); readln(inversiones);
    monto_sum:=0; monto_prom:=0;
    for i:= 1 to inversiones do
    begin
      textcolor(green); write('Introducir monto de la inversión ', i, ': ');
      textcolor(yellow); readln(monto);
      monto_sum:=monto_sum+monto;
    end;
    empresa_mayor_inversion(monto_sum,codigo,monto_max,codigo_max);
    codigos_50000:=codigos_50000+empresas_50000(monto_sum);
    monto_prom:=promedio_inversiones(monto_sum,inversiones);
    textcolor(green); write('El monto promedio de las inversiones de la empresa '); textcolor(red); write(codigo); textcolor(green); write(' es '); textcolor(red); writeln(monto_prom:0:2);
  until (codigo=codigo_salida);
end;
var
  codigo_max, codigos_50000: int16;
begin
  codigo_max:=0; codigos_50000:=0;
  leer_empresas(codigo_max,codigos_50000);
  textcolor(green); write('El código de la empresa con mayor monto total invertido es '); textcolor(red); writeln(codigo_max);
  textcolor(green); write('La cantidad de empresas con inversiones de más de $50.000 es '); textcolor(red); write(codigos_50000);
end.