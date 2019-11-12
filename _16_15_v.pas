function same(var x:Tarray):Boolean;

var
  i,j:Integer;
  
begin
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if x[i]^=x[j]^ then begin same:= true; exit end;
  same:=false;
end;

