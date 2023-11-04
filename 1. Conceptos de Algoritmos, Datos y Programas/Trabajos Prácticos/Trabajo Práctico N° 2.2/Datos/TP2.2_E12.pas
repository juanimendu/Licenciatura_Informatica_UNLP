{TRABAJO PRÁCTICO N° 2.2}
{EJERCICIO 12}
{(a) Realizar un módulo que calcule el rendimiento económico de una plantación de soja.
El módulo debe recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar, 3: zona árida)
y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha plantación.
Para calcular el rendimiento económico esperado, debe considerar el siguiente rendimiento por tipo de zona:
(b) ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la provincia de Buenos Aires.
De cada campo, se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona (1, 2 ó 3).
La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse.
El precio de la soja es de U$S320 por tn. Informar:
•	La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
•	La localidad del campo con mayor rendimiento económico esperado.
•	La localidad del campo con menor rendimiento económico esperado.
•	El rendimiento económico promedio.}

program TP2_E12;
{$codepage UTF8}
uses crt;
const
  ha_salida=900; localidad_salida='Saladillo'; precio=320; rendimiento_corte=10000.0;
function rendimiento_economico(ha, zona, precio: int16): real;
begin
  case zona of
    1: rendimiento_economico:=ha*6*precio;
    2: rendimiento_economico:=ha*2.6*precio;
    3: rendimiento_economico:=ha*1.4*precio;
  end;
end;
procedure leer_campo(var localidad: string; var ha, zona: int16);
begin
  textcolor(green); write('Introducir localidad del campo: ');
  textcolor(yellow); readln(localidad);
  textcolor(green); write('Introducir cantidad de hectáreas sembradas del campo: ');
  textcolor(yellow); readln(ha);
  textcolor(green); write('Introducir tipo de zona del campo (1: zona muy fértil, 2: zona estándar, 3: zona árida): ');
  textcolor(yellow); readln(zona);
end;
procedure leer_campos(var campos_10000: int16; var rendimiento_prom: real; var localidad_max, localidad_min: string);
var
  ha, zona, campos_total: int16;
  rendimiento, rendimiento_max, rendimiento_min, rendimiento_total: real;
  localidad: string;
begin
  campos_total:=0; rendimiento:=0; rendimiento_max:=0; rendimiento_min:=999999; rendimiento_total:=0;
  repeat
    leer_campo(localidad,ha,zona);
    rendimiento:=rendimiento_economico(ha,zona,precio);
    rendimiento_total:=rendimiento_total+rendimiento;
    campos_total:=campos_total+1;
    if ((localidad='Tres de Febrero') and (rendimiento>rendimiento_corte)) then
      campos_10000:=campos_10000+1;
    if (rendimiento>rendimiento_max) then
    begin
      rendimiento_max:=rendimiento;
      localidad_max:=localidad;
    end;
    if (rendimiento<rendimiento_min) then
    begin
      rendimiento_min:=rendimiento;
      localidad_min:=localidad;
    end;
  until ((localidad=localidad_salida) and (ha=ha_salida));
  rendimiento_prom:=rendimiento_total/campos_total;
end;
var
  campos_10000: int16;
  rendimiento_prom: real;
  localidad_max, localidad_min: string;
begin
  campos_10000:=0; rendimiento_prom:=0;
  leer_campos(campos_10000,rendimiento_prom,localidad_max,localidad_min);
  textcolor(green); write('La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000 es '); textcolor(red); writeln(campos_10000);
  textcolor(green); write('La localidad del campo con mayor rendimiento económico esperado es '); textcolor(red); writeln(localidad_max);
  textcolor(green); write('La localidad del campo con menor rendimiento económico esperado es '); textcolor(red); writeln(localidad_min);
  textcolor(green); write('El rendimiento económico promedio es $'); textcolor(red); write(rendimiento_prom:0:2);
end.