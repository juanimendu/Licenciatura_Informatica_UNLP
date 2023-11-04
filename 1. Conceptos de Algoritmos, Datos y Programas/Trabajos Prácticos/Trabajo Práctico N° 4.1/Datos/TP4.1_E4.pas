{TRABAJO PRÁCTICO N° 4.1}
{EJERCICIO 4}
{Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
(a)	posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector, o el valor -1 en caso de no encontrarse.
(b)	intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector, donde se intercambiaron los valores de las posiciones x e y.
(c)	sumaVector: retorna la suma de todos los elementos del vector.
(d)	promedio: devuelve el valor promedio de los elementos del vector.
(e)	elementoMaximo: retorna la posición del mayor elemento del vector.
(f)	elementoMinimo: retorna la posicion del menor elemento del vector.}

program TP4_E4;
{$codepage UTF8}
uses crt;
type
  t_vector=array of int16;
procedure crear_vector(var vector: t_vector; dimF: int16);
begin
  setLength(vector,dimF);
end;
procedure rellenar_vector(var vector: t_vector; dimL: int16);
var
  i: int16;
begin
  for i:= 1 to dimL do
    vector[i]:=random(maxint);
end;
function posicion(vector: t_vector; dimL, numX: int16): int16;
var
  pos: int16;
begin
  pos:=0;
  while ((pos<=dimL) and (vector[pos]<>numX)) do
    pos:=pos+1;
  if (pos>dimL) then
    pos:=-1;
  posicion:=pos;
end;
procedure intercambio(var vector: t_vector; numX, numY: int16);
var
  num_aux: int16;
begin
  num_aux:=vector[numX];
  vector[numX]:=vector[numY];
  vector[numY]:=num_aux;
end;
function sumaVector(vector: t_vector; dimL: int16): int16;
var
  i, suma: int16;
begin
  suma:=0;
  for i:= 1 to dimL do
    suma:=suma+vector[i];
  sumaVector:=suma;
end;
function promedio(vector: t_vector; dimL: int16): real;
begin
  promedio:=sumaVector(vector,dimL)/dimL;
end;
function elementoMaximo(vector: t_vector; dimL: int16): int16;
var
  i, ele_max, pos_max: int16;
begin
  ele_max:=low(int16); pos_max:=low(int16);
  for i:= 1 to dimL do
  begin
    if (vector[i]>ele_max) then
    begin
      ele_max:=vector[i];
      pos_max:=i;
    end;
  end;
  elementoMaximo:=pos_max;
end;
function elementoMinimo(vector: t_vector; dimL: int16): int16;
var
  i, ele_min, pos_min: int16;
begin
  ele_min:=high(int16); pos_min:=high(int16);
  for i:= 1 to dimL do
  begin
    if (vector[i]<ele_min) then
    begin
      ele_min:=vector[i];
      pos_min:=i;
    end;
  end;
  elementoMinimo:=pos_min;
end;
var
  vector: t_vector;
  dimF, dimL, numX, numY: int16;
begin
  textcolor(green); write('Introducir número entero como dimensión física del vector: ');
  textcolor(yellow); readln(dimF);
  textcolor(green); write('Introducir número entero como dimensión lógica del vector: ');
  textcolor(yellow); readln(dimL);
  crear_vector(vector,dimF);
  rellenar_vector(vector,dimL);
  textcolor(green); write('Introducir número entero X para buscar su posición (si existe) en el vector: ');
  textcolor(yellow); readln(numX);
  textcolor(green); write('La posición del número '); textcolor(red); write(numX); textcolor(green); write(' en el vector es '); textcolor(red); writeln(posicion(vector,dimL,numX));
  textcolor(green); write('Introducir número entero X (entre 1 y 100): ');
  textcolor(yellow); readln(numX);
  textcolor(green); write('Introducir número entero Y (entre 1 y 100): ');
  textcolor(yellow); readln(numY);
  textcolor(green); write('Pre-intercambio, en las posiciones '); textcolor(red); write(numX); textcolor(green); write(', '); textcolor(red); write(numY); textcolor(green); write(', se tienen los valores '); textcolor(red); write(vector[numX]); textcolor(green); write(' y '); textcolor(red); write(vector[numY]); textcolor(green); writeln(', respectivamente');
  intercambio(vector,numX,numY);
  textcolor(green); write('Post-intercambio, en las posiciones '); textcolor(red); write(numX); textcolor(green); write(', '); textcolor(red); write(numY); textcolor(green); write(', se tienen los valores '); textcolor(red); write(vector[numX]); textcolor(green); write(' y '); textcolor(red); write(vector[numY]); textcolor(green); writeln(', respectivamente');
  textcolor(green); write('La suma de todos los elementos del vector es '); textcolor(red); writeln(sumaVector(vector,dimL));
  textcolor(green); write('El valor promedio de los elementos del vector es '); textcolor(red); writeln(promedio(vector,dimL):0:2);
  textcolor(green); write('La posición del mayor elemento del vector es '); textcolor(red); writeln(elementoMaximo(vector,dimL));
  textcolor(green); write('La posición del menor elemento del vector es '); textcolor(red); write(elementoMinimo(vector,dimL));
end.