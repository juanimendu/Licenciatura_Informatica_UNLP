{TRABAJO PRÁCTICO N° 5}
{EJERCICIO 1}
{El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas.
Implementar un programa con:
(a) Un módulo que retorne un vector, sin orden, con, a lo sumo, las 300 oficinas que administra.
Se debe leer, para cada oficina, el código de identificación, DNI del propietario y valor de la expensa.
La lectura finaliza cuando llega el código de identificación -1.
(b) Un módulo que reciba el vector retornado en (a) y retorne dicho vector ordenado por código de identificación de la oficina.
Ordenar el vector aplicando uno de los métodos vistos en la cursada.
(c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector generado en (b) y un código de identificación de oficina.
En el caso de encontrarlo, debe retornar la posición del vector donde se encuentra y, en caso contrario, debe retornar 0.
Luego, el programa debe informar el DNI del propietario o un cartel indicando que no se encontró la oficina.
(d) Un módulo recursivo que retorne el monto total de las expensas.}

program TP5_E1;
{$codepage UTF8}
uses crt;
const
  oficinas_min=1; oficinas_max=300; codigo_salida=-1;
type
  t_oficinas=oficinas_min..oficinas_max;
  t_registro_oficinas=record
    codigo: int16;
    dni: int32;
    valor: real;
  end;
  t_vector_oficinas=array[t_oficinas] of t_registro_oficinas;
procedure inicializar_vector_oficinas(var vector_oficinas: t_vector_oficinas);
var
  i: int16;
begin
  for i:= oficinas_min to oficinas_max do
  begin
    vector_oficinas[i].codigo:=0;
    vector_oficinas[i].dni:=0;
    vector_oficinas[i].valor:=0;
  end;
end;
procedure leer_registro_oficinas(var registro_oficinas: t_registro_oficinas);
begin
  textcolor(green); write('Introducir código de identificación de la oficina: '); textcolor(yellow); readln(registro_oficinas.codigo);
  if (registro_oficinas.codigo<>codigo_salida) then
  begin
    textcolor(green); write('Introducir DNI del propietario de la oficina: '); textcolor(yellow); readln(registro_oficinas.dni);
    textcolor(green); write('Introducir valor de la expensa de la oficina: '); textcolor(yellow); readln(registro_oficinas.valor);
  end;
end;
procedure cargar_vector_oficinas(var vector_oficinas: t_vector_oficinas; var oficinas: int16);
var
  registro_oficinas: t_registro_oficinas;
begin
  leer_registro_oficinas(registro_oficinas);
  while ((registro_oficinas.codigo<>codigo_salida) and (oficinas<oficinas_max)) do
  begin
    oficinas:=oficinas+1;
    vector_oficinas[oficinas]:=registro_oficinas;
    leer_registro_oficinas(registro_oficinas);
  end;
end;
procedure ordenar_vector_oficinas(var vector_oficinas: t_vector_oficinas; oficinas: int16);
var
  i, j, k, item: int16;
begin
  for i:= 1 to (oficinas-1) do
  begin
    k:=i;
    for j:= (i+1) to oficinas do
      if (vector_oficinas[j].codigo<vector_oficinas[k].codigo) then
        k:=j;
    item:=vector_oficinas[k].codigo;
    vector_oficinas[k].codigo:=vector_oficinas[i].codigo;
    vector_oficinas[i].codigo:=item;
  end;
end;
function buscar_vector_oficinas(vector_oficinas: t_vector_oficinas; oficinas, codigo: int16): int16;
var
  pri, ult, medio: int16;
begin
  pri:=1; ult:=oficinas; medio:=(pri+ult) div 2;
  while ((pri<=ult) and (vector_oficinas[medio].codigo<>codigo)) do
  begin
    if (vector_oficinas[medio].codigo>codigo) then
      ult:=medio-1
    else
      pri:=medio+1;
    medio:=(pri+ult) div 2;
  end;
  if (pri<=ult) then
    buscar_vector_oficinas:=medio
  else
    buscar_vector_oficinas:=0;
end;
function sumar_expensas(vector_oficinas: t_vector_oficinas; oficinas: int16): real;
var
  suma: real;
begin
  suma:=0;
  if (oficinas<>0) then
    suma:=vector_oficinas[oficinas].valor+sumar_expensas(vector_oficinas,oficinas-1);
  sumar_expensas:=suma;
end;
var
  vector_oficinas: t_vector_oficinas;
  oficinas, codigo, pos: int16;
  expensas: real;
begin
  inicializar_vector_oficinas(vector_oficinas); oficinas:=0;
  cargar_vector_oficinas(vector_oficinas,oficinas);
  ordenar_vector_oficinas(vector_oficinas,oficinas);
  textcolor(green); write('Introducir código de identificación de la oficina que se desea buscar: '); textcolor(yellow); readln(codigo);
  pos:=buscar_vector_oficinas(vector_oficinas,oficinas,codigo);
  if (pos<>0) then
  begin
    textcolor(green); write('El DNI del propietario con código de identificación '); textcolor(red); write(codigo); textcolor(green); write(' es '); textcolor(red); writeln(vector_oficinas[pos].dni);
  end
  else
  begin
    textcolor(red); writeln('No se encontró la oficina');
  end;
  expensas:=sumar_expensas(vector_oficinas,oficinas);
  textcolor(green); write('El monto total de las expensas es $'); textcolor(red); write(expensas:0:2);
end.