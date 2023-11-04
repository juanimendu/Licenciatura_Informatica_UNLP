{TRABAJO PRÁCTICO N° 5}
{EJERCICIO 5}
{Realizar el inciso (a) del ejercicio anterior, pero sabiendo que todos los reclamos de un mismo DNI se leen de forma consecutiva (no significa que vengan ordenados los DNI).}

program TP5_E5;
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
    if (registro_reclamo.dni<abb^.ele.dni) then
      agregar_abb(abb^.hi,registro_reclamo)
    else
      if (registro_reclamo.dni>abb^.ele.dni) then
        agregar_abb(abb^.hd,registro_reclamo);
end;
procedure cargar_abb(var abb: t_abb; var registro_reclamo: t_registro_reclamo);
var
  dni_actual: int32;
begin
  leer_registro_reclamo(registro_reclamo);
  while (registro_reclamo.codigo<>codigo_salida) do
  begin
    dni_actual:=registro_reclamo.dni;
    agregar_abb(abb,registro_reclamo);
    leer_registro_reclamo(registro_reclamo);
    while ((registro_reclamo.codigo<>codigo_salida) and (registro_reclamo.dni=dni_actual)) do
    begin
      agregar_adelante_lista_reclamos(abb^.ele.reclamos,registro_reclamo);
      abb^.ele.cantidad:=abb^.ele.cantidad+1;
      leer_registro_reclamo(registro_reclamo);
    end;
  end;
end;
var
  registro_reclamo: t_registro_reclamo;
  abb: t_abb;
begin
  abb:=nil;
  cargar_abb(abb,registro_reclamo);
end.