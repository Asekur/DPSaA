program r32423423423;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

type
  PTSetOfTask = ^TSetOfTask;
  TDataOfTask = record
    id:integer;
    end;
  TSetOfTask = record
    next: PTSetOfTask;
    data: TDataOfTask;
    end;

var
  PFirstTask,Psecondtask,buf1,buf2: PTSetOfTask;
  count: integer;
  buf: TDataOfTask;
  i: integer;
  flag: boolean;

procedure AddInTasks(src: TDataOfTask; var base: PTSetOfTask);
var
  buf: PTSetOfTask;
begin
  if (base = nil) then
  begin
    new(base);
    base^.data := src;
    base^.next := nil;
  end
  else
  begin
    buf := PFirsttask;
    while (buf^.next <> nil) do
      buf := buf^.next;
    new(buf^.next);
    buf := buf^.next;
    buf^.data := src;
    buf^.next := nil;
  end;
end;

procedure AddInTask(src: TDataOfTask; var base: PTSetOfTask);
var
  buf: PTSetOfTask;
begin
  if (base = nil) then
  begin
    new(base);
    base^.data := src;
    base^.next := nil;
  end
  else
  begin
    buf := Psecondtask;
    while (buf^.next <> nil) do
      buf := buf^.next;
    new(buf^.next);
    buf := buf^.next;
    buf^.data := src;
    buf^.next := nil;
  end;
end;

procedure AddInSet2(src: TDataOfTask; var base: PTSetOfTask);
var
  buf: PTSetOfTask;
  p0, p: PTSetOfTask;
begin
  if (base = nil) then
  begin
    new(base);
    base^.next := nil;
  end;
  new(p0);
  p0^.next := nil;
  p := base;
  p0^.data := src;
  while (p^.next <> nil) and (p0^.data.id < p^.next^.data.id) do
    p := p^.next;
  p0^.next := p^.next;
  p^.next := p0;
end;

begin
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);
  writeln ('Введите количество элементов в очереди') ;
  readln(count);

  PFirstTask:=nil;
  PSecondTask:=nil;
  writeln ('Введите элементы очереди') ;
  for i := 1 to count do
  begin
    readln(buf.id);
    addintasks(buf,PFirstTask);
  end;

  buf1:= PFirstTask;
  while (buf1<>nil) do
  begin
    addinset2(buf1.data,psecondtask);
    buf1:=buf1^.next;
  end;
  writeln('Отсортированная очередь');
  buf1:=PSecondtask^.next;
  while (buf1<>nil) do
  begin
    write(buf1^.data.id:3);
    buf1:=buf1^.next;
  end;

  writeln;
  writeln('Введите элемент для добавления в очередь');
  readln(buf.id);
  addinset2(buf,psecondtask);
  writeln('Полученная очередь');

  buf1:=PSecondtask^.next;
  while (buf1<>nil) do
  begin
    write(buf1^.data.id:3);
    buf1:=buf1^.next;
  end;
  readln;
end.

