//program _15_16;

var
  f,buff: text;
  res, counter, line, toPrint: integer;
  c:char;

begin
  assign(f,'1.txt');
  reset(f);
  res:=-1337;
  line:=1;
  
  while (not EoF(f)) AND (res<>0) do begin
    counter:=0;
    while not EoLn(f) do begin
      inc(counter);
      read(f,c)
    end;
    
    if (res=-1337) or (counter<res) then begin
      res:=counter;
      toPrint:=line;
    end;
    
    inc(line);
    readln(f);
  end;
  
  if res>0 then begin
    reset(f);
    for res:=2 to toPrint do readln(f);
    while not EoLn(f) do begin
      read(f,c);
      write(c)
    end
  end;
  
  Close(f);
end.