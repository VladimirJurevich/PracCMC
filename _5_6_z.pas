program _5_6_z;

var
  k, i : byte;
  x : real;

begin
  read(x);
  x := abs(x)-trunc(abs(x));
  k := 0;
  for i := 1 to 5 do
  begin
    x := x*10;
    if (trunc(x) mod 10) = 8 then 
      inc(k);
  end;
  write(k);
  read()
end.
