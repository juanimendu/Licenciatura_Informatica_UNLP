{TRABAJO PRÁCTICO N° 5}
{EJERCICIO 4}
{Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo, se lee código, DNI de la persona, año y tipo de reclamo.
La lectura finaliza con el código de igual a -1.
Se pide:
(a) Un módulo que retorne estructura adecuada para la búsqueda por DNI.
Para cada DNI, se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
(b) Un módulo que reciba la estructura generada en (a) y un DNI y retorne la cantidad de reclamos efectuados por ese DNI.
(c) Un módulo que reciba la estructura generada en (a) y dos DNI y retorne la cantidad de reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
(d) Un módulo que reciba la estructura generada en (a) y un año y retorne los códigos de los reclamos realizados en el año recibido.}

program TP5_E4;
{$codepage UTF8}
uses crt;
const
  codigo_salida=-1;
type
  t_registro_reclamo=record
    codigo: int16;
    dni: int32;
    anio: int16;
    tipo: string;
  end;
  t_lista_reclamos=^t_nodo_reclamos;
  t_nodo_reclamos=record
    ele: t_registro_reclamo;
    sig: t_lista_reclamos;
  end;
  t_registro_dni=record
    dni: int32;
    reclamos: t_lista_reclamos;
    cantidad: int16;
  end;
  t_abb=^t_nodo_abb;
  t_nodo_abb=record
    ele: t_registro_dni;
    hi: t_abb;
    hd: t_abb;
  end;
  t_lista_codigos=^t_nodo_codigos;
  t_nodo_codigos=record
    ele: int16;
    sig: t_lista_codigos;
  end;
procedure leer_registro_reclamo(var registro_reclamo: t_registro_reclamo);
begin
  textcolor(green); write('Introducir código del reclamo: '); textcolor(yellow); readln(registro_reclamo.codigo);
  if (registro_reclamo.codigo<>codigo_salida) then
  begin
    textcolor(green); write('Introducir DNI de la persona del reclamo: '); textcolor(yellow); readln(registro_reclamo.dni);
    textcolor(green); write('Introducir año del reclamo: '); textcolor(yellow); readln(registro_reclamo.anio);
    textcolor(green); write('Introducir tipo del reclamo: '); textcolor(yellow); readln(registro_reclamo.tipo);
  end;
end;
procedure agregar_adelante_lista_reclamos(var lista_reclamos: t_lista_reclamos; registro_reclamo: t_registro_reclamo);
var
  nuevo: t_lista_reclamos;
begin
  new(nuevo);
  nuevo^.ele:=registro_reclamo;
  nuevo^.sig:=lista_reclamos;
  lista_reclamos:=nuevo;
end;
procedure agregar_abb(var abb: t_abb; registro_reclamo: t_registro_reclamo);
var
  registro_dni: t_registro_dni;
begin
  if (abb=nil) then
  begin
    registro_dni.dni:=registro_reclamo.dni;
    registro_dni.reclamos:=nil;
    agregar_adelante_lista_reclamos(registro_dni.reclamos,registro_reclamo);
    registro_dni.cantidad:=1;
    new(abb);
    abb^.ele:=registro_dni;
    abb^.hi:=nil;
    abb^.hd:=nil;
  end
  else
    if (registro_reclamo.dni=abb^.ele.dni) then
    begin
      agregar_adelante_lista_reclamos(abb^.ele.reclamos,registro_reclamo);
      abb^.ele.cantidad:=abb^.ele.cantidad+1;
    end
    else
      if (registro_reclamo.dni<abb^.ele.dni) then
        agregar_abb(abb^.hi,registro_reclamo)
      else
        agregar_abb(abb^.hd,registro_reclamo);
end;
procedure cargar_abb(var abb: t_abb);
var
  registro_reclamo: t_registro_reclamo;
begin
  leer_registro_reclamo(registro_reclamo);
  while (registro_reclamo.codigo<>codigo_salida) do
  begin
    agregar_abb(abb,registro_reclamo);
    leer_registro_reclamo(registro_reclamo);
  end;
end;
function inciso_b(abb: t_abb; dni: int32): int32;
begin
  if (abb=nil) then
    inciso_b:=0
  else
    if (abb^.ele.dni=dni) then
      inciso_b:=abb^.ele.cantidad
    else
      if (dni<=abb^.ele.dni) then
        inciso_b:=inciso_b(abb^.hi,dni)
      else
        inciso_b:=inciso_b(abb^.hd,dni);
end;
function inciso_c(abb: t_abb; dni1, dni2: int32): int32;
var
  cantidad: int32;
begin
  cantidad:=0;
  if (abb<>nil) then
  begin
    if ((abb^.ele.dni>=dni1) and (abb^.ele.dni<=dni2)) then
      cantidad:=inciso_c(abb^.hi,dni1,dni2)+inciso_c(abb^.hd,dni1,dni2)+1
    else
      if (dni2<=abb^.ele.dni) then
        cantidad:=cantidad+inciso_c(abb^.hi,dni1,dni2)
      else
        cantidad:=cantidad+inciso_c(abb^.hd,dni1,dni2);
  end;
  inciso_c:=cantidad;
end;
procedure agregar_adelante_lista_codigos(var lista_codigos: t_lista_codigos; codigo: int16);
var
  nuevo: t_lista_codigos;
begin
  new(nuevo);
  nuevo^.ele:=codigo;
  nuevo^.sig:=lista_codigos;
  lista_codigos:=nuevo;
end;
procedure recorrer_lista_reclamos(var lista_codigos: t_lista_codigos; lista_reclamos: t_lista_reclamos; anio: int16);
begin
  while (lista_reclamos<>nil) do
  begin
    if (lista_reclamos^.ele.anio=anio) then
      agregar_adelante_lista_codigos(lista_codigos,lista_reclamos^.ele.codigo);
    lista_reclamos:=lista_reclamos^.sig;
  end;
end;
procedure inciso_d(var lista_codigos: t_lista_codigos; abb: t_abb; anio: int16);
begin
  if (abb<>nil) then
  begin
    inciso_d(lista_codigos,abb^.hi,anio);
    recorrer_lista_reclamos(lista_codigos,abb^.ele.reclamos,anio);
    inciso_d(lista_codigos,abb^.hd,anio);
  end;
end;
var
  lista_codigos: t_lista_codigos;
  abb: t_abb;
  anio: int16;
  dni, dni1, dni2, reclamos_b, reclamos_c: int32;
begin
  abb:=nil; lista_codigos:=nil; reclamos_b:=0; reclamos_c:=0;
  cargar_abb(abb);
  textcolor(green); write('Introducir DNI para el cual se desea buscar la cantidad de reclamos: '); textcolor(yellow); readln(dni);
  reclamos_b:=inciso_b(abb,dni);
  textcolor(green); write('La cantidad de reclamos del DNI '); textcolor(red); write(dni); textcolor(green); write(' en el árbol abb es '); textcolor(red); writeln(reclamos_b);
  textcolor(green); writeln('Para buscar la cantidad de reclamos con DNIs entre los siguientes valores ingresados: ');
  textcolor(green); write('Introducir DNI 1: '); textcolor(yellow); readln(dni1);
  textcolor(green); write('Introducir DNI 2: '); textcolor(yellow); readln(dni2);
  reclamos_c:=inciso_c(abb,dni1,dni2);
  textcolor(green); write('La cantidad de reclamos entre los DNI '); textcolor(red); write(dni1); textcolor(green); write(' y '); textcolor(red); write(dni2); textcolor(green); write(' en el árbol abb es '); textcolor(red); writeln(reclamos_c);
  textcolor(green); write('Introducir año para el cual se desea retornar los códigos de los reclamos realizados: '); textcolor(yellow); read(anio);
  inciso_d(lista_codigos,abb,anio);
end.