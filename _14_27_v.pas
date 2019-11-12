program _14_27_v;

type
  SmallLetters = set of 'a'..'z';
  
var
  lettersEnc, lettersTwice: SmallLetters;
  c: Char;
  CorrectInput: Boolean; 
begin
  lettersEnc:= []; lettersTwice:= [];
  CorrectInput:= true;
  read(c);
  
  while CorrectInput AND (c<>'.') do begin
    if (c<'a') OR (c>'z') then CorrectInput:= false
    else if c in lettersEnc then Include(lettersTwice,c)
    else Include(lettersEnc, c);    
    read(c);
  end;
  
  if CorrectInput then begin
    lettersEnc:= lettersEnc-lettersTwice;
    for c:='a' to 'z' do
      if (c in lettersEnc) then write(c)
  end
  else write('Error')    
end.