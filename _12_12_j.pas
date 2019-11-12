procedure OutputInteger(N:integer);

var
  neg: integer;
  
begin
  if n<0 then neg:=-1
  else neg:=1;
  n:=abs(n);
  
  if n<10 then begin
    if neg=-1 then write('-');
    write(chr(n+ord('0')))
  end else begin
    OutputInteger(neg*(n div 10));
    OutputInteger(n mod 10)
  end;
end;