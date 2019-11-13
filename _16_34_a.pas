procedure Merge(l1,l2:Tlist;var L:Tlist);
var
    D,pr:Tlist;
    F:TNode;
begin
    while(l1=nil) and(l2=nil) do exit;
    new(L);
    d:=l;
    pr:=d;
    while (l1<>nil) and (l2<>nil) do begin
        if l1^.data<l2^.data then begin 
            d^.data:=l1^.data;
            l1:=l1^.next end
        else begin
            d^.data:=l2^.data;
            l2:=l2^.next end;
        new(d^.next);
        pr:=d;
        d:=d^.next;
    end;
    while(l1<>l2) do begin
        if l1=nil then begin
            d^.data:=l2^.data;
            l2:=l2^.next end
        else begin 
            D^.data:=l1^.data;
            l1:=l1^.next end;
        new(d^.next);
        pr:=d;
        d:=d^.next;
    end;
    dispose(d);
    pr^.next:=nil;
end;