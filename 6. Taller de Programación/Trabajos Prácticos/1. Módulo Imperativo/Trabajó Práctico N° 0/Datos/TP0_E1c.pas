{TRABAJO PRÁCTICO N° 0}
{EJERCICIO 1c}
{Implementar un programa que procese la información de los alumnos de la Facultad de Informática.
(c) Analizar: ¿qué cambios requieren los incisos (a) y (b), si no se sabe de antemano la cantidad de materias aprobadas de cada alumno y si, además, se desean registrar los aplazos?
¿cómo puede diseñarse una solución modularizada que requiera la menor cantidad de cambios?}

program TP0_E1c;
{$codepage UTF8}
uses crt;
const
  nota_min=1; nota_max=10; nota_aprobado=4; numero_salida=11111; examenes_salida=0; nota_salida=0;
type
  t_notas=nota_min..nota_max;
  t_lista_notas=^t_nodo_notas;
  t_nodo_notas=record
    ele: t_notas;
    sig: t_lista_notas;
  end;
  t_registro_alumno1=record
    apellido: string;
    numero: int32;
    anio_ingreso: int16;
    notas: t_lista_notas;
    examenes_rendidos: int16;
    materias_aprobadas: int8;
  end;
  t_registro_alumno2=record
    numero: int32;
    promedio_con_aplazos: real;
    promedio_sin_aplazos: real;
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
procedure agregar_adelante_lista_notas(var lista_notas: t_lista_notas; nota: t_notas);
var
  nuevo: t_lista_notas;
begin
  new(nuevo);
  nuevo^.ele:=nota;
  nuevo^.sig:=lista_notas;
  lista_notas:=nuevo;
end;
procedure cargar_registro_alumno1(var registro_alumno1: t_registro_alumno1);
var
  nota: int8;
  materias_aprobadas: int8;
  examenes_rendidos: int16;
begin
  registro_alumno1.notas:=nil; examenes_rendidos:=0; materias_aprobadas:=0;
  textcolor(green); write('Introducir apellido del alumno: ');
  textcolor(yellow); readln(registro_alumno1.apellido);
  textcolor(green); write('Introducir número del alumno: ');
  textcolor(yellow); readln(registro_alumno1.numero);
  textcolor(green); write('Introducir año de ingreso del alumno: ');
  textcolor(yellow); readln(registro_alumno1.anio_ingreso);
  textcolor(green); write('Introducir nota obtenida en el examen ', examenes_rendidos+1, ' (nota de salida igual a 0): ');
  textcolor(yellow); readln(nota);
  while (nota<>nota_salida) do
  begin
    agregar_adelante_lista_notas(registro_alumno1.notas,nota);
    examenes_rendidos:=examenes_rendidos+1;
    if (nota>=nota_aprobado) then
      materias_aprobadas:=materias_aprobadas+1;
    textcolor(green); write('Introducir nota obtenida en el examen ', examenes_rendidos+1, ' (nota de salida igual a 0): ');
    textcolor(yellow); readln(nota);
  end;
  registro_alumno1.examenes_rendidos:=examenes_rendidos;
  registro_alumno1.materias_aprobadas:=materias_aprobadas;
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
  suma_con_aplazos, suma_sin_aplazos: int16;
begin
  suma_con_aplazos:=0; suma_sin_aplazos:=0;
  registro_alumno2.numero:=registro_alumno1.numero;
  if (registro_alumno1.examenes_rendidos<>examenes_salida) then
  begin
    while (registro_alumno1.notas<>nil) do
    begin
      suma_con_aplazos:=suma_con_aplazos+registro_alumno1.notas^.ele;
      if (registro_alumno1.notas^.ele>=nota_aprobado) then
        suma_sin_aplazos:=suma_sin_aplazos+registro_alumno1.notas^.ele;
      registro_alumno1.notas:=registro_alumno1.notas^.sig;
    end;
    registro_alumno2.promedio_con_aplazos:=suma_con_aplazos/registro_alumno1.examenes_rendidos;
    registro_alumno2.promedio_sin_aplazos:=suma_sin_aplazos/registro_alumno1.materias_aprobadas;
  end
  else
  begin
    registro_alumno2.promedio_con_aplazos:=suma_con_aplazos;
    registro_alumno2.promedio_sin_aplazos:=suma_sin_aplazos;
  end;
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
    textcolor(green); write('El promedio CON aplazos del alumno '); textcolor(red); write(lista_alumnos2^.ele.numero); textcolor(green); write(' es '); textcolor(red); writeln(lista_alumnos2^.ele.promedio_con_aplazos:0:2);
    textcolor(green); write('El promedio SIN aplazos del alumno '); textcolor(red); write(lista_alumnos2^.ele.numero); textcolor(green); write(' es '); textcolor(red); writeln(lista_alumnos2^.ele.promedio_sin_aplazos:0:2);
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