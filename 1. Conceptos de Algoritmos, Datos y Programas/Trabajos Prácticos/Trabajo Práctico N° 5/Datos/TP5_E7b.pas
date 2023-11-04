{TRABAJO PRÁCTICO N° 5}
{EJERCICIO 7b}
{Se desea almacenar en memoria una secuencia de 2500 nombres de ciudades, cada nombre podrá tener una longitud máxima de 50 caracteres.
(b) Dado que un compilador de Pascal típico no permite manejar estructuras de datos estáticas que superen los 64 KB,
pensar en utilizar un vector de vector_ciudad a palabras, como se indica en la siguiente estructura.
Type
  Nombre=String[50];
  Puntero=^Nombre;
  Arrvector_ciudad=array[1..2500] of Puntero;
Var
  vector_ciudad: Arrvector_ciudad;
(i) Indicar cuál es el tamaño de la variable vector_ciudad al comenzar el programa.
(ii) Escribir un módulo que permita reservar memoria para los 2500 nombres. ¿Cuál es la cantidad de memoria reservada después de ejecutar el módulo? ¿La misma corresponde a memoria estática o dinámica?
(iii) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable vector_ciudad.}

program TP5_E7b;
{$codepage UTF8}
uses crt;
const
  longitud_ciudad=50; ciudades_total=2500;
type
  t_ciudad=string[longitud_ciudad];
  t_puntero_ciudad=^t_ciudad;
  t_vector_ciudad=array[1..ciudades_total] of t_puntero_ciudad;
{ii}
procedure reservar_memoria(var vector_ciudad: t_vector_ciudad);
var
  i: int16;
begin
  for i:= 1 to ciudades_total do
    new(vector_ciudad[i]);
end;
{iii}
procedure leer_ciudades(var vector_ciudad: t_vector_ciudad);
var
  i: int16;
begin
  for i:= 1 to ciudades_total do
  begin
    textcolor(green); write('Introducir nombre de ciudad ', i, ': ');  
    textcolor(yellow); readln(vector_ciudad[i]^);
  end;
end;
var
  vector_ciudad: t_vector_ciudad;
  i: int16;
begin
  for i:= 1 to ciudades_total do
    vector_ciudad[i]:=nil;
  textcolor(green); write('El tamaño de la variable vector_ciudad es '); textcolor(red); write(sizeof(vector_ciudad)); textcolor(green); writeln(' bytes');
  textcolor(green); write('El tamaño del contenido de la variable vector_ciudad es '); textcolor(red); write(sizeof(vector_ciudad[1]^)*length(vector_ciudad)); textcolor(green); writeln(' bytes');
  reservar_memoria(vector_ciudad);
  textcolor(green); write('El tamaño de la variable vector_ciudad es '); textcolor(red); write(sizeof(vector_ciudad)); textcolor(green); writeln(' bytes');
  textcolor(green); write('El tamaño del contenido de la variable vector_ciudad es '); textcolor(red); write(sizeof(vector_ciudad[1]^)*length(vector_ciudad)); textcolor(green); writeln(' bytes');
  leer_ciudades(vector_ciudad);
  textcolor(green); write('El tamaño de la variable vector_ciudad es '); textcolor(red); write(sizeof(vector_ciudad)); textcolor(green); writeln(' bytes');
  textcolor(green); write('El tamaño del contenido de la variable vector_ciudad es '); textcolor(red); write(sizeof(vector_ciudad[1]^)*length(vector_ciudad)); textcolor(green); write(' bytes');
end.