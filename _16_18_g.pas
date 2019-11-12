function max(L:Tlist):real;
var
  maxt:real;
  
begin
  maxt:=l^.data;
  l:=l^.next;
  while l<>nil do begin
    if l^.data>maxt then maxt:=l^.data;
    l:=l^.next;
  end;  
  max:=maxt;
end;

