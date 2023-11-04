{TRABAJO PRÁCTICO N° 3}
{EJERCICIO 1a}
{Dado el siguiente programa:
(a) Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe la cantidad de alumnos leídos.
La lectura finaliza cuando ingresa un alumno con código 0, que no debe procesarse. Nota: utilizar el módulo leer.}

program TP3_E1a;
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
var
  a: alumno;
  alumnos_leidos: integer;
begin
  alumnos_leidos:=0;
  leer(a);
  while (a.codigo<>alumno_salida) do
  begin
    alumnos_leidos:=alumnos_leidos+1;
    leer(a);
  end;
  textcolor(green); write('La cantidad de alumnos leídos es '); textcolor(red); write(alumnos_leidos);
end.