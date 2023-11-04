{TRABAJO PRÁCTICO N° 5}
{EJERCICIO 6b}
{Realizar un programa que ocupe 50 KB de memoria en total. Para ello:
(b)	El programa debe utilizar el 50% de memoria estática y el 50% de memoria dinámica.}

program TP5_E6b;
{$codepage UTF8}
uses crt;
const
  KB=50; bytes=51200; vector_total=6399;
type
  t_vector=array[1..vector_total] of int32;
  t_registro_vector=record
    completa: int32;
    vector: t_vector;
  end;
  t_puntero_registro=^t_registro_vector;
var 
  vector: t_vector;
  puntero_registro: t_puntero_registro;
begin
  new(puntero_registro);
  textcolor(green); write('La memoria estática ocupada por vector es '); textcolor(red); write(sizeof(vector)/1024:0:2); textcolor(green); writeln(' KB');
  textcolor(green); write('La memoria estática ocupada por puntero_registro es '); textcolor(red); write(sizeof(puntero_registro)/1024:0:2); textcolor(green); writeln(' KB');
  textcolor(green); write('La memoria dinámica ocupada por contenido puntero_registro es '); textcolor(red); write(sizeof(puntero_registro^)/1024:0:2); textcolor(green); write(' KB');
end.