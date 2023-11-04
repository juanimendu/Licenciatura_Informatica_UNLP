{TRABAJO PRÁCTICO N° 4.1}
{EJERCICIO 3}
{Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
(a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
(b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
(c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y desde la mitad más uno hacia la última posición.
(d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la posición X hasta la Y.
Asumir que tanto X como Y son menores o igual a la dimensión lógica.
Y considerar que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
(e) Utilizando el módulo implementado en el inciso anterior, volver a realizar los incisos a, b y c.}

program TP4_E3;
{$codepage UTF8}
uses crt;
type
  t_vector=array of int16;
procedure crear_vector(var vector: t_vector; dimF: int16);
begin
  setLength(vector,dimF);
end;
procedure rellenar_vector(var vector: t_vector; limite_random, dimL: int16);
var
  i: int16;
begin
  for i:= 1 to dimL do
    vector[i]:=random(limite_random);
end;
procedure imprimir_1adimL(vector: t_vector; dimL: int16);
var
  i: int16;
begin
  for i:= 1 to dimL do
    writeln(vector[i]);
end;
procedure imprimir_dimLa1(vector: t_vector; dimL: int16);
var
  i: int16;
begin
  for i:= dimL downto 1 do
    writeln(vector[i]);
end;
procedure imprimir_dimLdiv2(vector: t_vector; dimL: int16);
var
  i, dimLdiv2, dimLdiv2mas1: int16;
begin
  dimLdiv2:=dimL div 2; dimLdiv2mas1:=dimLdiv2+1;
  for i:= dimLdiv2 downto 1 do
    writeln(vector[i]);
  for i:= dimLdiv2mas1 to dimL do
    writeln(vector[i]);
end;
procedure imprimir_general(vector: t_vector);
var
  i, numX, numY: int16;
begin
  textcolor(green); write('Introducir número entero X: ');
  textcolor(yellow); readln(numX);
  textcolor(green); write('Introducir número entero Y: ');
  textcolor(yellow); readln(numY);
  if (numX<=numY) then
  begin
    for i:= numX to numY do
      writeln(vector[i]);
  end
  else
    for i:= numX downto numY do
      writeln(vector[i]);
end;
var
  vector: t_vector;
  limite_random, dimF, dimL: int16;
begin
  randomize;
  textcolor(green); write('Introducir número entero como límite superior de una distribucion aleatoria de la cual se extraerán elementos para el vector: ');
  textcolor(yellow); readln(limite_random);
  textcolor(green); write('Introducir número entero como dimensión física del vector: ');
  textcolor(yellow); readln(dimF);
  textcolor(green); write('Introducir número entero como dimensión lógica del vector: ');
  textcolor(yellow); readln(dimL);
  crear_vector(vector,dimF);
  rellenar_vector(vector,limite_random,dimL);
  imprimir_1adimL(vector,dimL);
  imprimir_dimLa1(vector,dimL);
  imprimir_dimLdiv2(vector,dimL);
  imprimir_general(vector);
end.