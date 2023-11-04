{TRABAJO PRÁCTICO N° 1.1}
{EJERCICIO 9}
{Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro carácter, debe informar un error y finalizar.
Una vez leído el carácter de suma o resta, deberá leerse una secuencia de números enteros que finaliza con 0.
El programa deberá aplicar la operación leída con la secuencia de números e imprimir el resultado final.
Por ejemplo:
•	Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2= (4 - 3 - 5 - (-6)).
•	Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0= ( -10 + 5 + 6 + (-1)).}

{SOLUCIÓN 1}

program TP1_E9;
{$codepage UTF8}
uses crt;
const
  num_salida=0;
var
  num, total: int16;
  operacion: char;
begin
  textcolor(green); write('Seleccionar operación ("+" o "-"): ');
  textcolor(yellow); readln(operacion);
  if ((operacion='+') or (operacion='-')) then
  begin
    textcolor(green); write('Introducir número entero: ');
    textcolor(yellow); readln(num);
    total:=0;
    while (num<>num_salida) do
    begin
      if (operacion='+') then
        total:=total+num
      else
        total:=total-num;
      textcolor(green); write('Introducir número entero: ');
      textcolor(yellow); readln(num);
    end;
    textcolor(green); write('El resultado de la operación es '); textcolor(red); write(total);
  end
  else
  begin
    textcolor(red); write('ERROR. La operación es inválida')
  end;
end.

{SOLUCIÓN 2}

program TP1_E9;
{$codepage UTF8}
uses crt;
const
  num_salida=0;
var
  num, total: int16;
  operacion: char;
begin
  textcolor(green); write('Seleccionar operación ("+" o "-"): ');
  textcolor(yellow); readln(operacion);
  if ((operacion<>'+') and (operacion<>'-')) then
  begin
    textcolor(red); write('ERROR. La operación es inválida');
    halt(1);
  end
  else
  begin
    textcolor(green); write('Introducir número entero: ');
    textcolor(yellow); readln(num);
    total:=0;
    while (num<>num_salida) do
    begin
      if (operacion='+') then
        total:=total+num
      else
        total:=total-num;
      textcolor(green); write('Introducir número entero: ');
      textcolor(yellow); readln(num);
    end;
  end;
  textcolor(green); write('El resultado de la operación es '); textcolor(red); write(total);
end.