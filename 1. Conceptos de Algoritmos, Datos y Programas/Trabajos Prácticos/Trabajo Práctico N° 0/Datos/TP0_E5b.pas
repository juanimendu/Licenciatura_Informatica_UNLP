{TRABAJO PRÁCTICO N° 0}
{EJERCICIO 5b}
{Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo cantidades iguales entre todos los clientes. Los que le sobren se los quedará para él.
(b) Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo tiene un valor de $1,60.}

program TP0_E5b;
{$codepage UTF8}
uses crt;
const
  precio=1.6;
var
  tot_caramelos, tot_clientes, caramelos_vendidos, caramelos_kiosquero: int16;
begin
  textcolor(green); write('Introducir cantidad de caramelos que posee el kiosquero: ');
  textcolor(yellow); readln(tot_caramelos);
  textcolor(green); write('Introducir cantidad de clientes que tiene el kiosquero: ');
  textcolor(yellow); readln(tot_clientes);
  caramelos_kiosquero:=tot_caramelos mod tot_clientes;
  caramelos_vendidos:=tot_caramelos-caramelos_kiosquero;
  textcolor(green); write('El dinero que deberá cobrar el kiosquero si cada caramelo tiene un valor de $'); textcolor(red); write(precio:0:2); textcolor(green); write(' es $'); textcolor(red); write(caramelos_vendidos*precio:0:2);
end.