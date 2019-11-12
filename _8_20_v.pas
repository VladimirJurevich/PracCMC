program _8_20_v;

const
  n=25;

var
  seq: array[1..n] of integer;
  flag: boolean;
  i: byte;
  
begin  
  for i:=1 to n do read(seq[i]);
  flag:=true;
  
  for i:=1 to (n div 2 +1) do
    if  (seq[i]<>seq[n-i+1]) then
    begin
      flag:=false;
      break
    end;
    
  write(flag)
end.