{TRABAJO PRÁCTICO N° 1.3}
{EJERCICIO 1}
{Realizar un programa que analice las inversiones de las empresas más grandes del país.
Para cada empresa, se lee su código (un número entero), la cantidad de inversiones que tiene y el monto dedicado a cada una de las inversiones.
La lectura finaliza al ingresar la empresa con código 100, que debe procesarse. El programa deberá informar:
•	Para cada empresa, el monto promedio de sus inversiones.
•	Código de la empresa con mayor monto total invertido.
•	Cantidad de empresas con inversiones de más de $50.000.}

program TP1_E1;
{$codepage UTF8}
uses crt;
const
  codigo_salida=100;
  monto_corte=50000;
var
  i, codigo, monto, codigo_max, inversiones, codigos_50000: int16;
  monto_sum, monto_max: int32;
  monto_prom: real;
begin
  codigo_max:=low(int16);
  monto_max:=low(int32);
  codigos_50000:=0;
  repeat
    textcolor(green); write('Introducir código de empresa: ');
    textcolor(yellow); readln(codigo);
    textcolor(green); write('Introducir cantidad de inversiones: ');
    textcolor(yellow); readln(inversiones);
    monto_sum:=0;
    monto_prom:=0;
    for i:= 1 to inversiones do
    begin
      textcolor(green); write('Introducir monto de la inversión ', i, ': ');
      textcolor(yellow); readln(monto);
      monto_sum:=monto_sum+monto;
    end;
    if (monto_sum>monto_max) then
    begin
      monto_max:=monto;
      codigo_max:=codigo;
    end;
    if (monto_sum>monto_corte) then
      codigos_50000:=codigos_50000+1;
    monto_prom:=monto_sum/inversiones;
    textcolor(green); write('El monto promedio de las inversiones de la empresa '); textcolor(red); write(codigo); textcolor(green); write(' es '); textcolor(red); writeln(monto_prom:0:2);
  until (codigo=codigo_salida);
  textcolor(green); write('El código de la empresa con mayor monto total invertido es '); textcolor(red); writeln(codigo_max);
  textcolor(green); write('La cantidad de empresas con inversiones de más de $50.000 es '); textcolor(red); write(codigos_50000);
end.