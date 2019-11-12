program _7_29;

var
   d, m, y :integer;

begin
read(d); read(m); read(y);
if (y>1599)AND(y<2101)AND(d>0) then
  case m of
    1,3,5,7,8,10,12: write(d<32);
    2: write((d<29)OR((d=29) AND ((y mod 4) = 0) AND ((y mod 100 <> 0) OR (y mod 400 = 0))));
    4,6,9,11: write(d<31);
    else write(false)
  end
else write(false)
end.
