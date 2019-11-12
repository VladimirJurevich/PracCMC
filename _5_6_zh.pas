program _5_6_zh;

var
  d: word;

begin
  read(d);
  while (d > 10) do
    d := trunc (d/10);
  write(d);
  read()
end.
