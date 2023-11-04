{TRABAJO PRÁCTICO N° 0}
{EJERCICIO 1b}
{Implementar un programa que procese la información de los alumnos de la Facultad de Informática.
(b) Implementar un módulo que reciba la estructura generada en el inciso (a) y retorne número de alumno y promedio de cada alumno.}

program TP0_E1b;
{$codepage UTF8}
uses crt;
const
  materias_min=1; materias_max=36; nota_min=4; nota_max=10; numero_salida=11111; materias_salida=0;
type
  t_materias_totales=materias_min..materias_max;
  t_notas=nota_min..nota_max;
  t_vector_notas=array[t_materias_totales] of t_notas;
  t_registro_alumno1=record
    apellido: string;
    numero: int32;
    anio_ingreso: int16;
    materias_aprobadas: int8;
    notas: t_vector_notas;
  end;
  t_registro_alumno2=record
    numero: int32;
    promedio: real;
  end;
  t_lista_alumnos1=^t_nodo_alumnos1;
  t_nodo_alumnos1=record
    ele: t_registro_alumno1;
    sig: t_lista_alumnos1;
  end;
  t_lista_alumnos2=^t_nodo_alumnos2;
  t_nodo_alumnos2=record
    ele: t_registro_alumno2;
    sig: t_lista_alumnos2;
  end;
procedure cargar_registro_alumno1(var registro_alumno1: t_registro_alumno1);
var
  i: int8;
begin
  textcolor(green); write('Introducir apellido del alumno: ');
  textcolor(yellow); readln(registro_alumno1.apellido);
  textcolor(green); write('Introducir número del alumno: ');
  textcolor(yellow); readln(registro_alumno1.numero);
  textcolor(green); write('Introducir año de ingreso del alumno: ');
  textcolor(yellow); readln(registro_alumno1.anio_ingreso);
  textcolor(green); write('Introducir materias aprobadas del alumno: ');
  textcolor(yellow); readln(registro_alumno1.materias_aprobadas);
  if (registro_alumno1.materias_aprobadas<>materias_salida) then
  begin
    for i:= 1 to registro_alumno1.materias_aprobadas do
    begin
      textcolor(green); write('Introducir nota obtenida en la materia ', i, ': ');
      textcolor(yellow); readln(registro_alumno1.notas[i]);
    end;
  end;
end;
procedure agregar_adelante_lista_alumnos1(var lista_alumnos1: t_lista_alumnos1; registro_alumno1: t_registro_alumno1);
var
  nuevo: t_lista_alumnos1;
begin
  new(nuevo);
  nuevo^.ele:=registro_alumno1;
  nuevo^.sig:=lista_alumnos1;
  lista_alumnos1:=nuevo;
end;
procedure cargar_registro_alumno2(var registro_alumno2: t_registro_alumno2; registro_alumno1: t_registro_alumno1);
var
  i: int8;
  suma: int16;
begin
  suma:=0;
  registro_alumno2.numero:=registro_alumno1.numero;
  if (registro_alumno1.materias_aprobadas<>materias_salida) then
  begin
    for i:= 1 to registro_alumno1.materias_aprobadas do
      suma:=suma+registro_alumno1.notas[i];
  registro_alumno2.promedio:=suma/registro_alumno1.materias_aprobadas;
  end
  else
    registro_alumno2.promedio:=suma;
end;
procedure agregar_adelante_lista_alumnos2(var lista_alumnos2: t_lista_alumnos2; registro_alumno2: t_registro_alumno2);
var
  nuevo: t_lista_alumnos2;
begin
  new(nuevo);
  nuevo^.ele:=registro_alumno2;
  nuevo^.sig:=lista_alumnos2;
  lista_alumnos2:=nuevo;
end;
procedure cargar_lista_alumnos1(var lista_alumnos1: t_lista_alumnos1);
var
  registro_alumno1: t_registro_alumno1;
begin
  repeat
    cargar_registro_alumno1(registro_alumno1);
    agregar_adelante_lista_alumnos1(lista_alumnos1,registro_alumno1);
  until (registro_alumno1.numero=numero_salida);
end;
procedure cargar_lista_alumnos2(var lista_alumnos2: t_lista_alumnos2; lista_alumnos1: t_lista_alumnos1);
var
  registro_alumno2: t_registro_alumno2;
begin
  while (lista_alumnos1<>nil) do
  begin
    cargar_registro_alumno2(registro_alumno2,lista_alumnos1^.ele);
    agregar_adelante_lista_alumnos2(lista_alumnos2,registro_alumno2);
    lista_alumnos1:=lista_alumnos1^.sig;
    textcolor(green); write('El promedio del alumno '); textcolor(red); write(lista_alumnos2^.ele.numero); textcolor(green); write(' es '); textcolor(red); writeln(lista_alumnos2^.ele.promedio:0:2);
  end;
end;
var
  lista_alumnos1: t_lista_alumnos1;
  lista_alumnos2: t_lista_alumnos2;
begin
  lista_alumnos1:=nil; lista_alumnos2:=nil;
  cargar_lista_alumnos1(lista_alumnos1);
  cargar_lista_alumnos2(lista_alumnos2,lista_alumnos1);
end.