function Same(var V:Tarray):Boolean;

var
  ElemIncluded: set of 0..255;
  i: integer;
  
begin
  ElemIncluded:= [];
  
  for i:=1 to N do
    if V[i] in ElemIncluded then begin
      Same:=true; exit
    end
    else Include(ElemIncluded, V[i]);
   
  Same:=false; exit
end;