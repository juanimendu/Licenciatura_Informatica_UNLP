{TRABAJO PRÁCTICO N° 3}
{EJERCICIO 2}
{El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año 2019.
Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
(a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
(b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido en el inciso (a).
(c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019.
La lectura finaliza al ingresar el año 2020, que no debe procesarse,
e informe la cantidad de casamientos realizados durante los meses de verano (enero, febrero y marzo) y
la cantidad de casamientos realizados en los primeros 10 días de cada mes.
Nota: utilizar el módulo realizado en (b) para la lectura de fecha.}

program TP3_E2;
{$codepage UTF8}
uses crt;
const
  anio_salida=2020; dia_corte=10;
type
  t_dia=1..31;
  t_mes=1..12;
  t_registro_casamiento=record
    dia: t_dia;
    mes: t_mes;
    anio: int16;
  end;
procedure leer_casamiento(var registro_casamiento: t_registro_casamiento);
begin
  textcolor(green); write('Introducir año del casamiento: '); textcolor(yellow); readln(registro_casamiento.anio);
  if (registro_casamiento.anio<>anio_salida) then
  begin
    textcolor(green); write('Introducir mes del casamiento: '); textcolor(yellow); readln(registro_casamiento.mes);
    textcolor(green); write('Introducir día del casamiento: '); textcolor(yellow); readln(registro_casamiento.dia);
  end;
end;
procedure leer_casamientos(var casamientos_verano, casamientos_1a10: int16);
var
  registro_casamiento: t_registro_casamiento;
begin
  leer_casamiento(registro_casamiento);
  while (registro_casamiento.anio<>anio_salida) do
  begin
    if ((registro_casamiento.mes=1) or (registro_casamiento.mes=2) or (registro_casamiento.mes=3)) then
      casamientos_verano:=casamientos_verano+1;
    if (registro_casamiento.dia<=dia_corte) then
      casamientos_1a10:=casamientos_1a10+1;
    leer_casamiento(registro_casamiento);
  end;
end;
var
  casamientos_verano, casamientos_1a10: int16;
begin
  casamientos_verano:=0; casamientos_1a10:=0;
  leer_casamientos(casamientos_verano,casamientos_1a10);
  textcolor(green); write('La cantidad de casamientos realizados durante los meses de verano (enero, febrero y marzo) es '); textcolor(red); writeln(casamientos_verano);
  textcolor(green); write('La cantidad de casamientos realizados en los primeros 10 días de cada mes es '); textcolor(red); write(casamientos_1a10);
end.