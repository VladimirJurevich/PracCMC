program _6_35;

var
	res,neg, num :integer;
	expr: char;
	
begin
  neg:= 1;
  res:= 0;
  read(expr);
  while True do
  begin
    if expr = '-' then 
    begin
      res:=res+neg*num;
      num:=0;
      neg:=-1;
    end
    
    else if expr = '+' then 
    begin
      res:=res+neg*num;
      neg:=1;
      num:=0;
    end
    
    else if expr = '.' then
    begin
      res:=res+neg*num;
      break
    end
    
    else num:= num*10 + ord(expr) - ord('0');
    read(expr);
  end;
  write(res);
end.