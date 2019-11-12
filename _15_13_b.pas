function Arith_progression(var F:Tfile):Boolean;

var
  prev, next, coeff: integer;
  return: boolean;
  
begin
  reset(f);
  if EOF(f) then return:=false
  else begin
    read(f,prev);
    if not EOF(f) then begin
      read(f,next);
      coeff:=next-prev;
      while not EoF(f) and return do begin
        prev:=next;
        read(f,next);
        if next-prev<>coeff then return:=false
      end;
    end;
  end;
  
  Close(f);
  Arith_progression:=return
end;