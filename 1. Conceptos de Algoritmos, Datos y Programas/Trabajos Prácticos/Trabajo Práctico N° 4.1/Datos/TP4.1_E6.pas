{TRABAJO PRÁCTICO N° 4.1}
{EJERCICIO 6}
{Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y otra para el mínimo),
implementar un único módulo que recorra una única vez el vector y devuelva ambas posiciones.}

program TP4_E6;
{$codepage UTF8}
uses crt;
const
  dimF=100; vector_salida=0;
type
  t_vector=array[1..dimF] of int16;
procedure rellenar_vector(var vector: t_vector; var dimL: int16; dimF: int16);
var
  num: int16;
begin
  textcolor(green); write('Introducir número entero para la posición ', dimL+1, ' del vector: ');
  textcolor(yellow); readln(num);
  while ((num<>vector_salida) and (dimL<dimF)) do
  begin
    dimL:=dimL+1;
    vector[dimL]:=num;
    textcolor(green); write('Introducir número entero para la posición ', dimL+1, ' del vector: ');    
    textcolor(yellow); readln(num);
  end;
end;
procedure intercambio(var vector: t_vector; pos_max, pos_min: int16);
var
  num_aux: int16;
begin
  num_aux:=vector[pos_max];
  vector[pos_max]:=vector[pos_min];
  vector[pos_min]:=num_aux;
end;
procedure elementosMaximoYMinimo(vector: t_vector; dimL: int16; var ele_max, ele_min, pos_max, pos_min: int16);
var
  i: int16;
begin
  for i:= 1 to dimL do
  begin
    if (vector[i]>ele_max) then
    begin
      ele_max:=vector[i];
      pos_max:=i;
    end;
    if (vector[i]<ele_min) then
    begin
      ele_min:=vector[i];
      pos_min:=i;
    end;
  end;
end;
var
  vector: t_vector;
  dimL, ele_max, ele_min, pos_max, pos_min: int16;
begin
  dimL:=0; ele_max:=low(int16); ele_min:=high(int16); pos_max:=0; pos_min:=0;
  rellenar_vector(vector,dimL,dimF);
  elementosMaximoYMinimo(vector,dimL,ele_max,ele_min,pos_max,pos_min);
  intercambio(vector,pos_max,pos_min);
  textcolor(green); write('El elemnento máximo '); textcolor(red); write(ele_max); textcolor(green); write(', que se encontraba en la posición '); textcolor(red); write(pos_max); textcolor(green); write(', fue intercambiado con el elemento mínimo '); textcolor(red); write(ele_min); textcolor(green); write(', que se encontraba en la posición '); textcolor(red); write(pos_min);
end.