{TRABAJO PRÁCTICO N° 0}
{EJERCICIO 3b}
{Implementar un programa que procese las ventas de un supermercado. El supermercado dispone de una tabla con los precios y stocks de los 1.000 productos que tiene a la venta.
(b) Implementar un módulo que reciba la estructura generada en el inciso (a) y un código de producto y retorne la cantidad de unidades vendidas de ese código de producto.}

program TP0_E3b;
{$codepage UTF8}
uses crt;
const
  productos_min=1; productos_max=1000; codigo_venta_salida=-1; ventas_salida=0;
type
  t_productos=productos_min..productos_max;
  t_registro_producto=record
    codigo_producto: int16;
    cantidad: int16;
    precio: real;
  end;
  t_lista_productos=^t_nodo_productos;
  t_nodo_productos=record
    ele: t_registro_producto;
    sig: t_lista_productos;
  end;
  t_registro_venta=record
    codigo_venta: int16;
    productos: t_lista_productos;
    monto_total: real;
  end;
  t_lista_ventas=^t_nodo_ventas;
  t_nodo_ventas=record
    ele: t_registro_venta;
    sig: t_lista_ventas;
  end;
  t_vector_productos=array[t_productos] of t_registro_producto;
procedure cargar_vector_productos(var vector_productos: t_vector_productos);
var
	i: int16;
begin
	for i:= productos_min to productos_max do
	begin
		vector_productos[i].codigo_producto:=i;
		vector_productos[i].cantidad:=random(10000);
		vector_productos[i].precio:=random(100000);
	end;
end;
function buscar_vector_productos(vector_productos: t_vector_productos; codigo_producto: int16): t_productos;
var
  pos: t_productos;
begin
  pos:=1;
  while (vector_productos[pos].codigo_producto<>codigo_producto) do
    pos:=pos+1;
  buscar_vector_productos:=pos;
end;
procedure chequear_stock_vector_productos(var vector_productos: t_vector_productos; var registro_producto: t_registro_producto; pos: t_productos);
begin
  if (registro_producto.cantidad<vector_productos[pos].cantidad) then
    vector_productos[pos].cantidad:=vector_productos[pos].cantidad-registro_producto.cantidad
  else
  begin
    registro_producto.cantidad:=vector_productos[pos].cantidad;
    vector_productos[pos].cantidad:=0;
  end;
end;
procedure cargar_registro_producto(var registro_producto: t_registro_producto; var vector_productos: t_vector_productos; var monto_total: real);
var
  pos: t_productos;
begin
  textcolor(green); write('Introducir código del produto: ');
  textcolor(yellow); readln(registro_producto.codigo_producto);
  textcolor(green); write('Introducir cantidad solicitada del producto: ');
  textcolor(yellow); readln(registro_producto.cantidad);
  pos:=buscar_vector_productos(vector_productos,registro_producto.codigo_producto);
  chequear_stock_vector_productos(vector_productos,registro_producto,pos);
  if (registro_producto.cantidad<>ventas_salida) then
  begin
    registro_producto.precio:=vector_productos[pos].precio;
    monto_total:=monto_total+registro_producto.precio*registro_producto.cantidad;
  end;
end;
procedure agregar_adelante_lista_productos(var lista_productos: t_lista_productos; registro_producto: t_registro_producto);
var
  nuevo: t_lista_productos;
begin
  new(nuevo);
  nuevo^.ele:=registro_producto;
  nuevo^.sig:=lista_productos;
  lista_productos:=nuevo;
end;
procedure cargar_lista_productos(var lista_productos: t_lista_productos; var vector_productos: t_vector_productos; var monto_total: real);
var
  registro_producto: t_registro_producto;
begin
  cargar_registro_producto(registro_producto,vector_productos,monto_total);
  while (registro_producto.cantidad<>ventas_salida) do
  begin
    agregar_adelante_lista_productos(lista_productos,registro_producto);
    cargar_registro_producto(registro_producto,vector_productos,monto_total);
  end;
end;
procedure cargar_registro_venta(var registro_venta: t_registro_venta; var vector_productos: t_vector_productos);
var
  monto_total: real;
begin
  registro_venta.productos:=nil; monto_total:=0;
  textcolor(green); write('Introducir código de la venta: ');
  textcolor(yellow); readln(registro_venta.codigo_venta);
  if (registro_venta.codigo_venta<>codigo_venta_salida) then
  begin
    cargar_lista_productos(registro_venta.productos,vector_productos,monto_total);
    registro_venta.monto_total:=monto_total;
  end;
end;
procedure agregar_adelante_lista_ventas(var lista_ventas: t_lista_ventas; registro_venta: t_registro_venta);
var
  nuevo: t_lista_ventas;
begin
  new(nuevo);
  nuevo^.ele:=registro_venta;
  nuevo^.sig:=lista_ventas;
  lista_ventas:=nuevo;
end;
procedure cargar_lista_ventas(var lista_ventas: t_lista_ventas; vector_productos: t_vector_productos);
var
  registro_venta: t_registro_venta;
begin
  cargar_registro_venta(registro_venta,vector_productos);
  while (registro_venta.codigo_venta<>codigo_venta_salida) do
  begin
    agregar_adelante_lista_ventas(lista_ventas,registro_venta);
    cargar_registro_venta(registro_venta,vector_productos);
  end;
end;
function buscar_ventas_producto(lista_ventas: t_lista_ventas; codigo_producto: int16): int16;
var
  ventas: int16;
begin
  ventas:=0;
  while (lista_ventas<>nil) do
  begin
    while (lista_ventas^.ele.productos<>nil) do
    begin
      if (lista_ventas^.ele.productos^.ele.codigo_producto=codigo_producto) then
        ventas:=ventas+lista_ventas^.ele.productos^.ele.cantidad;
      lista_ventas^.ele.productos:=lista_ventas^.ele.productos^.sig;
    end;
    lista_ventas:=lista_ventas^.sig;
  end;
  buscar_ventas_producto:=ventas;
end;
var
  vector_productos: t_vector_productos;
  lista_ventas: t_lista_ventas;
  codigo_producto, ventas: int16;
begin
  randomize;
  cargar_vector_productos(vector_productos); lista_ventas:=nil; ventas:=0;
  cargar_lista_ventas(lista_ventas,vector_productos);
  textcolor(green); write('Introducir código del producto que se desea buscar: ');
  textcolor(yellow); readln(codigo_producto);
  ventas:=buscar_ventas_producto(lista_ventas,codigo_producto);
  textcolor(green); write('La cantidad de unidades vendidas del producto '); textcolor(red); write(codigo_producto); textcolor(green); write(' es '); textcolor(red); write(ventas);
end.