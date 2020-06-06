program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

type
  ttree = ^ptree;
  ptree = record
    data: LongInt;
    counter: longint;
    left: ttree;
    right: ttree;
  end;

var
  n, x, i: LongInt;
  tree: ttree;
  kolvo: integer = 0;

procedure add(var node: ttree; data: LongInt);
begin
  if (node = nil) then
  begin
    New(node);
    node^.data := data;
    node^.counter := 1;
    node^.left := nil;
    node^.right := nil;
  end
  else
  begin
    if (data = node^.data) then
      inc(node^.counter)
    else
    if (data < node^.data) then
      add(node^.left, data)
      else add(node^.right, data);
  end;
end;

procedure TreeWalk (currentNode: ttree);
begin
  if (currentNode = nil) then
    Exit;
  if (currentNode^.counter <> 1) then
    begin
      inc (kolvo);
      writeln ('������� ',currentNode^.data,' ����������� � ������ ',currentNode^.counter,' ���');
    end;
  TreeWalk(currentNode^.left);
  TreeWalk(currentNode^.right);
end;

begin
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);
  repeat
    writeln ('������� ���������� ��������� �������:');
    readln(n);
    if n>1 then
    begin
      writeln ('������� �������� �������:');
      for i := 1 to n do
      begin
        readln(x);
        Add(tree, x);
      end;
      TreeWalk(tree);
      if kolvo = 0 then
        writeln ('� ������ ��� ������������� ���������');
    end
    else
      writeln ('� ������� ����� ���� ���������');
    writeln;
  until n>1;
  readln;
end.

