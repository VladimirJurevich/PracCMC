program _17_5_b;
type
    FC = file of char;
    Stack = ^element;
    Element = record
        pos: integer;
        nxt: stack
    end;

procedure push(var head: stack;pos: integer);
var 
    temp:stack;
begin    
    temp:=head;
    new(head);
    head^.nxt:=temp;
    head^.pos:=pos 
end;

function pop(var head: stack; var pos:integer):Boolean;
var 
    temp:stack;
begin
    if head=nil then pop:=false
    else begin
        pos:=head^.pos;
        temp:=head;
        head:=head^.nxt;
        dispose(temp);
        pop:=true end
end;

var
    input: FC;
    brkStack: stack;
    counter, tPos: integer;
    curChar: char;
begin
    assign(input,'input175.txt');
    reset(input);
    counter:=0; tPos:=-1337;
    while not EoF(input) do begin
        inc(counter);
        read(input,curChar);
        if curChar='(' then push(brkStack,counter)
        else if curChar=')' then 
            if not Pop(brkStack,tPos) then begin write('Wrong amount of brackets.'); exit end
            else write(tPos,',',counter,'; ')
    end;
    if Pop(brkStack,tPos) then write('Wrong amount of brackets.')
    else if tPos=-1337 then Write('I find your lack of faith disturbing.')
end.