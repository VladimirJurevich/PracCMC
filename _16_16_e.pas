procedure delete(var x:Ttext;i:integer);
  
begin
  
  if (i<=n) and (i>0) and (x[i]<>nil) then begin
    dispose(x[i]);
    while (i<n) and (x[i]<>nil) do begin
      x[i]:=x[i+1];
      inc(i)
    end;
    x[n]:=nil  
  end;
end;

