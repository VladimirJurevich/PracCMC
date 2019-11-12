program _8_39;

const
  n=7;

var
  v1 :array[1..n] of 1..n+1;
  left,right,mid :byte;
  flag: boolean;
  
begin
  left:=0;
  flag:=true;
  for mid:=1 to n do
  begin
    read(v1[mid]);
    if left>=v1[mid] then flag:=false;
    left := v1[mid];
  end;
  left:=1; right:= n+1; 
  
  repeat
    mid := (left+right) div 2;
    if mid < v1[mid] then right:= mid
    else left:=mid+1;
  until left=right;
  
  if flag then write(right)
  else write('Error');
end. 
