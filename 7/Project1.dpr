program TreeLevel;

{$APPTYPE CONSOLE}
uses
  Windows;

type
  TNodePtr = ^TNode;
	TNode = record
		Data: integer;
		LeftChild, RightChild: TNodePtr;
    level: integer;
	end;

var
  Head: TNodePtr;
  lvlInput, t: Integer;


Procedure AddToTree(var head: TNodePtr; key,level:integer);
begin
  if  head=nil  then
  begin
    new(head);
    head^.Data:=key;
    head^.LeftChild:=nil;
    head^.RightChild:=nil;
    head^.level:=level;
  end;
  if head^.Data < key then
    AddToTree(head^.RightChild,key,level+1);
  if head^.Data > key then
    AddToTree(head^.LeftChild,key,level+1);
end;

Procedure EnterTree(var head: TNodePtr);
var
  c,key:integer;
  s:string;
begin
  readln(s);
  val(s,key,c);
  while c = 0 do
  begin
    AddToTree(head,key,0);
    readln(s);
    val(s,key,c);
    inc(t);
  end;
end;

procedure PrintTree(Node: TNodePtr; Tab: string);
begin
  if Node <> nil then
  begin
    writeln(Tab, Node^.Data);
    if Node^.RightChild <> nil then
      PrintTree(Node^.RightChild, Tab + '  ');
    if Node^.LeftChild <> nil then
      PrintTree(Node^.LeftChild, Tab + '  ');
    end;
  end;


function CountSiblings(Head: TNodePtr; OnLevel: integer): integer;
var
  Count: integer;
procedure CheckNode(node: TNodePtr; level: integer; var siblCount: integer);
begin
  if (Node <> nil) then
    if level = OnLevel then
      siblCount := siblCount + 1
      else
      begin
        CheckNode(node^.LeftChild, level + 1, siblCount);
        CheckNode(node^.RightChild, level + 1, siblCount);
      end;
  end;

begin
  Count := 0;
  CheckNode(Head, 0, Count);
  Result := Count;
end;

begin
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);
  t:= 0;
  writeln ('Введите дерево:');
  EnterTree(Head);
  writeln;
  writeln ('Полученное дерево:');
  PrintTree(Head, '');
  writeln;
  Write('Введите уровень: ');
  Readln(lvlInput);
  writeln;
  Writeln('Количество элементов на заданном уровне: ', CountSiblings(Head, lvlInput));
  readln;
end.

