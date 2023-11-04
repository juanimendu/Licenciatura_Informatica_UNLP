{TRABAJO PRÁCTICO N° 2.2}
{EJERCICIO 4}
{El siguiente programa intenta resolver un enunciado. Sin embargo, el código posee 5 errores.
Indicar en qué línea se encuentra cada error y en qué consiste el error.
Enunciado: Realizar un programa que lea datos de 130 programadores Java de una empresa.
De cada programador, se lee el número de legajo y el salario actual.
El programa debe imprimir el total del dinero destinado por mes al pago de salarios y el salario del empleado mayor legajo.}

program TP2_E4;
{$codepage UTF8}
uses crt;
procedure leerDatos(var legajo: integer; var salario: real);
begin
  writeln('Ingresar el número de legajo y el salario');
  read(legajo);
  read(salario);
end;
procedure actualizarMaximo(nuevoLegajo: integer; nuevoSalario: real; var maxLegajo: integer; var maxSalario: real);
begin
  if (nuevoLegajo>maxLegajo) then
  begin
    maxLegajo:=nuevoLegajo;
    maxSalario:=nuevoSalario;
  end;
end;
var
  legajo, maxLegajo, i: integer;
  salario, maxSalario, sumaSalarios: real;
begin
  maxLegajo:=0;
  maxSalario:=0;
  sumaSalarios:=0;
  for i:= 1 to 130 do
  begin
    leerDatos(legajo,salario);
    actualizarMaximo(legajo,salario,maxLegajo,maxSalario);
    sumaSalarios:=sumaSalarios+salario;
  end;
  writeln('En todo el mes se gastan ', sumaSalarios, ' pesos');
  writeln('El salario del empleado más nuevo es ', maxSalario);
end.