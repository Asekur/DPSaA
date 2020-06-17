program OneListFrom;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

Type
  TPList = ^TList;
  TList = record
    data: integer;
    next: TPList;
  end;
  TListInfo = record
    head: TPList;
    Current: TPList;
  end;

var
  List1, List2: TListInfo;
  n, i, amount: integer;
  data: integer;
  Temp1, temp2: TPList;
  hasEl: boolean;
  before: TPList;

procedure AddInList(var list: TListInfo; const n: integer);
var
  Temp: TPList;
begin
  New(Temp);
  Temp^.data := n;
  Temp^.next := nil;
  if list.head = nil then
    begin
      list.head := Temp;
    end
  else
    list.Current^.next := Temp;
  list.Current := Temp;
end;

procedure InsertInList(var x, y: TPList);
var
  Temp: TPList;
begin
  if x = nil then
  begin
    y^.next := List1.head;
    List1.head := y;
  end
  else
  begin
    if x^.next <> nil then
      begin
        Temp := x^.next;
        y^.next := Temp;
      end;
    x^.next := y;
  end;
end;

procedure PrintList(var list: TListInfo);
begin
  list.Current := list.head;
  if list.Current = nil then
    writeln ('Нет одинаковых элементов в списках')
    else
      while list.Current <> nil do
      begin
        write(list.Current^.data:5);
        list.Current := list.Current^.next;
      end;
end;

begin
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);
  List1.head := nil;
  List1.Current := nil;
  List1 := List2;

  Writeln('Количество элементов в первом списке:');
  repeat
    Readln(amount);
    if (amount > 0) then
    begin
      Writeln('Введите элементы первого списка:');
      while amount > 0 do
      begin
        Readln(data);
        AddInList(List1, data);
        dec (amount);
      end;
      inc (amount);
    end;
  until (amount > 0);
  writeln;

  Writeln('Количество элементов во втором списке:');
  repeat
    Readln(amount);
    if (amount > 0) then
    begin
      Writeln('Введите элементы второго списка:');
      while amount > 0 do
      begin
        Readln(data);
        AddInList(List2, data);
        dec (amount);
      end;
      inc (amount);
    end;
  until (amount > 0);


  List1.Current := List1.head;
  before := List1.head;
  while List1.Current <> nil do
  begin
    List2.Current := List2.head;
    hasEl := false;
    while List2.Current <> nil do
    begin
      if List1.Current^.data = List2.Current^.data then
      begin
        hasEl := true;
        break;
      end;
      List2.Current := List2.Current^.next;
    end;

    if not hasEl then
    begin
      if List1.Current = List1.head then
      begin
        List1.head := List1.head^.next;
        List1.Current := List1.head;
        before := List1.Current;
      end
      else
      begin
        before^.next := List1.Current^.next;
        List1.Current := before^.next;
      end;
    end
    else
      begin
        before := List1.Current;
        List1.Current := List1.Current^.next;
      end;
  end;

  writeln;
  writeln ('Полученный список');
  PrintList(List1);
  Readln;
end.

