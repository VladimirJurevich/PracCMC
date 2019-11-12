program _12_28;

function Pop(var s: string):char;

var
  c:char;
  
begin
  c:=s[length(s)];
  Delete(s,length(s),1);
  Pop:=c
end;

function GreaterOrder(a,b: char):boolean;
 
begin
  if (b='+') or (b='-') then GreaterOrder:=true
  else if (b='*') or (b='/') then GreaterOrder:=(a='*') or (a='/')
  else GreaterOrder:=true;
end;



function ToRPN(math: string): string; 

var
  res, stack: string;
  i: integer;

begin
	stack:='$';
	
	for i:=1 to length(math) do
		if ('a'<=math[i]) AND ('z'>= math[i]) then res:=res+math[i]		
		else if math[i]='(' then stack:=stack+'('
		else if math[i]=')' then begin
			while stack[length(stack)]<>'(' do 
        res:=res+Pop(stack);
			Pop(stack) end	  
	  else begin
      while not GreaterOrder(math[i],stack[length(stack)]) do res:=res+Pop(stack);
      stack:=stack+math[i];
    end;
		
	
	for i:=1 to length(stack)-1 do res:=res+Pop(stack);
	ToRPN:=res; exit
end;

procedure PrintRPN(var f: text);

var
  math: string;
  
begin
  reset(f);
  
  while not EoF(f) do begin
	  readln(f,math);
	  writeln(ToRPN(math))
	end
end;

var
  f: text;

begin
  assign(f,'task12.txt');
  PrintRPN(f);
end.