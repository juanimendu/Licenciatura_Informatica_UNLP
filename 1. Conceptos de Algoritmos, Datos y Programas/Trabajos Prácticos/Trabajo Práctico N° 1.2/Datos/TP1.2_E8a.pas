{TRABAJO PRÁCTICO N° 1.2}
{EJERCICIO 8a}
{Un local de ropa desea analizar las ventas realizadas en el último mes.
Para ello, se lee por cada día del mes, los montos de las ventas realizadas.
La lectura de montos para cada día finaliza cuando se lee el monto 0. Se asume un mes de 31 días.
Informar la cantidad de ventas por cada día y el monto total acumulado en ventas de todo el mes.}

program TP1_E8a;
{$codepage UTF8}
uses crt;
const
  monto_salida=0;
  dias_total=31;
var
  i, ventas: int8;
  monto: int16;
  total: int32;
begin
  total:=0;
  for i:= 1 to dias_total do
  begin
    textcolor(green); write('Introducir monto de venta realizada el día ', i, ' del mes: ');
    textcolor(yellow); readln(monto);
    ventas:=0;
    while (monto<>monto_salida) do
    begin
      ventas:=ventas+1;
      total:=total+monto;
      textcolor(green); write('Introducir monto de venta realizada el día ', i, ' del mes: ');
      textcolor(yellow); readln(monto);
    end;
    textcolor(green); write('La cantidad de ventas del día ', i, ' del mes fue de '); textcolor(red); writeln(ventas);
  end;
  textcolor(green); write('El monto total acumulado en ventas de todo el mes fue $'); textcolor(red); write(total);
end.