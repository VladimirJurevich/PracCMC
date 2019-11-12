program _5_20_v;

const
  eps = 1e-6;
  
var
  summ, mem, x: real;
  i: integer;
  
begin
  read(x);
  summ:=1;
  mem:=1;
  i:=2;
  
  while abs(mem)>eps do
  begin
    mem:=-mem*x*x/(i*(i-1));    
    summ:= summ+mem;
    i:=i+2;
  end;
  
  write(summ);
end.