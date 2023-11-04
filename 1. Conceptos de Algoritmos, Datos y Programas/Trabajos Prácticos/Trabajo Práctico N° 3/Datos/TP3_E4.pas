{TRABAJO PRÁCTICO N° 3}
{EJERCICIO 4}
{Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de consumo ilimitados (clientes que pagan por lo que consumen).
Para cada cliente, se conoce su código de cliente y cantidad de líneas a su nombre.
De cada línea, se tiene el número de teléfono, la cantidad de minutos consumidos y la cantidad de MB consumidos en el mes.
Se pide implementar un programa que lea los datos de los clientes de la compañía e informe el monto total a facturar para cada uno.
Para ello, se requiere:
•	Realizar un módulo que lea la información de una línea de teléfono.
•	Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas
(utilizando el módulo desarrollado en el inciso (a) y retorne la cantidad total de minutos y la cantidad total de MB a facturar del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}

program TP3_E4;
{$codepage UTF8}
uses crt;
const
  precioMinuto = 3.40;
  precioMb = 1.35;
  totclientes =9300;

type
tlinea=record
  numtel:int32;
  cantMinutos:int32;
  cantMb:int64;
end;
tcliente=record
  codigo: integer;
  lineas: integer;
end;
tclientes = array [1..totclientes] of tcliente;

procedure leeDatosLinea(var linea:tlinea);
begin
  writeln('Ingrese el numero de telefono de la linea');
  readln(linea.numtel);
  writeln('Ingrese la cantidad de minutos consumidos en el mes');
  readln(linea.cantMinutos);
  writeln('Ingrese la cantidad de MB consumidos en el mes');
  readln(linea.cantMb);
end;

procedure minYMbParaFacturacion(cantLineas: integer; var minutos, MB: int64);
var
  i: int32;
  linea:tlinea;
begin
  linea.numtel:=0;
  linea.cantMinutos:=0;
  linea.cantMb:=0;
  i:=0;
  for i:=1 to cantLineas do
    begin
      writeln('Ingrese datos de la linea ', i,':');
      leeDatosLinea(linea);
      minutos:=minutos + linea.cantMinutos;
      MB:=MB + linea.cantMb;
    end;
end;

procedure LoopFacturacion(var cliente:tcliente; minutos, MB: int64; var facturacion: real);
var
  locCliente:tcliente;
  cantlineas:integer;
  codCliente:integer;
begin
  facturacion:=0;
  locCliente:=cliente;
  cantLineas:=  locCliente.lineas;
  codCliente:= locCliente.codigo;
  textcolor(blue); writeln('El cliente ', codCliente, ' posee ', cantLineas, ' lineas activas. Incorpore la informacion de sus lineas.' );
  minYMbParaFacturacion(cantLineas, minutos, MB);
  facturacion:= MB* precioMb + minutos * precioMinuto;
  writeln('La facturacion del cliente con codigo ', codCliente, 'es : ', facturacion:0:2);
end;

var
  clientes: tclientes;
  minutos, MB: int64;
  facturacion: real;
  j: int32;

begin
  minutos:=0;
  MB:=0;
  facturacion:=0;
  j:=0;
  {el loop siguiente es para  simular una base de datos que ya esta creada con datos aleatorios}
  for j:=1 to 9300 do
    begin
      clientes[j].codigo:=j;
      clientes[j].lineas:=random(4)+1;
      writeln(clientes[j].codigo,'-',clientes[j].lineas);
    end;

  {este si es el loop principal}
  for j:=1 to 9300 do
    begin
      LoopFacturacion(clientes[j], minutos, MB,facturacion);
    end;
end.