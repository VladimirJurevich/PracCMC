program _4_12_zh;

var 
	H, M, S, T: longint;
	h1,m1,s1: longint;
	
begin
	read(H);
	read(M);
	read(S);
	read(T);
	
	if ((H>=0) AND (H<=23) AND (M>=0) AND (M<=59) AND (S>=0) AND (S<=59) AND (T>=0)) then
	begin
		s1:= (S+T) mod 60;
		T := (S+T) div 60;
		m1 := (M+T) mod 60;
		T := (M+T) div 60; 
		h1 := (H+T) mod 24;
		write (h1,' ',m1,' ',s1)
	end
	else write('Error');
end.