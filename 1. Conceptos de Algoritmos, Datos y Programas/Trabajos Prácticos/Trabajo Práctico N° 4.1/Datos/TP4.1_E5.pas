{TRABAJO PRÁCTICO N° 4.1}
{EJERCICIO 5}
{Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros desde teclado (a lo sumo, 100) y los almacene en un vector.
La carga finaliza al leer el número 0. Al finalizar la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento
e informar la operación realizada de la siguiente manera:
“El elemento máximo ... que se encontraba en la posición … fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.}

program TP4_E5;
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
procedure elementoMaximo(vector: t_vector; dimL: int16; var ele_max, pos_max: int16);
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
  end;
end;
procedure elementoMinimo(vector: t_vector; dimL: int16; var ele_min, pos_min: int16);
var
  i: int16;
begin
  for i:= 1 to dimL do
  begin
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
  elementoMaximo(vector,dimL,ele_max,pos_max);
  elementoMinimo(vector,dimL,ele_min,pos_min);
  intercambio(vector,pos_max,pos_min);
  textcolor(green); write('El elemnento máximo '); textcolor(red); write(ele_max); textcolor(green); write(', que se encontraba en la posición '); textcolor(red); write(pos_max); textcolor(green); write(', fue intercambiado con el elemento mínimo '); textcolor(red); write(ele_min); textcolor(green); write(', que se encontraba en la posición '); textcolor(red); write(pos_min);
end.