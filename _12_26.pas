program _12_26;

function ComputeInput: integer;

var
  d: char;
  left, right: integer;
  
begin
  read(d);
  
  case d of
    '0'..'9': ComputeInput:=ord(d)-ord('0');
    'M','m': begin
      left:= ComputeInput();
      right:= ComputeInput();
      if (d='m') and (left<right) or (d='M') and (right<left) then ComputeInput:= left
      else ComputeInput:= right;
    end;
    else ComputeInput:=ComputeInput();
  end;  
end;

begin
write(ComputeInput);
end.