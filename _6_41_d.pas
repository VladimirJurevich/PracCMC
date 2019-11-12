program _6_41_d;

var
  num: longword;
  j: byte;
  sit: char;
  empty :boolean;
  
begin
num:=0;
j:=0;
empty := true;

while sit <> '.' do
  begin
    read(sit);
    if (sit>='0') and (sit<='9') then
      begin
      num:= num+ord(sit)-ord('0');
      empty:=false;
      end
    else if (sit>='A') and (sit<='F') then
      begin
      num:= num+ord(sit)-ord('A')+10;
      empty:=false;
      end
    else if (sit = '.') AND (num mod 5 = 0) AND not empty then write('true')
   else
   begin
     write('false');
     break
   end;
  end;
end.