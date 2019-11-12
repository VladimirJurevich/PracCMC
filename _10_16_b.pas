program _10_16_b;

const
     n=50;
     m=15;
     length=n*(m+1);     
     
type
    longstring= packed array[1..length] of char;
var
    words: array[1..n] of string;
    str: longstring;
    i,j,k: word;
    flag: boolean;
    
begin
    j:=1; i:=0;
        
    repeat
        inc(i);
        read(str[i]);
        if (str[i]<>',') AND (str[i]<>'.') then words[j]:=words[j]+str[i]
        else inc(j)
    until str[i]='.';

    for i:=1 to j-1 do begin
        flag:=true;
        for k:=1 to j-1 do
        if (i>k) and (words[i]<=words[k]) OR (i<k) and (words[i]>=words[k]) then flag:=false;
        if flag then write(words[i]+' ')
        end;

end.