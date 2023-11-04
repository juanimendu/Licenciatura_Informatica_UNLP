{TRABAJO PRÁCTICO N° 0}
{EJERCICIO 5a}
{Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo cantidades iguales entre todos los clientes. Los que le sobren se los quedará para él.
(a) Realizar un programa que lea la cantidad de caramelos que posee el kiosquero (X), la cantidad de clientes (Y) e imprima en pantalla un mensaje informando la cantidad de caramelos que le corresponderá a cada cliente y la cantidad de caramelos que se quedará para sí mismo.}

program TP0_E5a;
{$codepage UTF8}
uses crt;
var
  tot_caramelos, tot_clientes, caramelos_cliente, caramelos_kiosquero: int16;
begin
  textcolor(green); write('Introducir cantidad de caramelos que posee el kiosquero: ');
  textcolor(yellow); readln(tot_caramelos);
  textcolor(green); write('Introducir cantidad de clientes que tiene el kiosquero: ');
  textcolor(yellow); readln(tot_clientes);
  caramelos_cliente:=tot_caramelos div tot_clientes;
  caramelos_kiosquero:=tot_caramelos mod tot_clientes;
  textcolor(green); write('La cantidad de caramelos que le corresponderá a cada cliente es '); textcolor(red); writeln(caramelos_cliente);
  textcolor(green); write('La cantidad de caramelos que se quedará el kioskero es '); textcolor(red); write(caramelos_kiosquero);
end.