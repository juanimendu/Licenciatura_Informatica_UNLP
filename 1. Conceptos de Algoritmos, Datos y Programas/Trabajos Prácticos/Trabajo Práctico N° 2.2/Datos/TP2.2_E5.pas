{TRABAJO PRÁCTICO N° 2.2}
{EJERCICIO 5}
{(a) Realizar un módulo que reciba un par de números (numA, numB) y retorne si numB es el doble de numA.
(b) Utilizando el módulo realizado en el inciso (a), realizar un programa que lea secuencias de pares de números hasta encontrar el par (0,0),
e informe la cantidad total de pares de números leídos y la cantidad de pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia (1,2) (3,4) (9,3) (7,14) (0,0), el programa debe informar los valores 4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}

program TP2_E5;
{$codepage UTF8}
uses crt;
const
  numA_salida=0; numB_salida=0; multiplo_2=2;
function multiplo(numA, numB: int16): boolean;
begin
  multiplo:=(numB=multiplo_2*numA);
end;
var
  pares_leidos, doble: int8;
  numA, numB: int16;
begin
  pares_leidos:=0; doble:=0;
  textcolor(green); write('Introducir número entero A: ');
  textcolor(yellow); readln(numA);
  textcolor(green); write('Introducir número entero B: ');
  textcolor(yellow); readln(numB);
  while ((numA<>numA_salida) or (numB<>numB_salida)) do
  begin
    if (multiplo(numA,numB)=true) then
      doble:=doble+1;
    pares_leidos:=pares_leidos+1;
    textcolor(green); write('Introducir número entero A: ');
    textcolor(yellow); readln(numA);
    textcolor(green); write('Introducir número entero B: ');
    textcolor(yellow); readln(numB);
  end;
  textcolor(green); write('La cantidad total de pares leídos es '); textcolor(red); writeln(pares_leidos);
  textcolor(green); write('La cantidad de pares en las que numB es el doble de numA es '); textcolor(red); write(doble);
end.