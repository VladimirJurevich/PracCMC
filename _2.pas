program _2;

function Eq(var f: text): boolean;

var
   pred, current: char;
   j: integer;
   x: set of char;
   flag: boolean;

begin
   reset(f);
   x:=[];
   flag:=false;
   
   while not EoF(f) do begin
       j:=0;
       while not EoLn(f) do begin
             pred:=current;
             read(f,current);
             inc(j);
       end;
       if j>1 then begin
          if pred in x then flag:=true;
          Include(x,pred);
       end;
       readln(f);
   end;
   
   close(f);
   eq:=flag
end;

var
   f1: text;

begin
   assign(f1,'1.txt');
   write(eq(f1));
   assign(f1,'2.txt');
   write(eq(f1));
   assign(f1,'3.txt');
   write(eq(f1));
end.
   