{TRABAJO PRÁCTICO N° 5}
{EJERCICIO 2}
{Una agencia dedicada a la venta de autos ha organizado su stock y dispone, en papel, de la información de los autos en venta.
Implementar un programa que:
(a) Lea la información de los autos (patente, año de fabricación (2010 .. 2018), marca y modelo) y los almacene en dos estructuras de datos:
(i) Una estructura eficiente para la búsqueda por patente.
(ii) Una estructura eficiente para la búsqueda por marca. Para cada marca, se deben almacenar todos juntos los autos pertenecientes a ella.
(b) Invoque a un módulo que reciba la estructura generado en (a) (i) y una marca y retorne la cantidad de autos de dicha marca que posee la agencia.
(c) Invoque a un módulo que reciba la estructura generado en (a) (ii) y una marca y retorne la cantidad de autos de dicha marca que posee la agencia.
(d) Invoque a un módulo que reciba el árbol generado en (a) (i) y retorne una estructura con la información de los autos agrupados por año de fabricación.
(e) Invoque a un módulo que reciba el árbol generado en (a) (i) y una patente y devuelva el modelo del auto con dicha patente.
(f) Invoque a un módulo que reciba el árbol generado en (a) (ii) y una patente y devuelva el modelo del auto con dicha patente.}

program TP5_E2;
{$codepage UTF8}
uses crt;
const
  anio_min=2010; anio_max=2018; patente_salida='-1';
type
  t_anios=anio_min..anio_max;
  t_registro_auto=record
    patente: string;
    anio: t_anios;
    marca: string;
    modelo: string;
  end;
  t_abb_i=^t_nodo_abb_i;
  t_nodo_abb_i=record
    ele: t_registro_auto;
    hi: t_abb_i;
    hd: t_abb_i;
  end;
  t_lista_autos=^t_nodo_marca;
  t_nodo_marca=record
    ele: t_registro_auto;
    sig: t_lista_autos;
  end;
  t_abb_ii=^t_nodo_abb_ii;
  t_nodo_abb_ii=record
    ele: t_lista_autos;
    hi: t_abb_ii;
    hd: t_abb_ii;
  end;
  t_vector_autos=array[t_anios] of t_lista_autos;
procedure inicializar_vector_autos(var vector_autos: t_vector_autos);
var
  i: t_anios;
begin
  for i:= anio_min to anio_max do
    vector_autos[i]:=nil;
end;
procedure leer_registro_auto(var registro_auto: t_registro_auto);
begin
  textcolor(green); write('Introducir patente del auto en venta: '); textcolor(yellow); readln(registro_auto.patente);
  if (registro_auto.patente<>patente_salida) then
  begin
    textcolor(green); write('Introducir año de fabricación del auto en venta: '); textcolor(yellow); readln(registro_auto.anio);
    textcolor(green); write('Introducir marca del auto en venta: '); textcolor(yellow); readln(registro_auto.marca);
    textcolor(green); write('Introducir modelo del auto en venta: '); textcolor(yellow); readln(registro_auto.modelo);
  end;
end;
procedure agregar_abb_i(var abb_i: t_abb_i; registro_auto: t_registro_auto);
begin
  if (abb_i=nil) then
  begin
    new(abb_i);
    abb_i^.ele:=registro_auto;
    abb_i^.hi:=nil;
    abb_i^.hd:=nil;
  end
  else
    if (registro_auto.patente<=abb_i^.ele.patente) then
      agregar_abb_i(abb_i^.hi,registro_auto)
    else
      agregar_abb_i(abb_i^.hd,registro_auto);
end;
procedure agregar_adelante_lista_autos(var lista_autos: t_lista_autos; registro_auto: t_registro_auto);
var
  nuevo: t_lista_autos;
begin
  new(nuevo);
  nuevo^.ele:=registro_auto;
  nuevo^.sig:=lista_autos;
  lista_autos:=nuevo;
end;
procedure agregar_abb_ii(var abb_ii: t_abb_ii; registro_auto: t_registro_auto);
begin
  if (abb_ii=nil) then
  begin
    new(abb_ii);
    abb_ii^.ele:=nil;
    agregar_adelante_lista_autos(abb_ii^.ele,registro_auto);
    abb_ii^.hi:=nil;
    abb_ii^.hd:=nil;
  end
  else
    if (registro_auto.marca=abb_ii^.ele^.ele.marca) then
      agregar_adelante_lista_autos(abb_ii^.ele,registro_auto)
    else
      if (registro_auto.marca<abb_ii^.ele^.ele.marca) then
        agregar_abb_ii(abb_ii^.hi,registro_auto)
      else
        agregar_abb_ii(abb_ii^.hd,registro_auto);
end;
procedure cargar_abbs(var abb_i: t_abb_i; var abb_ii: t_abb_ii);
var
  registro_auto: t_registro_auto;
begin
  leer_registro_auto(registro_auto);
  while (registro_auto.patente<>patente_salida) do
  begin
    agregar_abb_i(abb_i,registro_auto);
    agregar_abb_ii(abb_ii,registro_auto);
    leer_registro_auto(registro_auto);
  end;
end;
function inciso_b(abb_i: t_abb_i; marca: string): int16;
var
  cantidad: int16;
begin
  cantidad:=0;
  if (abb_i<>nil) then
  begin
    if (abb_i^.ele.marca=marca) then
      cantidad:=inciso_b(abb_i^.hi,marca)+inciso_b(abb_i^.hd,marca)+1
    else
      cantidad:=inciso_b(abb_i^.hi,marca)+inciso_b(abb_i^.hd,marca);
  end;
  inciso_b:=cantidad;
end;
function recorrer_lista_autos_1(lista_autos: t_lista_autos): int16;
var
  cantidad: int16;
begin
  cantidad:=0;
  while (lista_autos<>nil) do
  begin
    cantidad:=cantidad+1;
    lista_autos:=lista_autos^.sig;
  end;
  recorrer_lista_autos_1:=cantidad;
end;
function inciso_c(abb_ii: t_abb_ii; marca: string): int16;
var
  cantidad: int16;
begin
  cantidad:=0;
  if (abb_ii<>nil) then
  begin
    if (abb_ii^.ele^.ele.marca=marca) then
      cantidad:=recorrer_lista_autos_1(abb_ii^.ele)
    else
      if (marca<=abb_ii^.ele^.ele.marca) then
        cantidad:=inciso_c(abb_ii^.hi,marca)
      else
        cantidad:=inciso_c(abb_ii^.hd,marca);
  end;
  inciso_c:=cantidad;
end;
procedure inciso_d(var vector_autos: t_vector_autos; abb_i: t_abb_i);
begin
  if (abb_i<>nil) then
  begin
    inciso_d(vector_autos,abb_i^.hi);
    agregar_adelante_lista_autos(vector_autos[abb_i^.ele.anio],abb_i^.ele);
    inciso_d(vector_autos,abb_i^.hd);
  end;
end;
function inciso_e(abb_i: t_abb_i; patente: string): string;
var
  modelo: string;
begin
  modelo:='No se encontró la patente';
  if (abb_i<>nil) then
  begin
    if (abb_i^.ele.patente=patente) then
      modelo:=abb_i^.ele.modelo
    else
      if (patente<=abb_i^.ele.patente) then
        modelo:=inciso_e(abb_i^.hi,patente)
      else
        modelo:=inciso_e(abb_i^.hd,patente);
  end;
  inciso_e:=modelo;
end;
function recorrer_lista_autos_2(lista_autos: t_lista_autos; patente: string): t_lista_autos;
begin
  while ((lista_autos<>nil) and (lista_autos^.ele.patente<>patente)) do
    lista_autos:=lista_autos^.sig;
  recorrer_lista_autos_2:=lista_autos;
end;
function inciso_f(abb_ii: t_abb_ii; patente: string): string;
var
  lista_autos: t_lista_autos;
  modelo: string;
begin
  lista_autos:=nil; modelo:='No se encontró la patente';
  if (abb_ii<>nil) then
  begin
    lista_autos:=recorrer_lista_autos_2(abb_ii^.ele,patente);
    if (lista_autos<>nil) then
      modelo:=abb_ii^.ele^.ele.modelo
    else
    begin
      modelo:=inciso_f(abb_ii^.hi,patente);
      if (modelo='No se encontró la patente') then
        modelo:=inciso_f(abb_ii^.hd,patente);
    end;
  end;
  inciso_f:=modelo;
end;
var
  vector_autos: t_vector_autos;
  abb_i: t_abb_i;
  abb_ii: t_abb_ii;
  autos_b, autos_c: int16;
  marca, patente, modelo_e, modelo_f: string;
begin
  abb_i:=nil; abb_ii:=nil; inicializar_vector_autos(vector_autos);
  cargar_abbs(abb_i,abb_ii);
  textcolor(green); write('Introducir marca del auto en venta que se desea buscar en los árboles: '); textcolor(yellow); readln(marca);
  autos_b:=inciso_b(abb_i,marca);
  textcolor(green); write('La cantidad de autos de la marca '); textcolor(red); write(marca); textcolor(green); write(' en el árbol abb_i es '); textcolor(red); writeln(autos_b);
  autos_c:=inciso_c(abb_ii,marca);
  textcolor(green); write('La cantidad de autos de la marca '); textcolor(red); write(marca); textcolor(green); write(' en el árbol abb_ii es '); textcolor(red); writeln(autos_c);
  inciso_d(vector_autos,abb_i);
  textcolor(green); write('Introducir patente del auto en venta que se desea buscar en los árboles: '); textcolor(yellow); readln(patente);
  modelo_e:=inciso_e(abb_i,patente);
  textcolor(green); write('El modelo del auto de la patente '); textcolor(red); write(patente); textcolor(green); write(' en el árbol abb_i es '); textcolor(red); writeln(modelo_e);
  modelo_f:=inciso_f(abb_ii,patente);
  textcolor(green); write('El modelo del auto de la patente '); textcolor(red); write(patente); textcolor(green); write(' en el árbol abb_ii es '); textcolor(red); write(modelo_f);
end.