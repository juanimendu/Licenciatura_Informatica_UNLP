{TRABAJO PRÁCTICO N° 0}
{EJERCICIO 1a}
{Implementar un programa que procese la información de los alumnos de la Facultad de Informática.
(a) Implementar un módulo que lea y retorne, en una estructura adecuada, la información de todos los alumnos.
De cada alumno, se lee su apellido, número de alumno, año de ingreso, cantidad de materias aprobadas (a lo sumo, 36) y nota obtenida (sin contar los aplazos) en cada una de las materias aprobadas.
La lectura finaliza cuando se ingresa el número de alumno 11111, el cual debe procesarse.}

program TP0_E1a;
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
  t_lista_alumnos1=^t_nodo_alumnos1;
  t_nodo_alumnos1=record
    ele: t_registro_alumno1;
    sig: t_lista_alumnos1;
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
procedure cargar_lista_alumnos1(var lista_alumnos1: t_lista_alumnos1);
var
  registro_alumno1: t_registro_alumno1;
begin
  repeat
    cargar_registro_alumno1(registro_alumno1);
    agregar_adelante_lista_alumnos1(lista_alumnos1,registro_alumno1);
  until (registro_alumno1.numero=numero_salida);
end;
var
  lista_alumnos1: t_lista_alumnos1;
begin
  lista_alumnos1:=nil;
  cargar_lista_alumnos1(lista_alumnos1);
end.