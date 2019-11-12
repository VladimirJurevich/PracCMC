program _5_7_d;

var
  max, current, count: integer;

begin
  read(max);
  current := max;
  count := 0;
  while current <> 0 do
  begin
    if current > max then
    begin
      count := 1;
      max := current;
    end
    else if current = max then
      count := count+1;
    read(current)
  end;
  write(count);
  read()
end.
