program _6_31;

var
	N, i, j , dit, trit: integer;
	
begin
	read(N);
	if (N<0) then write(-1)
	else for i:=0 to N do
	begin
		j:=0;
		trit:=0;
		dit:= i;
		while dit<>0 do
		begin
			trit:= trit + (dit mod 3) * round(exp(j*ln(10)));
			dit:= dit div 3;
			inc(j);
		end;
		write(trit,' ')
	end
end.