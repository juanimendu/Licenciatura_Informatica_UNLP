{TRABAJO PRÁCTICO N° 5}
{EJERCICIO 6a}
{Realizar un programa que ocupe 50 KB de memoria en total. Para ello:
(a) El programa debe utilizar sólo memoria estática.}

program TP5_E6a;
{$codepage UTF8}
uses crt;
const
  KB=50; bytes=51200; vector_total=12800;
type
  t_vector=array[1..vector_total] of int32;
var 
  vector: t_vector;
begin
  textcolor(green); write('La memoria estática ocupada por vector es '); textcolor(red); write(sizeof(vector)/1024:0:2); textcolor(green); writeln(' KB');
end.