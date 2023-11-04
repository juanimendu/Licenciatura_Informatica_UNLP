{TRABAJO PRÁCTICO N° 2.1}
{EJERCICIO 7b}
{Dado el siguiente programa:
(b) En el programa principal, la función calcularPromedio es invocada dos veces, pero esto podría mejorarse.
¿Cómo debería modificarse el programa principal para invocar a dicha función una única vez?}

program TP2_E7b;
{$codepage UTF8}
uses crt;
var
  suma, cant: int16;
  prom: real;
function calcularPromedio: real;
begin
  if (cant=0) then
    prom:=-1
  else
    prom:=suma/cant;
  calcularPromedio:=prom;
end;
begin
  prom:=0;
  textcolor(green); write('Introducir suma: ');
  textcolor(yellow); readln(suma);
  textcolor(green); write('Introducir cantidad: ');
  textcolor(yellow); readln(cant);
  if (calcularPromedio<>-1) then
  begin
    textcolor(green); write('El promedio es '); textcolor(red); write(prom:0:2);
  end
  else
  begin
    textcolor(green); write('Dividir por cero no parece ser una buena idea');
  end;
end.