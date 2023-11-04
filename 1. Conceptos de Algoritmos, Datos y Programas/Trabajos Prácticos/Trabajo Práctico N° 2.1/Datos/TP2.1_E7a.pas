{TRABAJO PRÁCTICO N° 2.1}
{EJERCICIO 7a}
{Dado el siguiente programa:
(a) La función calcularPromedio calcula y retorna el promedio entre las variables globales suma y cant, pero parece incompleta.
¿Qué debería agregarle para que funcione correctamente?}

program TP2_E7a;
{$codepage UTF8}
uses crt;
var
  suma, cant: int16;
function calcularPromedio: real;
var
  prom: real;
begin
  if (cant=0) then
    prom:=-1
  else
    prom:=suma/cant;
  calcularPromedio:=prom;
end;
begin
  textcolor(green); write('Introducir suma: ');
  textcolor(yellow); readln(suma);
  textcolor(green); write('Introducir cantidad: ');
  textcolor(yellow); readln(cant);
  if (calcularPromedio<>-1) then
  begin
    textcolor(green); write('El promedio es '); textcolor(red); write(calcularPromedio:0:2);
  end
  else
  begin
    textcolor(green); write('Dividir por cero no parece ser una buena idea');
  end;
end.