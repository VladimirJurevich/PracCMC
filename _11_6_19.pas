program _11_6_19;

procedure ConstructWord(var f: file of char; var wrd: string);

var
  c: char;
  
begin
  if not EoF(f) then begin
    read(f,c);
    if c<>' ' then begin
      wrd:=wrd+c;
      ConstructWord(f,wrd)
    end
  end
end;

procedure RePrint(var f: file of char);

var
  c: char;
  wrd: string;
  
begin
  if not EoF(f) then begin
    read(f,c);
    if c=' ' then RePrint(f)
    else begin
      wrd:=c;
      ConstructWord(f,wrd);
      RePrint(f);
      write(wrd,' ');
    end
  end
end;

var
  str: file of char;
  
begin
  assign(str, 'word.txt');
  reset(str);
  
  RePrint(str);
end.