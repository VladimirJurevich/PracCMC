const n=70;

var
  a:array[1..n]of real;
  i,j:integer;
  t:real;
  
begin
  for i:=1 to n do read(a[i]);
  for i:=1 to n do
    for j:=i to n-1 do
      if (a[j]>=0)and(a[j+1]<0)then 
      begin
      t:=a[j];
      a[j]:=a[j+1];
      a[j+1]:=t;
      end;
      
for i:=1 to n do write(a[i],' ');
readln;
end.