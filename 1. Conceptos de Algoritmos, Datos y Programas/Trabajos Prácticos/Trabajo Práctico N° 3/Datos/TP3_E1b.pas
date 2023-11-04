{TRABAJO PRÁCTICO N° 3}
{EJERCICIO 1b}
{Dado el siguiente programa:
(b) Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el nombre del alumno con mejor promedio.}

program TP3_E1b;
{$codepage UTF8}
uses crt;
const
  alumno_salida=0;
type
  str20=string[20];
  alumno=record
    codigo: integer;
    nombre: str20;
    promedio: real;
  end;
procedure leer(var alu: alumno);
begin
  textcolor(green); write('Introducir código del alumno: '); textcolor(yellow); readln(alu.codigo);
  if (alu.codigo<>alumno_salida) then
  begin
    textcolor(green); write('Introducir nombre del alumno: '); textcolor(yellow); readln(alu.nombre);
    textcolor(green); write('Introducir promedio del alumno: '); textcolor(yellow); readln(alu.promedio);
  end;
end;
procedure promedios(alu: alumno; var promedio_max: real; var alumno_max: str20);
begin
  if (alu.promedio>promedio_max) then
  begin
    promedio_max:=alu.promedio;
    alumno_max:=alu.nombre;
  end;
end;
var
  a: alumno;
  alumnos_leidos: integer;
  promedio_max: real;
  alumno_max: str20;
begin
  alumnos_leidos:=0;
  leer(a);
  while (a.codigo<>alumno_salida) do
  begin
    alumnos_leidos:=alumnos_leidos+1;
    promedios(a,promedio_max,alumno_max);
    leer(a);
  end;
  textcolor(green); write('La cantidad de alumnos leidos es '); textcolor(red); writeln(alumnos_leidos);
  textcolor(green); write('El nombre del alumno con mejor promedio es '); textcolor(red); write(alumno_max);
end.