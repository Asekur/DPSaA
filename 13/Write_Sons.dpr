program DuplicateaBin;
// Построить бинарное дерево.
// Вывести количество узлов, у которых (3 числа)
// а) только левый сын
// б) только правый сын
// в) оба сына

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

type
	PNode = ^TNode;
  TNode = record
  	key: integer;
    left, right: PNode;
    level: integer;
  end;

var
	root: PNode;
  t: integer;

function Find(key: integer; root: PNode; var node: PNode): boolean;
var
	P, Q: PNode;
  found: boolean;
begin
	found := false;
	Q:= nil;
  P:= root;
  if (root <> nil) then
		repeat
    	Q:= P;
      if (key = P^.key) then
      	found := true
      else
				if (key < P^.key) then
	      	P:= P^.left
        else
        	P:= P^.right;
    until found or (P = nil);

  node := Q;
  result := found;
end; {Find}

Procedure AddToTree(var head:PNode; key,level:integer);
begin
  if  head=nil  then
  begin
    new(head);
    head^.key:=key;
    head^.left:=nil;
    head^.right:=nil;
    head^.level:=level;
  end;
  if head^.key<key then
    AddToTree(head^.right,key,level+1);
  if head^.key>key then
    AddToTree(head^.left,key,level+1);
end;

Procedure EnterTree(var head:PNode);
var
  c,key:integer;
  s:string;
begin
 readln(s);
  val(s,key,c);
  while c=0 do
    begin
      AddToTree(head,key,0);
      readln(s);
      val(s,key,c);
      inc(t);
    end;
end;

//**************************************
type
  TProc = procedure(p: PNode);
var
	process: TProc;

procedure WriteNode(p: PNode);
begin
  write(p^.key, ' ');
end; {WriteNode}

var
	l, r, b: integer;

procedure GetSonsNumber(p: PNode);
begin
	if (p^.left <> nil) then
  	if (p^.right <> nil) then
    	inc(b)
    else
    	inc(l)
  else
  	if (p^.right <> nil) then
    	inc(r);
end; {GetSonsNumber}
//**************************************

procedure RAB(root: PNode);
begin		// прямой обход
	if (root = nil) then
  	exit;
	process(root);
  RAB(root^.left);
  RAB(root^.right);
end; {RAB}

procedure GetSonsNumberRABTree(root: PNode);
begin
	l := 0;
  r := 0;
  b := 0;
	process := GetSonsNumber;
  RAB(root);
end; {GetSonsNumberRABTree}

procedure PrintTree(Node: PNode; Tab: string);
begin
  if Node <> nil then
  begin
    writeln(Tab, Node^.key);
    if Node^.right <> nil then
      PrintTree(Node^.right, Tab + '  ');
    if Node^.left <> nil then
      PrintTree(Node^.left, Tab + '  ');
    end;
  end;

begin
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);

  root := nil;
  t:= 0;
  writeln ('Введите элементы дерева');
  EnterTree(root);

  GetSonsNumberRABTree(root);
  writeln;
  writeln ('Полученное дерево');
  PrintTree(root,'  ');
  writeln;

  writeln('Только левые сыновья: ', l);
  writeln('Только правые сыновья: ', r);
  writeln('Оба сына: ', b);

  readln;
  readln;
end.
