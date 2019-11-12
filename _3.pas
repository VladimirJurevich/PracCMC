program _3;

function Pull(var s: string):char;

var
  c:char;
  
begin
  c:=s[length(s)];
  Delete(s,length(s),1);
  Pull:=c
end;


function ToRPN(math: string): string; 

var
  res, stack: string;
  i: integer;

begin
	stack:='|';
	
	for i:=1 to length(math) do
		if ('0'<=math[i]) and (math[i]<='9') then res:=res+math[i]
		else if math[i]='*' then begin
			while stack[length(stack)]='*' do res:=res+Pull(stack);
			stack:=stack+'*' end
		else if math[i]='+' then begin
			while (stack[length(stack)]='+') or (stack[length(stack)]='*') do res:=res+Pull(stack);
			stack:=stack+'+' end
		else if math[i]='(' then stack:=stack+'('
		else begin
			while stack[length(stack)]<>'(' do res:=res+Pull(stack);
			Pull(stack) end;
	
	for i:=1 to length(stack)-1 do res:=res+Pull(stack);
	ToRPN:=res; exit
end;


function ComputeRPN(RPN: string):integer;

var
  calc: array[1..200] of integer;
  stLength,i: integer;
begin
  stLength:=0;
  
  for i:=1 to length(RPN) do case RPN[i] of
    '0'..'9': begin inc(stLength); calc[stLength]:=ord(RPN[i])-ord('0') end;
    '+': begin calc[stLength-1]:=calc[stLength-1]+calc[stLength]; dec(stLength) end;
    '*': begin calc[stLength-1]:=calc[stLength-1]*calc[stLength]; dec(stLength) end;
  end;
  
  ComputeRPN:=calc[1]
end;

procedure ComputeAll(var f: text);

var
  res: integer;
  math: string;
  
begin
  reset(f);
  
  while not EoF(f) do begin
	  readln(f,math);
	  math:=ToRPN(math);
	  writeln(math,'=',ComputeRPN(math));
	end

end;


var
  f: text;

begin
  assign(f,'task3.txt');
  ComputeAll(f);
end.