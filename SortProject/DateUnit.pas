unit DateUnit;

interface

const
  outputDirName='Output/';
  testDirName ='Testdata/';
  baseName = testDirName+'TestData';
  lengthBase = 1;

type
  Date = record
    year: 1..3000;
    month: 1..12;
    day: 1..31;
  end;
  DateToSort = array[1..4000] of Date;

function DateIsBigger(var a, b: date; var compar: integer): Boolean;
procedure DateInput(var d: DateToSort; name: string; n: integer);
procedure GenerateTestData();
procedure Insert(var d: DateToSort; from, whereTo:integer;var rearr:integer);
procedure DateOutput(name:string; var d:DateToSort; n:integer);

implementation  


procedure DateOutput(name:string; var d:DateToSort; n:integer);
var
  i: integer;
  f: text;
begin
  CreateDir(outputDirName);
  assign(f,name);
  rewrite(f);
  for i:=1 to n do writeln(f,d[i].year:4,d[i].month:4,d[i].day:4);
  close(f);
end;

procedure DateInput(var d: DateToSort; name: string; n: integer);

var
  i: integer;
  inp: file of Date;

begin
  assign(inp, name);
  reset(inp);
  
  for i := 1 to n do
    read(inp, d[i]);
  close(inp);
end;


function DateIsBigger(var a, b: date; var compar: integer): Boolean;

begin
  inc(compar);
  DateIsBigger := (a.year > b.year) OR ((a.year = b.year) AND ((a.month > b.month)
                   OR ((a.month = b.month) AND (a.day > b.day))))
end;


procedure Insert(var d: DateToSort; from, whereTo:integer;var rearr:integer);
var
  j: integer;
  temp: Date;
begin
  inc(rearr);
  temp:=d[from];
  for j:=from downto whereTo+1 do d[j]:=d[j-1];
  d[whereTo]:=temp;
end;


procedure GenerateTestData();

var
  toWrite: Date;
  output: file of Date;
  outtext: text;
  i,j,consLength: integer;
  
begin
  consLength:=LengthBase;
  for j:=0 to 2 do begin
    consLength:=conslength*10;
    assign(output,baseName+ConsLength+'Inc');
    rewrite(output);
    assign(outtext,baseName+ConsLength+'Inc.txt');
    rewrite(outtext);
    toWrite.month:=11;
    toWrite.day:=4;
    
    for i:=1 to ConsLength do begin //increasing
      toWrite.year:=i+1500;
      write(output,toWrite);
      writeln(outtext,toWrite.day,'.',toWrite.month,'.',toWrite.year)
    end; 
    
    close(output); close(outtext);
    assign(output,baseName+ConsLength+'Dec');
    rewrite(output);
    assign(outtext,baseName+ConsLength+'Dec.txt');
    rewrite(outtext);
  
    for i:=ConsLength downto 1 do begin //decreasing
      toWrite.year:=i+1336;
      write(output,toWrite);
      writeln(outtext,toWrite.day,'.',toWrite.month,'.',toWrite.year)
    end;
  
    close(output); close(outtext);
    assign(output,baseName+ConsLength+'IncDec');
    rewrite(output);
    assign(outtext,baseName+ConsLength+'IncDec.txt');
    rewrite(outtext);
    
    for i:=1 to ConsLength do begin //decreasing-increasing
      if i mod 2 = 0 then toWrite.year:=i+1634
      else toWrite.year:=3000-2*i;
      write(output,toWrite);
      writeln(outtext,toWrite.day,'.',toWrite.month,'.',toWrite.year)
    end;
    
    close(output); close(outtext);
    assign(output,baseName+ConsLength+'Random1');
    rewrite(output);
    assign(outtext,baseName+ConsLength+'Random1.txt');
    rewrite(outtext);
    Randomize();
  
    for i:=0 to Conslength do begin
      toWrite.year:=Random(1,3000);
      toWrite.month:=Random(1,12);
      toWrite.day:=Random(1,28);
      write(output,toWrite);
      writeln(outtext,toWrite.day,'.',toWrite.month,'.',toWrite.year)
    end; 
    close(output); close(outtext);
    assign(output,baseName+ConsLength+'Random2');
    rewrite(output);
    assign(outtext,baseName+ConsLength+'Random2.txt');
    rewrite(outtext);
  
    for i:=0 to Conslength do begin
      toWrite.year:=Random(1,3000);
      toWrite.month:=Random(1,12);
      toWrite.day:=Random(1,28);
      write(output,toWrite);
      writeln(outtext,toWrite.day,'.',toWrite.month,'.',toWrite.year)
    end;
  
    Close(output); Close(outtext);
  end;
end;
end.