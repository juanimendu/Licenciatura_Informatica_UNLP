{TRABAJO PRÁCTICO N° 5}
{EJERCICIO 3}
{Un supermercado requiere el procesamiento de sus productos. De cada producto, se conoce código, rubro (1..10), stock y precio unitario.
Se pide:
(a) Generar una estructura adecuada que permita agrupar los productos por rubro.
A su vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo más eficiente posible.
La lectura finaliza con el código de producto igual a -1.
(b) Implementar un módulo que reciba la estructura generada en (a), un rubro y un código de producto y retorne si dicho código existe o no para ese rubro.
(c) Implementar un módulo que reciba la estructura generada en (a) y retorne, para cada rubro, el código y stock del producto con mayor código.
(d) Implementar un módulo que reciba la estructura generada en (a), dos códigos y retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores ingresados.}

program TP5_E3;
{$codepage UTF8}
uses crt;
const
  rubro_min=1; rubro_max=10; codigo_salida=-1;
type
  t_rubros=rubro_min..rubro_max;
  t_registro_producto=record
    codigo: int16;
    rubro: t_rubros;
    stock: int16;
    precio: real;
  end;
  t_abb=^t_nodo_abb;
  t_nodo_abb=record
    ele: t_registro_producto;
    hi: t_abb;
    hd: t_abb;
  end;
  t_vector_rubros=array[t_rubros] of t_abb;
  t_registro_c=record
    codigo: int16;
    stock: int16;
  end;
  t_vector_c=array[t_rubros] of t_registro_c;
  t_vector_d=array[t_rubros] of int32;
procedure inicializar_vector_rubros(var vector_rubros: t_vector_rubros);
var
  i: t_rubros;
begin
  for i:= rubro_min to rubro_max do
    vector_rubros[i]:=nil;
end;
procedure inicializar_vector_c(var vector_c: t_vector_c);
var
  i: t_rubros;
begin
  for i:= rubro_min to rubro_max do
  begin
    vector_c[i].codigo:=0;
    vector_c[i].stock:=0;
  end;
end;
procedure inicializar_vector_d(var vector_d: t_vector_d);
var
  i: t_rubros;
begin
  for i:= rubro_min to rubro_max do
    vector_d[i]:=0;
end;
procedure leer_registro_producto(var registro_producto: t_registro_producto);
begin
  textcolor(green); write('Introducir código del producto: '); textcolor(yellow); readln(registro_producto.codigo);
  if (registro_producto.codigo<>codigo_salida) then
  begin
    textcolor(green); write('Introducir rubro del producto: '); textcolor(yellow); readln(registro_producto.rubro);
    textcolor(green); write('Introducir stock del producto: '); textcolor(yellow); readln(registro_producto.stock);
    textcolor(green); write('Introducir precio del producto: '); textcolor(yellow); readln(registro_producto.precio);
  end;
end;
procedure agregar_abb(var abb: t_abb; registro_producto: t_registro_producto);
begin
  if (abb=nil) then
  begin
    new(abb);
    abb^.ele:=registro_producto;
    abb^.hi:=nil;
    abb^.hd:=nil;
  end
  else
    if (registro_producto.codigo<=abb^.ele.codigo) then
      agregar_abb(abb^.hi,registro_producto)
    else
      agregar_abb(abb^.hd,registro_producto);
end;
procedure cargar_vector_rubros(var vector_rubros: t_vector_rubros);
var
  registro_producto: t_registro_producto;
begin
  leer_registro_producto(registro_producto);
  while (registro_producto.codigo<>codigo_salida) do
  begin
    agregar_abb(vector_rubros[registro_producto.rubro],registro_producto);
    leer_registro_producto(registro_producto);
  end;
end;
function buscar_abb(abb: t_abb; codigo: int16): boolean;
begin
  if (abb=nil) then
    buscar_abb:=false
  else
    if (abb^.ele.codigo=codigo) then
      buscar_abb:=true
    else
      if (codigo<=abb^.ele.codigo) then
        buscar_abb:=buscar_abb(abb^.hi,codigo)
      else
        buscar_abb:=buscar_abb(abb^.hd,codigo);
end;
function inciso_b(vector_rubros: t_vector_rubros; rubro: t_rubros; codigo: int16): boolean;
begin
  inciso_b:=buscar_abb(vector_rubros[rubro],codigo);
end;
function buscar_maximo_abb(abb: t_abb): t_abb;
begin
  if (abb^.hd=nil) then
    buscar_maximo_abb:=abb
  else
    buscar_maximo_abb:=buscar_maximo_abb(abb^.hd);
end;
procedure inciso_c(var vector_c: t_vector_c; vector_rubros: t_vector_rubros);
var
  abb_max: t_abb;
  i: t_rubros;
begin
  abb_max:=nil;
  for i:= rubro_min to rubro_max do
  begin
    if (vector_rubros[i]<>nil) then
    begin
      abb_max:=buscar_maximo_abb(vector_rubros[i]);
      vector_c[i].codigo:=abb_max^.ele.codigo;
      vector_c[i].stock:=abb_max^.ele.stock;
    end;
  end;
end;
function contar_abb(abb: t_abb; codigo1, codigo2: int16): int32;
var
  cantidad: int32;
begin
  cantidad:=0;
  if (abb<>nil) then
  begin
    if ((abb^.ele.codigo>=codigo1) and (abb^.ele.codigo<=codigo2)) then
      cantidad:=contar_abb(abb^.hi,codigo1,codigo2)+contar_abb(abb^.hd,codigo1,codigo2)+1
    else
      if (codigo2<=abb^.ele.codigo) then
        cantidad:=cantidad+contar_abb(abb^.hi,codigo1,codigo2)
      else
        cantidad:=cantidad+contar_abb(abb^.hd,codigo1,codigo2);
  end;
  contar_abb:=cantidad;
end;
procedure inciso_d(var vector_d: t_vector_d; vector_rubros: t_vector_rubros; codigo1, codigo2: int16);
var
  i: t_rubros;
begin
  for i:= rubro_min to rubro_max do
    if (vector_rubros[i]<>nil) then
      vector_d[i]:=contar_abb(vector_rubros[i],codigo1,codigo2);
end;
var
  vector_rubros: t_vector_rubros;
  vector_c: t_vector_c;
  vector_d: t_vector_d;
  rubro: t_rubros;
  codigo, codigo1, codigo2: int16;
  existe: boolean;
begin
  inicializar_vector_rubros(vector_rubros); inicializar_vector_c(vector_c); inicializar_vector_d(vector_d); existe:=false;
  cargar_vector_rubros(vector_rubros);
  textcolor(green); write('Introducir rubro que se desea buscar en el vector de árboles: '); textcolor(yellow); readln(rubro);
  textcolor(green); write('Introducir código que se desea buscar en el vector de árboles: '); textcolor(yellow); readln(codigo);
  if (vector_rubros[rubro]<>nil) then
    existe:=inciso_b(vector_rubros,rubro,codigo);
  if (existe=true) then
  begin
    textcolor(green); write('El código '); textcolor(red); write(codigo); textcolor(green); write(', para el rubro '); textcolor(red); write(rubro); textcolor(green); write(', '); textcolor(red); writeln('EXISTE');
  end
  else
  begin
    textcolor(green); write('El código '); textcolor(red); write(codigo); textcolor(green); write(', para el rubro '); textcolor(red); write(rubro); textcolor(green); write(', '); textcolor(red); writeln('NO EXISTE');
  end;
  inciso_c(vector_c,vector_rubros);
  textcolor(green); writeln('Para buscar la cantidad de productos con códigos entre los siguientes valores ingresados: ');
  textcolor(green); write('Introducir código 1: '); textcolor(yellow); readln(codigo1);
  textcolor(green); write('Introducir código 2: '); textcolor(yellow); read(codigo2);
  inciso_d(vector_d,vector_rubros,codigo1,codigo2);
end.