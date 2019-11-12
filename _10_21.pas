program _10_21;

type
  BoardFile='a'..'h';
  BoardRank='1'..'8';
    
var
  board :array[BoardFile,BoardRank] of boolean;
  qFile,f :BoardFile;
  qRank,r :BoardRank;  

begin
  read(qFile,qRank);
  
  for r:='8' downto '1' do begin
    for f:='a' to 'h' do begin
      board[f,r]:= (f=qFile) OR (r=qRank) XOR (abs(ord(r)-ord(qRank))=abs(ord(f)-ord(qFile)));
      if board[f,r] then write('*')
      else write('0');
    end;
    writeln();
  end;
end.    