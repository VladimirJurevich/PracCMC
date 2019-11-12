program _5_21_v;

var
  last, current, summ, k : word;
  
begin
  read(k);
  last := 0;
  current := 1;
  summ := 0;
  while current <= k do
  begin
    current := current + last;
    last := current - last;
    summ := summ + last
  end;
  write(summ);
  read()
end.
