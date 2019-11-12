program PrintFactorial;

const n=100;
      d=300;

type
  ulong= array[-1..d] of 0..9;
var
  factorial: ulong;
  i,j: byte;
  buff: word;
  
begin
  factorial[-1]:=1; //significant digits
  factorial[0]:=1; //1
  buff:=0;
  for i:=1 to d do factorial[i]:=0;
  
  for j:=2 to n do
  begin    
  i:=0;
    repeat
      buff:=factorial[i]*j+buff;
      factorial[i]:=buff mod 10;
      inc(i);
      buff:=buff div 10
    until (buff=0) and (factorial[-1]<=i);  
  factorial[-1]:=i;
  end;
  
  for i:=factorial[-1]-1 downto 0 do write(factorial[i]);   
end.