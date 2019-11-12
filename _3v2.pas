program _3v2;

var
  c:char;
  f: text;

function Compute():integer; forward;

function T():integer;

begin
  if c in ['0'..'9'] then T:=ord(c)-ord('0')
  else begin
    read(f,c);
    T:=Compute();
  end;
  if not EoLn(f) then read(f,c);
end;

function M():integer;

var
  a: integer;
  
begin
  a:=T();
  while c='*' do begin
    read(f,c);
    a:=a*T()
  end;
  
  M:=a
end;  

function Compute():integer;

var
  a: integer;

begin
  a:=M();
  while c='+' do begin
    read(f,c);
    a:=a+M()
  end;
  
  Compute:=a
end;

procedure ComputeAll();
  
begin
  reset(f);
  
  while not EoF(f) do begin
    read(f,c);
    writeln(Compute());
    readln(f)
	end

end;

begin
  assign(f,'task3.txt');
  ComputeAll();
end.