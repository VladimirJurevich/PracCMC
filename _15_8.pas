procedure Min(var F:TPricelist; var Price:Tprice);

var
  readPrice: Tprice;
begin
  Reset(f);
  if EOF(f) then begin
   Price.rub:=0;
   Price.kop:=0;    
  end
  else read(f,Price);
    
  while not EoF(f) do begin
    read(f,readPrice);
    if (100*readPrice.rub+readPrice.kop)<(100*Price.rub+Price.kop) then
      Price:=readPrice
  end;
  
  Close(f)
end;