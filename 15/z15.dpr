program z15;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

type
  pt=^list;
  list=record
    num:integer;
    next:pt;
  end;
const
  mat_size=7;
var
  mat:array [1..mat_size,1..mat_size] of integer;
  head:pt;
  v,i:byte;
  counter: integer;

procedure read_mat;
var
  i,j:byte;
  f:textfile;
begin
  assign(f,'table.txt');
  reset(f);
  for i:=1 to mat_size do
  begin
    for j:=1 to mat_size do
      read(f,mat[i,j]);
    readln(f);
  end;
  close(f);
end;

procedure add(var first:pt;num:integer);
var
  p,pp:pt;
  f:boolean;
begin
  if first=nil then
  begin
    new(first);
    first^.next:=nil;
    first^.num:=num;
  end
  else
  begin
    if num<first^.num then
    begin
      new(p);
      p^.num:=first^.num;
      p^.next:=first^.next;
      first^.num:=num;
      first^.next:=p;
    end
    else
    begin
      p:=first;
      f:=true;
      while (p^.next<>nil) and (f) do
      begin
        if p^.next^.num>num then
        begin
          f:=false;
          new(pp);
          pp^.num:=num;
          pp^.next:=p^.next;
          p^.next:=pp;
        end;
        p:=p^.next;
      end;
      if f then
      begin
        new(p^.next);
        p^.next^.num:=num;
        p^.next^.next:=nil;
      end;
    end;
  end;
end;

procedure write_list(first:pt);
begin
  if first <> nil then
  begin
    writeln ('Расстояния до вершин отсортированные');
    while first<>nil do
    begin
      write(' ',first^.num);
      first:=first^.next;
    end;
  end;
end;

begin
  SetConsoleCP(1251);
  SetConsoleOutPutCP(1251);
  head:=nil;
  read_mat;
  repeat
    writeln('Введите вершину');
    readln(v);
    if not(v in [1..mat_size]) then
    begin
      writeln ('Такой вершины нет');
      writeln;
    end;
  until v in [1..mat_size];

  counter:= 0;
  for i:= 1 to mat_size do
    if mat[v,i] <> 0 then
    begin
      inc(counter);
      if counter = 1 then
       writeln('Смежные вершины:');
      write(' ',i);
      add(head,mat[v,i]);
    end;
  if counter = 0 then
    writeln ('У вершины нет смежных');
  writeln;
  write_list(head);

  readln;
end.
