program _8_60;

var
  count: array[0..27] of word;
  amount, i: word;
  
begin
  amount:=0;
  for i:=0 to 27 do count[i]:=0;  
  for i:=0 to 999 do inc(count[(i div 100) + (i mod 10) +(i mod 100-i mod 10) div 10]);  
  for i:=0 to 27 do amount:=amount+count[i]*count[i];  
  write(amount);
end.