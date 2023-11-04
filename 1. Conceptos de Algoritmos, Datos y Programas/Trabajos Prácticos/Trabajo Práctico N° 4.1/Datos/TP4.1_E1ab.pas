{TRABAJO PRÁCTICO N° 4.1}
{EJERCICIO 1ab}
{(a) ¿Qué valores toma la variable numeros al finalizar el primer bloque for?
(b) Al terminar el programa, ¿con qué valores finaliza la variable numeros?}

program TP4_E1ab;
{$codepage UTF8}
uses crt;
type
  vnums=array[1..10] of integer;
var
  numeros: vnums;
  i: integer;
begin
  for i:= 1 to 10 do
    numeros[i]:= i;
  for i:= 2 to 10 do
    numeros[i]:=numeros[i]+numeros[i-1];
end.