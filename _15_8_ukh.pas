procedure Min(var F:TPricelist; var Price:Tprice);
var 
  c: Tprice;
begin
  Reset(f);
  if EOF(f) then begin
   Price.rub:=0;
   Price.kop:=0;    
  end;
  else read(f,Price);
    while not EoF(f) do begin
    read(f,c);
    if (c.rub<Price.rub)or((c.rub=Price.rub) and (c.kop<Price.kop)) then
      Price:=c;
  end;
  Close(f);
end;