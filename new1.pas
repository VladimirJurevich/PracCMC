program one;
var
h, m, s, t: integer;
procedure IncTime(var h,m,s: integer; const t: integer);

begin
	s := s+t;
	m := m+s div 60;
	s := s mod 60;
	h := (h+m div 60) mod 24;
	m := m mod 60
end;

begin
	read(h,m,s,t);
	if (h>=24)or(m>59)or(s>59) then writeln('error');
	IncTime(h, m, s, t);
	writeln(h,' ',m,' ',s)
end.