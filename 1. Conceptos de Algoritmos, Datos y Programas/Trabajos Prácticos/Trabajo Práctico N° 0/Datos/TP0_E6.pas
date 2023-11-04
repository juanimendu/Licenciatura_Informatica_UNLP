{TRABAJO PRÁCTICO N° 0}
{EJERCICIO 6}
{Realizar un programa que informe el valor total en pesos de una transacción en dólares.
Para ello, el programa debe leer el monto total en dólares de la transacción, el valor del dólar al día de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la transacción.
Por ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor 189,32 pesos y el banco cobra un 4% de comisión, entonces, el programa deberá informar:
“La transacción será de 1968,93 pesos argentinos” (resultado de multiplicar 10 * 189,32 y adicionarle el 4%).}

program TP0_E6;
{$codepage UTF8}
uses crt;
var
  monto_dolares, valor_dolar, comision, monto_pesos: real;
begin
  textcolor(green); write('Introducir monto total en dólares de la transacción: ');
  textcolor(yellow); readln(monto_dolares);
  textcolor(green); write('Introducir valor del dólar al día de la fecha: ');
  textcolor(yellow); readln(valor_dolar);
  textcolor(green); write('Introducir valor de la comisión que cobra el banco por la transacción (en porcentaje): ');
  textcolor(yellow); readln(comision);
  monto_pesos:=monto_dolares*valor_dolar*(1-comision/100);
  textcolor(green); write('La transacción será de '); textcolor(red); write(monto_pesos:0:2); textcolor(green); write(' pesos argentinos');
end.