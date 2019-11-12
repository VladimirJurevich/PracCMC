program _6_34;

var
	i, res :integer;
	expr: char;
	
begin
  read(expr);
  res:= ord(expr)-ord('0');
  while expr<>'.' do
  begin
    read(expr);
    if expr = '-' then
    begin
      read(expr);
      res:= res - (ord(expr)-ord('0'));
    end
    else if expr = '+' then
    begin
      read(expr);
      res:= res+ ord(expr)-ord('0');
    end;
  end;
  write(res);
end.