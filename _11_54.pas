program _11_54;

function GCD(M,N:longint):longint;
begin
  if n=0 then GCD:=m
  else GCD:= GCD(n, m mod n)
end;

var
  d1, d2, d3, d4, a1, a2: longint;

begin
    read(d1,d2,d3,d4);
    if (d1<=0) or (d2<=0) or (d3<=0) or (d4<=0) then write('Error')
    else begin
      a1:=d1*d2 div GCD(d1,d2);
      a2:=d3*d4 div GCD(d3,d4);
      write(a1*a2 div GCD(a1,a2))
    end
end.