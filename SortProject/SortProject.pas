program SortProject;

uses DateUnit;

procedure ShellSort(var d: DateToSort; var n, rearr, compar: integer);

var
  MC: array[1..9] of integer;
  m, i, j: integer;
  buff: Date;

begin
  MC[9] := 1;  MC[8] := 4;  MC[7] := 10;  //Marcin Ciura's gap sequence
  MC[6] := 23; MC[5] := 57; MC[4] := 132; //is believed to be the fastest
  MC[3] := 301; MC[2] := 701; MC[1] := 1750;
  rearr := 0; compar := 0;
  
  for m := 1 to 9 do
  begin
    if MC[m] < n then
      for i := MC[m] to n do
      begin
        buff := d[i];
        j := i;
        while (j > MC[m]) AND DateIsBigger(d[j - MC[m]], buff, compar) do
        begin
          d[j] := d[j - MC[m]];
          j := j - MC[m];
          inc(rearr);
        end;
          d[j] := buff;
      end;
  end;
end;

procedure BinaryInsertionSort(var d: DateToSort; var n, rearr, compar: integer);

var
  i,j,lf,rg,mid: integer;
begin
  compar:=0; rearr:=0;
  for i:=2 to n do begin
    lf:=1; rg:=i;
    
    while lf<rg do begin
      mid:=lf+(rg-lf) div 2;
      if DateIsBigger(d[mid],d[i],compar) then rg:=mid
      else lf:=mid+1;    
    end;
    
    if (i<>lf) then
      Insert(d,i,lf,rearr);
  end;
end;

var
  outputShell, outputBinar: text;
  d: DateToSort;
  n: integer; //actual length
  dataType: array[1..5] of string; //'Inc','Dec','IncDec','Random1','Random2'
  rearrShell, comparShell, rearrBinar, comparBinar: array[1..5] of integer; //vectors of rearrangements and comparissons
  i, j, k: integer;

begin
  dataType[1] := 'Inc'; dataType[2] := 'Dec'; dataType[3] := 'IncDec';
  dataType[4] := 'Random1'; dataType[5] := 'Random2';
    
  n := 1;
  CreateDir(testDirName);
  GenerateTestData();
  assign(outputShell, 'OutputShell.txt'); rewrite(outputShell);
  assign(outputBinar, 'OutputBinar.txt'); rewrite(outputBinar);
  writeln(outputShell,'                             	Shell Sort');
  writeln(outputShell,'----------------------------------------------------------------------');
  writeln(outputShell,'|  n  |  Parameter   |               Sequence             |  Average |');
  writeln(outputShell,'|     |              |    Inc    Dec   InDe   Rnd1   Rnd2 |    value |');
  writeln(outputShell,'----------------------------------------------------------------------');
  writeln(outputBinar,'                       	Binary Incertion Sort');
  writeln(outputBinar,'----------------------------------------------------------------------');
  writeln(outputBinar,'|  n  |  Parameter   |               Sequence             |  Average |');
  writeln(outputBinar,'|     |              |    Inc    Dec   InDe   Rnd1   Rnd2 |    value |');
  writeln(outputBinar,'----------------------------------------------------------------------');
  
  
  for i := 1 to 3 do
  begin
    n := n * 10;
    for j := 1 to 5 do
    begin
      DateInput(d, basename + n + dataType[j], n);
      ShellSort(d,n,rearrShell[j],comparShell[j]);
      //DateOutput(outputDirName+'/ShOut'+n+dataType[j]+'.txt',d,n);
      DateInput(d, basename + n + dataType[j], n);
      BinaryInsertionSort(d,n,rearrBinar[j],comparBinar[j]);
      //DateOutput(outputDirName+'/BiOut'+n+dataType[j]+'.txt',d,n);
    end;    
    writeln(outputShell,'|',n:5,'|       Shifts |',rearrShell[1]:7,rearrShell[2]:7,rearrShell[3]:7,rearrShell[4]:7,rearrShell[5]:7,' |', ((rearrShell[1]+rearrShell[2]+rearrShell[3]+rearrShell[4]+rearrShell[5]) div 5):9,' |');
    writeln(outputShell,'|     |  Comparisons |',comparShell[1]:7,comparShell[2]:7,comparShell[3]:7,comparShell[4]:7,comparShell[5]:7,' |', ((comparShell[1]+comparShell[2]+comparShell[3]+comparShell[4]+comparShell[5]) div 5):9,' |');
    writeln(outputShell,'----------------------------------------------------------------------');
    
    writeln(outputBinar,'|',n:5,'|   Insertions |',rearrBinar[1]:7,rearrBinar[2]:7,rearrBinar[3]:7,rearrBinar[4]:7,rearrBinar[5]:7,' |', ((rearrBinar[1]+rearrBinar[2]+rearrBinar[3]+rearrBinar[4]+rearrBinar[5]) div 5):9,' |');
    writeln(outputBinar,'|     |  Comparisons |',comparBinar[1]:7,comparBinar[2]:7,comparBinar[3]:7,comparBinar[4]:7,comparBinar[5]:7,' |', ((comparBinar[1]+comparBinar[2]+comparBinar[3]+comparBinar[4]+comparBinar[5]) div 5):9,' |');
    writeln(outputBinar,'----------------------------------------------------------------------');
 end;
  close(outputShell); close(outputBinar);
end.