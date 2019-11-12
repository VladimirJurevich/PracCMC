program _3v2;

function Compute(var f:text):integer;

var
  c,sh:char;
  sum, mul, op : integer;
begin
  sum:=0; mul:=0;
  c:='+';
  
  while (c in ['+','*']) do begin
    sh:=c;
    read(f,c);
    if c='(' then op:=Compute(f)
    else op:=ord(c)-ord('0');
    
    if sh='+' then begin
      sum:=sum+mul;
      mul := op end
    else mul:=mul*op;
    
    if not EoLn(f) then read(f,c);
    if c=')' then Compute:=sum+mul;
  end;
  
  Compute:=sum+mul;
end;

procedure ComputeAll(var f: text);

begin
  reset(f);
  
  while not EoF(f) do begin
    writeln(Compute(f));
    readln(f)
	end

end;

var
  f:text;
  
begin
  assign(f,'task3.txt');
  ComputeAll(f);
end.