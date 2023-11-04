{TRABAJO PRÁCTICO N° 4.1}
{EJERCICIO 7}
{}

program TP4_E7;
{$codepage UTF8}
uses crt;
const
  dimDig=10;
type vdatos = array[1..dimDig] of integer;

procedure lecturaYFrecuencias(var digitos: vdatos);
  var
    i, num, d:integer;
  begin
    for i:=1 to dimDig do
      digitos[i]:=0;
    writeln('Ingrese secuencialmente una serie de numeros enteros -para cortar ingrese -1');
    writeln('Ingrese el primer numero');
    readln(num);
    while (num <> -1) do
      begin
        while (num<>0) do
          begin
            d:= num MOD 10;
              for i:=1 to (dimDig -1) do
                if (i=d) then digitos[i]:=digitos[i]+1;
              if (d=0) then digitos[10]:=digitos[10]+1;
            num:= num DIV 10;
          end;
        writeln('Ingrese otro numero');
        readln(num);
      end;
  end;

function digMasLeido(digitos: vdatos): integer;
var
  freqMax, digMax, i:integer;
begin
  freqMax:=Low(integer);
  for i:= 1 to dimDig do
    begin
      if (digitos[i]>=freqMax) then 
        begin
          digMax:=i;
          freqMax:=digitos[i];
        end;
    end;
    if (digMax<>10) then digMasLeido:=digMax 
    else digMasLeido:=0; 
end;

procedure sinOcurrencias(var digitos, sinocur: vdatos; var dimSinocur: integer);
  var
    i:integer;
  begin
    for i:=1 to dimDig do
      begin
        if (digitos[i]=0) then
          begin
            dimSinocur:=dimSinocur+1;
            sinocur[dimSinocur]:=i
          end;
      end;
  end;


var 
  digitos, sinocur:vdatos;
  i, dimSinocur, digSinocur:integer;

begin
  dimSinocur:=0;
  digSinocur:=999;
  lecturaYFrecuencias(digitos);
  digMasLeido(digitos);
  sinOcurrencias(digitos, sinocur, dimSinocur);

  writeln('');
  writeln('Las frecuencias de ocurrencia por digito son:');
  for i:= 1 to dimDig do
    begin
      if (digitos[i]<>0) and (i<>10) then writeln('Numero ', i, ': ', digitos[i], ' veces')
      else if (digitos[i]<>0) and (i=10) then writeln('Numero ', 0, ': ', digitos[i], ' veces');
    end;

  writeln('');
  writeln('El digito mas leido fue el: ', digMasLeido(digitos));

  writeln('');
  writeln('Los digitos sin ocurrencias son:');
  for i:= 1 to dimSinocur do
    begin
      if(sinocur[i]<>10) then digSinocur:= sinocur[i]
      else digSinocur:= 0;
      writeln('Numero ', digSinocur);
    end;
end.