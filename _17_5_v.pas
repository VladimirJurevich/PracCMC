program _17_5_b;
type
    FC = file of char;
    Stack = ^element;
    Element = record
        elm: char;
        pos: integer;
        nxt: stack
    end;

procedure push(var head: stack; ch: char; pos: integer);
var 
    temp:stack;
begin
        temp:=head;
        new(head);
        head^.nxt:=temp;
        head^.elm:=ch;
        head^.pos:=pos
end;

function pop(var head: stack;var ch:char; var pos:integer):Boolean;
var 
    temp:stack;
begin
    if head=nil then pop:=false
    else begin
        ch:=head^.elm;
        pos:=head^.pos;
        temp:=head;
        head:=head^.nxt;
        dispose(temp);
        pop:=true end
end;

var
    input: FC;
    brkStack, allStack,reordStack: stack;
    counter, tPos: integer;
    curChar,tChar: char;
begin
    assign(input,'input175.txt');
    reset(input);
    counter:=0; tPos:=-1337;
    while not EoF(input) do begin
        inc(counter);
        read(input,curChar);
        push(allStack,curChar,counter)
    end;

    while Pop(allStack, curchar, counter) do begin
        if curChar=')' then push(brkStack,curChar,counter)
        else if curChar='(' then 
            if not Pop(brkStack,tChar,tPos) then begin write('Wrong amount of brackets.'); exit end
            else begin
                push(reordStack,'1',tPos);
                push(reordStack,'4',counter) end
    end;
    if Pop(brkStack,curchar,tPos) then write('Wrong amount of brackets.')
    else if tPos=-1337 then Write('I find your lack of faith disturbing.')
    else while Pop(reordStack,curchar,counter) do begin
        write(counter,',');
        Pop(reordStack,curchar,counter);
        write(counter,'; ')
    end
end.