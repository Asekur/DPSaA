program Trees6;

{$APPTYPE CONSOLE}

uses
  Windows,
  SysUtils;
type
  Ttree=^rTree;
  rTree=record
    key:integer;
    left,right:Ttree;
    lTag,rTag:boolean;
    level:integer;
  end;

var y,z: Ttree;
var
  head, root:Ttree;
  k, t: Integer;

Procedure AddToTree(var head:Ttree; key,level:integer);
begin
  if  head=nil  then
  begin
    new(head);
    head^.key:=key;
    head^.left:=nil;
    head^.right:=nil;
    head^.lTag:=true;
    head^.rTag:=true;
    head^.level:=level;
  end;
  if head^.key<key then
    AddToTree(head^.right,key,level+1);
  if head^.key>key then
    AddToTree(head^.left,key,level+1);
end;


Procedure SymmetricBypass(head:Ttree);
begin
  if head<>nil then
  begin
    SymmetricBypass(head^.left);
    write(head^.key,' ');
    SymmetricBypass(head^.right);
  end;
end;

Procedure EnterTree(var head:Ttree);
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


  procedure sym (var x: ttree);
  begin
    if x<>nil then
    begin
    sym(x^.left);
    writeln (x^.key:(x^.level+3), '(', x^.level, ')');
    sym(x^.right);
  end;
  end;

procedure sym_print (var x: Ttree);

procedure right_sew  (var p: ttree);
begin
  if y <> nil then
  begin
    if y^.right=nil then
    begin
      y^.rtag:=False;
      y^.right:=p;
      write(y^.key, '->');
      write(p^.key, ' ');
    end
  else
      y^.rtag:=true;
  end;
  y:=p;
end;
begin
  if (x<>nil) and (x<>y) and (k <= t) then
  begin
    inc(k) ;
    sym_print(x^.left);
    right_sew(x);
    sym_print(x^.right);
  end;

  if x<>nil then
    if (x^.right = nil) and (k = t + 1)  then
    begin
      x^.rTag := false;
      x^.right := head;
      write(y^.key, '->');
      write('head');
//      write(root^.key, ' ');
    end;

end;

procedure obhod_proshiv (var x: Ttree);
begin
  while x <> head do
  begin
    while x^.left <> nil do
      x:= x^.left;
    write (x^.key,' ');
    while not x^.rTag do
    begin
      x:= x^.right;
      if x = head then
        exit;
      write (x^.key,' ');
    end;
    x:= x^.right;
  end;
end;

procedure samyi_pravyi (var x: Ttree);
  var b: boolean;
  begin
    repeat
      b:=False;
      if (x^.right<>nil) and (x^.rTag<>False) then
        x:=x^.right else
        if (x^.left<>nil)then
          x:=x^.right
          else
            b:=true;
    until  b;
    x^.right:=head;
    x^.rtag:=false;
  end;



begin
  SetConsoleCP(1251);
  SetConsoleOutPutCP(1251);
  writeln('������� �������� ������:');
  root:=nil;
  k := 1;
  t := 0;
  EnterTree(root);
  new (head);
  head^.left:=root;
  head^.right:=head;

  writeln('��������:');
  writeln;
  y:=nil;
  sym(root);
  writeln;
  sym_print (root);
  writeln;
  writeln;

  writeln('����� ������:');
  z:=root;
  samyi_pravyi (z);
  obhod_proshiv (head^.left);

  readln;
end.
