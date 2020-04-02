program Task2;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

type
  TList=^TListItem;
  TListItem=record
    Next:TList;
    Name:string;
    First:real;
    Second:real;
    Third:real;
  end;

var
  Head:TList;
  k, comand:LongInt;

procedure InsertContact(Head:TList);
var
  Q, Current:TList;
begin
  New(Q);
  Write('Введите имя студента: ');
  Readln(Q^.Name);
  Write('Введите первую оценку студента: ');
  Readln(Q^.First);
  Write('Введите вторую оценку студента: ');
  Readln(Q^.Second);
  Write('Введите третью оценку студента: ');
  Readln(Q^.Third);
  Current:=Head;
  while (Current^.Next<>nil) and (Current^.Next^.Name<Q^.Name) do
  begin
    Current:=Current^.Next;
  end;
  Q^.Next:=Current^.Next;
  Current^.Next:=Q;
  writeln ('Студент успешно добавлен');
end;

procedure Print(Head:TList);
var
  Current:TList;
  counter: integer;
begin
  Current:=Head;
  counter:= 0;
  if Current^.Next=nil then
    writeln ('Список пуст')
  else
  begin
    while Current^.Next<>nil do
    begin
      Current:=Current^.Next;
      if (Current^.First>2) and (Current^.Second>2) and (Current^.Third>2)then
      begin
        Writeln(Current^.Name,' ',(Current^.First+Current^.Second+Current^.Third)/3:0:1);
        inc (counter);
      end;
    end;
    if counter = 0 then
      writeln ('Все студенты сдали экзамены с хотя бы одной 2');
  end;
end;

begin
  setconsolecp(1251);
  setconsoleoutputcp(1251);
  New(Head);
  Head^.Next:=nil;
  k:=0;
  while k=0 do
  begin
    Writeln('Выбирите операцию: Добавить контакт(1), Вывод искомого списка(2), Выход(3).');
    readln(comand);
    case comand of
      1: InsertContact(Head);
      3: k:=-1;
      2: Print(Head);
    end;
    writeln;
  end;
end.
