program _8_29_e;

const
  n=25;
  shifts=2;
  
type
  RealSequence=array[1..n] of real;

var
  seq: RealSequence;
  i,j : byte;
  
begin
  for i:=1 to n do read(seq[i]);
  
  for j:=1 to shifts do
    for i:=1 to n-1 do
    begin
      seq[i]:=seq[i+1]+seq[i];   //for real numbers using additional variable
      seq[i+1]:=seq[i]-seq[i+1]; //is more suitable as the summ of large and small
      seq[i]:=seq[i]-seq[i+1];   //numbers can be not as percise as we wish it to
    end;
     
  for i:=1 to n do write(seq[i],' ');
end. 

{not sure if this is legit
procedure EasyWay();   

var
  seq: realSequence;
  i: byte;
  
begin  
  read(seq[n-1]);
  read(seq[n]);
  for i:=1 to n-2 do read(seq[i]);
  
  for i:=1 to n do write(seq[i],' ');
end;
}