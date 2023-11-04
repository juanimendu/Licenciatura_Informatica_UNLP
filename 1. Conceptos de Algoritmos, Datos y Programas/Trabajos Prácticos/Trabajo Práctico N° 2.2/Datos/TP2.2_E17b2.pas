{TRABAJO PRÁCTICO N° 2.2}
{EJERCICIO 17b2}
{La cátedra de CADP está analizando los resultados de las autoevaluaciones que realizaron los alumnos durante el cuatrimestre.
Realizar un programa que lea, para cada alumno, su legajo, su condición (I para INGRESANTE, R para RECURSANTE) y la nota obtenida en cada una de las 5 autoevaluaciones.
Si un alumno no realizó alguna autoevaluación en tiempo y forma, se le cargará la nota -1. La lectura finaliza al ingresar el legajo -1.
Una vez ingresados todos los datos, el programa debe informar:
•	Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje sobre el total de alumnos INGRESANTES.
•	Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje sobre el total de alumnos RECURSANTES.
•	Cantidad de alumnos que aprobaron todas las autoevaluaciones.
•	Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos.
•	Cantidad de alumnos que obtuvieron cero puntos en, al menos, una autoevaluación.
•	Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez).
•	Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero).
Nota: Recordar que, para poder rendir el EXAMEN PARCIAL, el alumno deberá obtener “Presente” en, al menos, el 75% del total de las autoevaluaciones propuestas.
Se considera “Presente” la autoevaluación que se entrega en tiempo y forma y con, al menos, el 40% de respuestas correctas.}

program TP2_E17b2;
{$codepage UTF8}
uses crt;
const
  legajo_salida=-1;
var
  i, nota, nota_sum, notas_cero, notas_diez, notas_max1, notas_max2, notas_min1, notas_min2, presente: int8;
  legajo, legajo_max1, legajo_max2, legajo_min1, legajo_min2, ingresantes_parcial, ingresantes_total, recursantes_parcial, recursantes_total, alumnos_autoeva, alumnos_nota, alumnos_cero: int16;
  ingresantes_porc, recursantes_porc, nota_prom: real;
  condicion: char;
begin
  ingresantes_parcial:=0; ingresantes_total:=0;
  recursantes_parcial:=0; recursantes_total:=0;
  alumnos_autoeva:=0; alumnos_nota:=0; alumnos_cero:=0;
  notas_max1:=0; notas_max2:=0; legajo_max1:=0; legajo_max2:=0;
  notas_min1:=0; notas_min2:=0; legajo_min1:=0; legajo_min2:=0;
  {Introducir legajo de alumno}
  textcolor(green); write('Introducir legajo de alumno: ');
  textcolor(yellow); readln(legajo);
  while (legajo<>legajo_salida) do
  begin
    {Introducir condición de alumno (I o R)}
    textcolor(green); write('Introducir condición alumno (I o R): ');
    textcolor(yellow); readln(condicion);
    {Nota obtenida en cada una de las 5 autoevaluaciones}
    presente:=0; nota_sum:=0; notas_cero:=0; notas_diez:=0;
    for i:= 1 to 5 do
    begin
      textcolor(green); write('Introducir nota autoevaluación '); textcolor(red); write(i); textcolor(green); write(': ');
      textcolor(yellow); readln(nota);
      if (nota>=4) then
        presente:=presente+1;
      if (nota=0) then
        notas_cero:=notas_cero+1;
      if (nota=10) then
        notas_diez:=notas_diez+1;
      if (nota=-1) then
        nota:=0;
      nota_sum:=nota_sum+nota;
    end;
    {Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial}
    if (condicion='I') then
    begin
      ingresantes_total:=ingresantes_total+1;
      if (presente>=0.75*5) then
        ingresantes_parcial:=ingresantes_parcial+1;
    end;
    {Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial}
    if (condicion='R') then
    begin
      recursantes_total:=recursantes_total+1;
      if (presente>=0.75*5) then
        recursantes_parcial:=recursantes_parcial+1;
    end;
    {Cantidad de alumnos que aprobaron todas las autoevaluaciones}
    if (presente=5) then
      alumnos_autoeva:=alumnos_autoeva+1;
    {Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos}
    nota_prom:=nota_sum/5;
    if (nota_prom>6.5) then
      alumnos_nota:=alumnos_nota+1;
    {Cantidad de alumnos que obtuvieron cero puntos en, al menos, una autoevaluación}
    if (notas_cero>=1) then
      alumnos_cero:=alumnos_cero+1;
    {Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)}
    if (notas_diez>notas_max1) then
    begin
      notas_max2:=notas_max1;
      legajo_max2:=legajo_max1;
      notas_max1:=notas_diez;
      legajo_max1:=legajo;
    end
    else
      if (notas_diez>notas_max2) then
      begin
        notas_max2:=notas_diez;
        legajo_max2:=legajo;
      end;
    {Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)}
    if (notas_cero>notas_min1) then
    begin
      notas_min2:=notas_min1;
      legajo_min2:=legajo_min1;
      notas_min1:=notas_cero;
      legajo_min1:=legajo;
    end
    else
      if (notas_cero>notas_min2) then
      begin
        notas_min2:=notas_cero;
        legajo_min2:=legajo;
      end;
    {Introducir legajo de otro alumno}
    textcolor(green); write('Introducir legajo de otro alumno: ');
    textcolor(yellow); readln(legajo);
  end;
  ingresantes_porc:=ingresantes_parcial/ingresantes_total*100;
  recursantes_porc:=recursantes_parcial/recursantes_total*100;
  textcolor(green); write('La cantidad de alumnos INGRESANTES en condiciones de rendir el parcial es '); textcolor(red); write(ingresantes_parcial); textcolor(green); write(' y el porcentaje sobre el total de alumnos INGRESANTES es '); textcolor(red); write(ingresantes_porc:0:2); textcolor(green); writeln('%');
  textcolor(green); write('La cantidad de alumnos RECURSANTES en condiciones de rendir el parcial es '); textcolor(red); write(recursantes_parcial); textcolor(green); write(' y el porcentaje sobre el total de alumnos RECURSANTES es '); textcolor(red); write(recursantes_porc:0:2); textcolor(green); writeln('%');
  textcolor(green); write('La cantidad de alumnos que aprobaron todas las autoevaluaciones es '); textcolor(red); writeln(alumnos_autoeva);
  textcolor(green); write('La cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos es '); textcolor(red); writeln(alumnos_nota);
  textcolor(green); write('La cantidad de alumnos que obtuvieron cero puntos en, al menos, una autoevaluación es '); textcolor(red); writeln(alumnos_cero);
  textcolor(green); write('Los legajos de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez) son '); textcolor(red); write(legajo_max1); textcolor(green); write(' y '); textcolor(red); writeln(legajo_max2);
  textcolor(green); write('Los legajos de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero) son '); textcolor(red); write(legajo_min1); textcolor(green); write(' y '); textcolor(red); write(legajo_min2);
end.