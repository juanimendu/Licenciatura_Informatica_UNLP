{TRABAJO PRÁCTICO N° 1.2}
{EJERCICIO 1b}
{Modificar el ejercicio anterior para que, además, informe la cantidad de números mayores a 5.}

program TP1_E1b;
{$codepage UTF8}
uses crt;
const
  num_total=10;
var
  i, mayores_a_5: int8;
  num: int16;
  suma: int32;
begin
  suma:=0;
  mayores_a_5:=0;
  for i:= 1 to num_total do
  begin
    textcolor(green); write('Introducir número entero: ');
    textcolor(yellow); readln(num);
    suma:=suma+num;
    if (num>5) then
      mayores_a_5:=mayores_a_5+1;
  end;
  textcolor(green); write('La suma total de los números leídos es '); textcolor(red); writeln(suma);
  textcolor(green); write('La cantidad de números leídos mayores a 5 es '); textcolor(red); write(mayores_a_5);
end.