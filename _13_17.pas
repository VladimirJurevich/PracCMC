procedure Reduce(var c:Trational);

var
  n, d: integer;
begin
  n:= abs(c.num);
  d:= c.den;
  
  if (n*d)<>0 then begin 
    repeat
      if n > d then n := n mod d
      else d := d mod n;
    until (n = 0) or (d = 0);
  
    c.num:= c.num div (n+d);
    c.den:= c.den div (n+d)
  end
end;