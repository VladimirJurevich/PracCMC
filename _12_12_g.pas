function Includes5(N:integer) :Boolean;
begin
  n:=abs(n);
  if n = 0 then Includes5:= false
  else if n mod 10 = 5 then Includes5:= true
  else Includes5:= Includes5(n div 10);
end;