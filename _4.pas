program _4;

const
  n=7; m=9;

procedure ChangeState(var di,dj:integer); //rigtht angle clockwise rotation

begin
  if (di=1) and (dj=0) then begin di:=0; dj:=1 end        //rigth to down
  else if (di=0) and (dj=1) then begin di:=-1; dj:=0 end  //down to left
  else if (di=-1) and (dj=0) then begin di:=0; dj:=-1 end //left to up
  else begin di:=1; dj:=0 end                             //up to right
end;
  
var
  spiral: array[1..n,1..m] of integer;
  i, j, di, dj, ttl: integer;
  
begin
  for i:=1 to n do for j:=1 to m do spiral[i,j]:=1337;
  i:=1; j:=1;
  di:=1; dj:=0; //condition#1
  
  for ttl:=0 to n*m-1 do begin
    spiral[i,j]:=ttl;
    if (i+di<1) OR (i+di>n) OR (j+dj<1) OR (j+dj>m) then ChangeState(di,dj)
    else if (spiral[i+di,j+dj]<>1337) then ChangeState(di,dj); //double if for preventing OutOfBorders
    i:=i+di; j:=j+dj;
  end;
  
  for j:=1 to m do begin 
    for i:=1 to n do begin 
      if spiral[i,j]<10 then write('0',spiral[i,j])
      else write(spiral[i,j]);
      if i<n then
        if abs(spiral[i,j]-spiral[i+1,j])=1 then write('-')
        else write(' ');
    end;
    writeln();
    
    if j<m then
      for i:=1 to n do
        if abs(spiral[i,j]-spiral[i,j+1])=1 then write(' | ')
        else write('   ');
    writeln();
  end;
end.
  