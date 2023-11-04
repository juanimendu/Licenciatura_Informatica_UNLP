{TRABAJO PRÁCTICO N° 4.1}
{EJERCICIO 8}
{}

program TP4_E8;
{$codepage UTF8}
uses crt;
const
  cantAlumnos=3;
type
str=string[50];
  talumno = record
    nroInscripcion:integer;
    dni:int32;
    apellido:str;
    nombre:str;
    anioNac:integer;
  end;
  tvector= array[1..cantAlumnos] of talumno;


procedure lecturaAlumnos(var alumnos:tvector);
  var
    i:integer;
  begin
    for i:=1 to cantAlumnos do
      begin
        writeln('Ingrese el Numero de Inscripcion del alumno');
        readln(alumnos[i].nroInscripcion);
        writeln('Ingrese el DNI del alumno');
        readln(alumnos[i].dni);
        writeln('Ingrese el Apellido del alumno');
        readln(alumnos[i].apellido);
        writeln('Ingrese el Nombre del alumno');
        readln(alumnos[i].nombre);
        writeln('Ingrese el ano de nacimiento del alumno');
        readln(alumnos[i].anioNac);
      end;
  end;


function porcentajeDNIPares(alumnos:tvector): real;
  var
    i, suma,d:integer;
    esimpar:boolean;
  begin
    suma:=0;
    for i:=1 to cantAlumnos do
      begin
        esimpar:=false;
          while (alumnos[i].dni<>0) and (esimpar=false) do
            begin
              d:=alumnos[i].dni MOD 10;
              esimpar:= (d MOD 2 <> 0);
              alumnos[i].dni:= alumnos[i].dni DIV 10;
            end;
        if (esimpar=false) then suma:= suma+1;
      end;
    porcentajeDNIPares:=suma/cantAlumnos;
  end;

procedure maxEdad(alumnos:tvector; var max1Apellido,max1Nombre,max2Apellido,max2Nombre: str);
  var
    i, anioMin1, anioMin2:integer;
  begin
    anioMin1:=High(integer);
    anioMin2:=High(integer);
    for i:=1 to cantAlumnos do
      begin
        if (alumnos[i].anioNac < anioMin1) then
          begin
            anioMin1:=alumnos[i].anioNac;
            max1Apellido:=alumnos[i].apellido;
            max1Nombre:=alumnos[i].nombre;
          end
        else if (alumnos[i].anioNac < anioMin2) then
          begin
            anioMin2:=alumnos[i].anioNac;
            max2Apellido:=alumnos[i].apellido;
            max2Nombre:=alumnos[i].nombre;
          end;
      end;
  end;

var
alumnos: tvector;
max1Apellido,max1Nombre,max2Apellido,max2Nombre: str;

begin
  lecturaAlumnos(alumnos);
  porcentajeDNIPares(alumnos);
  porcentajeDNIPares(alumnos);
  maxEdad(alumnos,max1Apellido,max1Nombre,max2Apellido,max2Nombre);
  writeln('El porcentaje de alumnos con DNI compuesto sólo por dígitos pares es:', porcentajeDNIPares(alumnos));
  writeln('Los dos alumnos con mayor edad son: ', max1Apellido, ', ', max1Nombre, ' y ', max2Apellido, ', ', max2Nombre);
end.