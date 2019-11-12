procedure Deleteemptylines(var F,G:text);

var
  c:char;
  
begin 
  reset(f); rewrite(g);
  
  while not EoF(f) do begin
    if EoLn(f) then readln(f,c)
    else begin 
      while not EoLn(f) do begin
        read(f,c);
        write(g,c);
      end;
    writeln(g,'');
    end;
  end;
    
  close(f); close(g);
end;