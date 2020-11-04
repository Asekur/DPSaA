program Task14;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

type
  TList=^TListItem;
  TListItem=record
    Next:TList;
    LastName:string;
    Adress:string;
    Number:string;
  end;

var
  Head:TList;
  k, comand:LongInt;

procedure InsertContact(Head:TList);
var
  Q, Current:TList;
begin
  New(Q);
  Write('Введите фамилию нового контакта: ');
  Readln(Q^.LastName);
  Write('Введите адрес нового контакта: ');
  Readln(Q^.Adress);
  Write('Введите номер нового контакта: ');
  Readln(Q^.Number);
  Current:=Head;
  while (Current^.Next<>nil) and (Current^.Next^.LastName<Q^.LastName) do
  begin
    Current:=Current^.Next;
  end;
  Q^.Next:=Current^.Next;
  Current^.Next:=Q;
  writeln ('Контакт успешно добавлен');
end;

procedure Print(Head:TList);
var
  Current:TList;
  counter: integer;
begin
  Current:=Head;
  counter:= 0;
  if Current^.Next = nil then
    writeln ('Список пуст')
    else
    begin
      while Current^.Next<>nil do
      begin
        Current:=Current^.Next;
        if Current^.Number[1]='5' then
        begin
          Writeln(Current^.LastName);
          inc(counter);
        end;
      end;
      if counter = 0 then
        writeln ('Все имеют номер, начинающийся не с 5');
    end;
end;

begin
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);
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
