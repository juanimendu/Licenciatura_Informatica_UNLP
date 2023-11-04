{TRABAJO PRÁCTICO N° 4.1}
{EJERCICIO 2}
{Dado el siguiente programa, completar las líneas indicadas, considerando que:
•	El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como parámetro.
Al finalizar, debe retornar el vector y su dimensión lógica. La lectura finaliza cuando se ingresa el valor 0 (que no debe procesarse)
o cuando el vector está completo.
•	El módulo modificarVectorySumar debe devolver el vector con todos sus elementos incrementados con el valor n y
también debe devolver la suma de todos los elementos del vector.}

program TP4_E2;
{$codepage UTF8}
uses crt;
const
  cant_datos=150;
type
  vdatos=array[1..cant_datos] of real;
procedure cargarVector(var v: vdatos; var dimL: integer);
var
  num_real: int16;
begin
  textcolor(green); write('Introducir número real: ');
  textcolor(yellow); readln(num_real);
  while ((num_real<>0) and (dimL<=cant_datos)) do
  begin
    dimL:=dimL+1;
    v[dimL]:=num_real;
    textcolor(green); write('Introducir número real: ');
    textcolor(yellow); readln(num_real);
  end;
end;
procedure modificarVectorySumar(var v: vdatos; dimL: integer; n: real; var suma: real);
var
  i: int16;
begin
  for i:= 1 to dimL do
  begin
    v[i]:=v[i]+n;
    suma:=suma+v[i];
  end;
end;
var
  datos: vdatos;
  i, dim: integer;
  num, suma: real;
begin
  dim:=0; suma:=0;
  cargarVector(datos,dim);
  textcolor(green); write('Introducir valor a sumar: ');
  textcolor(yellow); readln(num);
  modificarVectorySumar(datos,dim,num,suma);
  textcolor(green); write('La suma de los valores es '); textcolor(red); writeln(suma:0:2);
  textcolor(green); write('Se procesaron '); textcolor(red); write(dim); textcolor(green); write(' números');
end.