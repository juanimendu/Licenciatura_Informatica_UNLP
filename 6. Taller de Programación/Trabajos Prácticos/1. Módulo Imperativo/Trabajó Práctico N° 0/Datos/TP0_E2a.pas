{TRABAJO PRÁCTICO N° 0}
{EJERCICIO 2a}
{Implementar un programa que procese información de propiedades que están a la venta en una inmobiliaria.
(a) Implementar un módulo para almacenar, en una estructura adecuada, las propiedades agrupadas por zona.
Las propiedades de una misma zona deben quedar almacenadas ordenadas por tipo de propiedad.
Para cada propiedad, debe almacenarse el código, el tipo de propiedad y el precio total.
De cada propiedad, se lee: zona (1 a 5), código de propiedad, tipo de propiedad, cantidad de metros cuadrados y precio del metro cuadrado.
La lectura finaliza cuando se ingresa el precio del metro cuadrado -1.}

program TP0_E2a;
{$codepage UTF8}
uses crt;
const
  zona_min=1; zona_max=5; tipo_min=1; tipo_max=3; preciom2_salida=-1;
type
  t_zonas=zona_min..zona_max;
  t_tipos=tipo_min..tipo_max;
  t_registro_propiedad=record
    codigo: int16;
    tipo: t_tipos;
    precio_total: real;
  end;
  t_lista_propiedades=^t_nodo_propiedades;
  t_nodo_propiedades=record
    ele: t_registro_propiedad;
    sig: t_lista_propiedades;
  end;
  t_vector_propiedades=array[t_zonas] of t_lista_propiedades;
procedure inicializar_vector_propiedades(var vector_propiedades: t_vector_propiedades);
var
  i: t_zonas;
begin
  for i:= zona_min to zona_max do
    vector_propiedades[i]:=nil;
end;
procedure cargar_registro_propiedad(var registro_propiedad: t_registro_propiedad; preciom2: real);
var
  m2: real;
begin
  textcolor(green); write('Introducir código de la propiedad: ');
  textcolor(yellow); readln(registro_propiedad.codigo);
  textcolor(green); write('Introducir tipo de propiedad (1: Casa, 2: Departamento, 3: Lote): ');
  textcolor(yellow); readln(registro_propiedad.tipo);
  textcolor(green); write('Introducir cantidad de metros cuadrados de la propiedad: ');
  textcolor(yellow); readln(m2);
  registro_propiedad.precio_total:=m2*preciom2;
end;
procedure agregar_ordenado_lista_propiedades(var lista_propiedades: t_lista_propiedades; registro_propiedad: t_registro_propiedad);
var
  anterior, actual, nuevo: t_lista_propiedades;
begin
  new(nuevo); nuevo^.ele:=registro_propiedad;
  anterior:=lista_propiedades; actual:=lista_propiedades;
  while ((actual<>nil) and (actual^.ele.tipo<nuevo^.ele.tipo)) do
  begin
    anterior:=actual;
    actual:=actual^.sig;
  end;
  if (actual=lista_propiedades) then
    lista_propiedades:=nuevo
  else
    anterior^.sig:=nuevo;
  nuevo^.sig:=actual;
end;
procedure cargar_vector_propiedades(var vector_propiedades: t_vector_propiedades);
var
  registro_propiedad: t_registro_propiedad;
  zona: t_zonas;
  preciom2: real;
begin
  textcolor(green); write('Introducir precio del metro cuadrado de la propiedad: ');
  textcolor(yellow); readln(preciom2);
  while (preciom2<>preciom2_salida) do
  begin
    textcolor(green); write('Introducir zona de la propiedad (1 a 5): ');
    textcolor(yellow); readln(zona);
    cargar_registro_propiedad(registro_propiedad,preciom2);
    agregar_ordenado_lista_propiedades(vector_propiedades[zona],registro_propiedad);
    textcolor(green); write('Introducir precio del metro cuadrado de la propiedad: ');
    textcolor(yellow); readln(preciom2);
  end;
end;
var
  vector_propiedades: t_vector_propiedades;
begin
  inicializar_vector_propiedades(vector_propiedades);
  cargar_vector_propiedades(vector_propiedades);
end.