procedure Lines(var F,G:text);

var
  c: char;
  num: string;
  i: integer;
  
begin 
  reset(f); rewrite(g);
  i:=1;  
  Str(i,num);
  num:=num+' ';
  
  while not EoF(f) do begin
    if length(num)<5 then num:='0'+num    
    else begin
      write(g,num);
      i:=1+i;
      while not EoLn(f) do begin
        read(f,c);
        write(g,c);     
      end;
      writeln(g,'');
      readln(f,c);
      Str(i,num);
      num:=num+' ';
    end;
  end;
    
  close(f); close(g);
end;