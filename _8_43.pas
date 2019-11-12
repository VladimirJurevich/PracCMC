program _8_43;

const
  n=9;

var 
  cons: array[1..n] of 0..9;
  i,j,buff,sigdig: byte;
  dig,tens: longword;
  
begin
  read(dig);
  tens:=1;
  sigdig:=1;
  for i:=1 to n do begin
    if dig div 10 > 0 then inc(sigdig);
    cons[i]:= dig mod 10;
    dig := dig div 10;
  end;
  dig:=0;
  
  for i:=1 to sigdig-1 do
    for j:=1 to sigdig-i do
      if cons[j]>cons[j+1] then begin
        buff:=cons[j];
        cons[j]:=cons[j+1];
        cons[j+1]:=buff
      end;
  
  for i:=1 to sigdig do begin
    dig:= dig+cons[i]*tens;
    tens:=tens*10;
  end;
  write(dig);
end.