program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

Type
  pt=^node;
  node=record
    data: integer; {»нформационное поле}
    left,right: pt; {”казатели на левого и правого потомков}
    level: integer;
  end;
  Mas = array[1..100] of integer;

var
  y, i, n, sum1, sum2: integer;
  x: pt;
  A: Mas;
  str: string;


Procedure AddToTree(var head:pt; key,level:integer);
begin
  if  head=nil  then
  begin
    new(head);
    head^.data:=key;
    head^.left:=nil;
    head^.right:=nil;
    head^.level:=level;
  end;
  if head^.data<key then
    AddToTree(head^.right,key,level+1);
  if head^.data>key then
    AddToTree(head^.left,key,level+1);
end;

Procedure EnterTree(var head:pt);
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
    end;
end;

Procedure prym_print(var x:pt;var sum:integer);
Begin
  if x<> nil then
  Begin
    prym_print(x^.left,sum);
    sum:=sum+x^.data;
    prym_print(x^.right,sum);
  End
  else write ('');
End;

Procedure prym_print_max(var x:pt);
Begin
  if x<> nil then
  Begin
    write ('(',x^.data,') ');
    prym_print_max(x^.left);
    prym_print_max(x^.right);
  End
  else write ('');
End;

procedure PrintTree(Node: pt; Tab: string);
begin
  if Node <> nil then
  begin
    writeln(Tab, Node^.data);
    if Node^.right <> nil then
      PrintTree(Node^.right, Tab + '  ');
    if Node^.left <> nil then
      PrintTree(Node^.left, Tab + '  ');
    end;
  end;

begin
  SetConsoleCP(1251);
  SetConsoleOutPutCP(1251);
  writeln('¬ведите дерево (закончите ввод нажатием "Enter"):');
  x:= nil;
  EnterTree (x);
  writeln;
  writeln('»сходное дерево:');
  PrintTree(x, ' ');
  writeln;

  sum1:= 0;
  prym_print (x^.left,sum1);

  sum2:=0;
  prym_print(x^.right,sum2);

  if sum1>sum2 then
  begin
    writeln ('Ћевое поддерево имеет больший вес, равный ',sum1+x^.data);
    writeln ('Ёлементы этого поддерева: ');
    write ('(',x^.data,') ');
    prym_print_max(x^.left);
  end
  else
    if sum1<sum2 then
    begin
      writeln ('ѕравое поддерево имеет больший вес, равный ',sum2+x^.data);
      writeln ('Ёлементы этого поддерева: ');
      write ('(',x^.data,') ');
      prym_print_max(x^.right);
    end
    else
      begin
        writeln ('¬еса левого и правого поддерева равны: ',sum1+x^.data);
        writeln ('Ёлементы левого поддерева: ');
        write ('(',x^.data,') ');
        prym_print_max(x^.left);
        writeln;
        writeln ('Ёлементы правого поддерева: ');
        write ('(',x^.data,') ');
        prym_print_max(x^.right);
      end;

  readln;
end.

