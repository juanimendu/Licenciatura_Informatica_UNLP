{TRABAJO PRÁCTICO N° 4.1}
{EJERCICIO 1c}
{(c) Si se desea cambiar la línea 11 por la sentencia: for i:=1 to 9 do,
¿cómo debe modificarse el código para que la variable números contenga los mismos valores que en (1.b)?}

program TP4_E1c;
{$codepage UTF8}
uses crt;
type
  vnums=array[1..10] of integer;
var
  numeros: vnums;
  i, j: integer;
begin
  for i:= 1 to 10 do
    numeros[i]:= i;
  for i:= 1 to 9 do
  begin
    j:=i+1;
    numeros[j]:=numeros[j]+numeros[j-1];
    writeln(numeros[j]);
  end;
end.