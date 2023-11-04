{TRABAJO PRÁCTICO N° 3}
{EJERCICIO 3}
{El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As.,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año 2015 (1 docente cada 23.435 alumnos).
Para ello, se cuenta con información de: CUE (código único de establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad.
Se pide implementar un programa que procese la información y determine:
•	Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
•	CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
•	Un módulo para la lectura de la información de la escuela.
•	Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad de alumnos y la cantidad de docentes).}

program TP3_E3;
{$codepage UTF8}
uses crt;
const
  escuelas_total=2400; ratio_unesco=23.435;
type
  registro_escuela=record
    cue: int16;
    nombre: string;
    docentes: int16;
    alumnos: int16;
    localidad: string;
  end;
procedure leer_escuela(var escuela: registro_escuela);
begin
  textcolor(green); write('Introducir CUE (Código Único de Establecimiento) de la escuela: '); textcolor(yellow); readln(escuela.cue);
  textcolor(green); write('Introducir nombre de la escuela: '); textcolor(yellow); readln(escuela.nombre);
  textcolor(green); write('Introducir cantidad de docentes de la escuela: '); textcolor(yellow); readln(escuela.docentes);
  textcolor(green); write('Introducir cantidad de alumnos de la escuela: '); textcolor(yellow); readln(escuela.alumnos);
  textcolor(green); write('Introducir localidad de la escuela: '); textcolor(yellow); readln(escuela.localidad);
end;
function ratio_alumnos_docente(escuela: registro_escuela): real;
begin
    ratio_alumnos_docente:=escuela.alumnos/escuela.docentes;
end;
procedure actualizar_minimos(ratio: real; escuela: registro_escuela; var ratio_min1, ratio_min2: real; var cue_min1, cue_min2: int16; var nombre_min1, nombre_min2: string);
begin
  if (ratio<ratio_min1) then
  begin
    ratio_min2:=ratio_min1;
    cue_min2:=cue_min1;
    nombre_min2:=nombre_min1;
    nombre_min1:=escuela.nombre;
    cue_min1:=escuela.cue;
  end
  else
    if (ratio<ratio_min2) then
    begin
      ratio_min2:=ratio;
      cue_min2:=escuela.cue;
      nombre_min2:=escuela.nombre;
  end;
end;
procedure leer_escuelas(var escuelas_lp, cue_min1, cue_min2: int16; var nombre_min1, nombre_min2: string);
var
  escuela: registro_escuela;
  i: int16;
  ratio, ratio_min1, ratio_min2: real;
begin
  ratio:=0; ratio_min1:=999999; ratio_min2:=999999;
  for i:= 1 to escuelas_total do
  begin
    leer_escuela(escuela);
    ratio:=ratio_alumnos_docente(escuela);
    actualizar_minimos(ratio,escuela,ratio_min1,ratio_min2,cue_min1,cue_min2,nombre_min1,nombre_min2);
    if ((escuela.localidad='La Plata') and (ratio>ratio_unesco)) then
      escuelas_lp:=escuelas_lp+1;
  end;
end;
var
  escuelas_lp, cue_min1, cue_min2: int16;
  nombre_min1, nombre_min2: string;
begin
  escuelas_lp:=0; cue_min1:=0; cue_min2:=0;
  leer_escuelas(escuelas_lp,cue_min1,cue_min2,nombre_min1,nombre_min2);
  textcolor(green); write('La cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO es '); textcolor(red); writeln(escuelas_lp);
  textcolor(green); write('Los CUEs de las dos escuelas con mejor relación entre docentes y alumnos son '); textcolor(red); write(cue_min1); textcolor(green); write(' y '); textcolor(red); writeln(cue_min2);
  textcolor(green); write('Los nombres de las dos escuelas con mejor relación entre docentes y alumnos son '); textcolor(red); write(nombre_min1); textcolor(green); write(' y '); textcolor(red); writeln(nombre_min2);
end.