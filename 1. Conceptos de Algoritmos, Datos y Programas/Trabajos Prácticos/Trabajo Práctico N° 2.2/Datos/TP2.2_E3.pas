{TRABAJO PRÁCTICO N° 2.2}
{EJERCICIO 3}
{Encontrar los 6 errores que existen en el siguiente programa.
Utilizar los comentarios entre llaves como guía, indicar en qué línea se encuentra cada error y en qué consiste.}

program TP2_E3;
{$codepage UTF8}
uses crt;
{Suma los números entre a y b y retorna el resultado en c}
procedure sumar(a, b: integer; var c: integer);
var
  i, suma: integer;
begin
  suma:=0;
  for i:= a to b do
    suma:=suma+i;
  c:=c+suma;
end;
var
  result, a, b: integer;
  ok: boolean;
begin
  result:=0;
  readln(a); readln(b);
  sumar(a,b,result);
  write('La suma total es ', result);
  {Averigua si el resultado final estuvo entre 10 y 30}
  ok:=((result>=10) or (result<=30));
  if (not ok) then
    write('La suma no quedó entre 10 y 30');
end.