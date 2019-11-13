procedure Move_First_to_End(var L:Tlist);
var B:Tlist;
begin
  if L=nil then exit; 
  B:=L;
  while b^.next<>nil do b:=b^.next;
  b^.next:=L;
  l:=L^.next;
  b^.next^.next:=nil;
end;