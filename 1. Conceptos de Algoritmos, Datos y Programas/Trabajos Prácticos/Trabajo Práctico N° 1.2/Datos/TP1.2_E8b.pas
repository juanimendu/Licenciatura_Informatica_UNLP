{TRABAJO PRÁCTICO N° 1.2}
{EJERCICIO 8b}
{Modificar el ejercicio anterior para que, además, informe el día en el que se realizó la mayor cantidad de ventas.}

program TP1_E8b;
{$codepage UTF8}
uses crt;
const
  monto_salida=0;
  dias_total=31;
var
  i, ventas, ventas_max, dia_max: int8;
  monto: int16;
  total: int32;
begin
  ventas:=0;
  ventas_max:=0;
  dia_max:=0;
  total:=0;
  for i:= 1 to dias_total do
  begin
    textcolor(green); write('Introducir monto de venta realizada del día ', i, ' del mes: ');
    textcolor(yellow); readln(monto);
    if (ventas>ventas_max) then
    begin
      ventas_max:=ventas;
      dia_max:=i-1;
    end;
    ventas:=0;
    while (monto<>monto_salida) do
    begin
      ventas:=ventas+1;
      total:=total+monto;
      textcolor(green); write('Introducir monto de venta realizada del día ', i, ' del mes: ');
      textcolor(yellow); readln(monto);
    end;
    textcolor(green); write('La cantidad de ventas del día ', i, ' del mes fue de '); textcolor(red); writeln(ventas);
  end;
  textcolor(green); write('El monto total acumulado en ventas de todo el mes fue $'); textcolor(red); writeln(total);
  textcolor(green); write('El día en el que se realizó la mayor cantidad de ventas fue el '); textcolor(red); write(dia_max); textcolor(green); write(' del mes');
end.