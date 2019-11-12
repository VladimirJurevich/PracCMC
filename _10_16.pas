program _10_16_b;

const
     n=50;
     m=15;
var
    words: array[1..n] of string;
    str: string;
    i,j,k: word;
    flag: boolean;
    
begin
    setlength(str,800);
    readln(str);
    j:=1;

    
    for i:=1 to length(str) do
        if (str[i]<>',') AND (str[i]<>'.') then words[j]:=words[j]+str[i]
        else inc(j);


    for i:=1 to j-1 do begin
        flag:=true;
        for k:=1 to j-1 do
        if (i>k) and (words[i]<=words[k]) OR (i<k) and (words[i]>=words[k]) then flag:=false;
        if flag then write(words[i]+' ')
        end;

end.