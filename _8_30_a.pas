program _8_29_e;

const
  n=7;
  
type
  RealSequence=array[1..n] of real;

var
  seq: RealSequence;
  i,j,negcount: byte;
  buff: real;
  
begin  
  for i:=1 to n do read(seq[i]);
  negcount:=0;
  i:= n;
  
  while (i>=2) AND (negcount<i) do
    if (seq[i]<0) then
    begin
      inc(negcount);
      for j:=i downto 2 do 
      begin
        buff:=seq[j];
        seq[j]:=seq[j-1];
        seq[j-1]:=buff;
      end;
    end
    else dec(i);
  
  for i:=1 to n do write(seq[i],' ');  
end.