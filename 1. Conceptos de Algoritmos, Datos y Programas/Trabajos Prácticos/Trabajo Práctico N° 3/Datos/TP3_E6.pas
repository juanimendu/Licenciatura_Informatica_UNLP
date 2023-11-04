{TRABAJO PRÁCTICO N° 3}
{EJERCICIO 6}
{Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la información de los productos que mantiene actualmente en stock.
Para ello, se conoce la siguiente información de los microprocesadores:
marca (Intel, AMD, NVidia, etc.), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y
tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45, etc.).
La información de los microprocesadores se lee de forma consecutiva por marca de procesador y
la lectura finaliza al ingresar un procesador con 0 cores (que no debe procesarse).
Se pide implementar un programa que lea información de los microprocesadores de la empresa importadora e informe:
•	Marca y línea de todos los procesadores de más de 2 cores con transistores de, a lo sumo, 22 nm.
•	Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
•	Cantidad de rprocesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de, al menos, 2 Ghz.}

program TP3_E6;
{$codepage UTF8}
uses crt;
const
  cores_salida=0; cores_obj=2; transistores_obj1=22; transistores_obj2=14; velocidad_obj=2.0;
type
  t_registro_procesador=record
    cores: int16;
    marca: string;
    linea: string;
    velocidad: real;
    transistores: int16;
  end;
procedure leer_procesador(var registro_procesador: t_registro_procesador);
begin
  textcolor(green); write('Introducir cantidad de cores o núcleos de procesamiento del procesador (1, 2, 4, 8): '); textcolor(yellow); readln(registro_procesador.cores);
  if (registro_procesador.cores<>cores_salida) then
  begin
    textcolor(green); write('Introducir marca del procesador (Intel, AMD, NVidia): '); textcolor(yellow); readln(registro_procesador.marca);
    textcolor(green); write('Introducir línea del procesador (Xeon, Core i7, Opteron, Atom, Centrino): '); textcolor(yellow); readln(registro_procesador.linea);
    textcolor(green); write('Introducir velocidad del reloj (medida en Ghz): '); textcolor(yellow); readln(registro_procesador.velocidad);
    textcolor(green); write('Introducir tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45): '); textcolor(yellow); readln(registro_procesador.transistores);
  end;
end;
procedure actualizar_maximos(transistores_marca: int16; marca: string; var transistores_max1, transistores_max2: int16; var marca_max1, marca_max2: string);
begin
  if (transistores_marca>transistores_max1) then
  begin
    transistores_max2:=transistores_max1;
    marca_max2:=marca_max1;
    transistores_max1:=transistores_marca;
    marca_max1:=marca;
  end
  else
    if (transistores_marca>transistores_max2) then
    begin
      transistores_max2:=transistores_marca;
      marca_max2:=marca;
    end;
end;
procedure leer_procesadores(var procesadores_intel_amd: int16; var marca_max1, marca_max2: string);
var
  registro_procesador: t_registro_procesador;
  transistores_marca, transistores_max1, transistores_max2: int16;
  marca: string;
begin
  transistores_max1:=0; transistores_max2:=0;
  leer_procesador(registro_procesador);
  while (registro_procesador.cores<>cores_salida) do
  begin
    marca:=registro_procesador.marca; transistores_marca:=0;
    while ((registro_procesador.marca=marca) and (registro_procesador.cores<>cores_salida)) do
    begin
      if ((registro_procesador.cores>cores_obj) and (registro_procesador.transistores<=transistores_obj1)) then
      begin
        textcolor(green); write('La marca y la línea de este procesador con más de 2 cores con transistores de, a lo sumo, 22 nm. son '); textcolor(red); write(registro_procesador.marca); textcolor(green); write(' y '); textcolor(red); writeln(registro_procesador.linea);
      end;
      if (registro_procesador.transistores=transistores_obj2) then
        transistores_marca:=transistores_marca+1;
      if ((registro_procesador.cores>=cores_obj) and ((registro_procesador.marca='Intel') or (registro_procesador.marca='AMD')) and (registro_procesador.velocidad>=velocidad_obj)) then
        procesadores_intel_amd:=procesadores_intel_amd+1;
      leer_procesador(registro_procesador);
    end;
    actualizar_maximos(transistores_marca,marca,transistores_max1,transistores_max2,marca_max1,marca_max2);
  end;
end;
var
  procesadores_intel_amd: int16;
  marca_max1, marca_max2: string;
begin
  procesadores_intel_amd:=0;
  leer_procesadores(procesadores_intel_amd,marca_max1,marca_max2);
  textcolor(green); write('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm. son '); textcolor(red); write(marca_max1); textcolor(green); write(' y '); textcolor(red); writeln(marca_max2);
  textcolor(green); write('La cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de, al menos, 2 Ghz es '); textcolor(red); write(procesadores_intel_amd);
end.