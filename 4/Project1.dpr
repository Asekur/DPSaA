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
      writeln ('Элемент ',currentNode^.data,' повторяется в дереве ',currentNode^.counter,' раз');
    end;
  TreeWalk(currentNode^.left);
  TreeWalk(currentNode^.right);
end;

begin
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);
  repeat
    writeln ('Введите количество элементов массива:');
    readln(n);
    if n>1 then
    begin
      writeln ('Введите элементы массива:');
      for i := 1 to n do
      begin
        readln(x);
        Add(tree, x);
      end;
      TreeWalk(tree);
      if kolvo = 0 then
        writeln ('В дереве нет повторяющихся элементов');
    end
    else
      writeln ('В массиве менее двух элементов');
    writeln;
  until n>1;
  readln;
end.

