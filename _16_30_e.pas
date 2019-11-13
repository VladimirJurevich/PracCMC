function same(l1,l2: Tlist):Boolean;
begin
    if l1=l2 then same:=true
    else if (l2=nil) or (l1=nil) then same:=false
    else if l2^.data=l1^.data then same:=same(l1^.next,l2^.next) 
    else same:=false;
end;