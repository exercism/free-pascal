unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  LinkedListTest = class(TTestCase)
  published
    procedure pop_gets_element_from_the_list;
    procedure push_pop_respectively_add_remove_at_the_end_of_the_list;
    procedure shift_gets_an_element_from_the_list;
    procedure shift_gets_first_element_from_the_list;
    procedure unshift_adds_element_at_start_of_the_list;
    procedure pop_push_shift_and_unshift_can_be_used_in_any_order;
    procedure count_an_empty_list;
    procedure count_a_list_with_items;
    procedure count_is_correct_after_mutation;
    procedure popping_to_empty_doesnt_break_the_list;
    procedure shifting_to_empty_doesnt_break_the_list;
    procedure deletes_the_only_element;
    procedure deletes_the_element_with_the_specified_value_from_the_list;
    procedure deletes_the_element_with_the_specified_value_from_the_list_re_assigns_tail;
    procedure deletes_the_element_with_the_specified_value_from_the_list_re_assigns_head;
    procedure deletes_the_first_of_two_elements;
    procedure deletes_the_second_of_two_elements;
    procedure delete_does_not_modify_the_list_if_the_element_is_not_found;
    procedure deletes_only_the_first_occurrence;
    procedure pop_from_empty_list_raises_error;
    procedure shift_from_empty_list_raises_error;
  end;

implementation

uses LinkedList;

type
  TIntFunctionPtr = function: Integer of object;

procedure TapAssertExpectionMessage(
  ACase             : TTestCase       ;
  const AMessage    : string          ;
  const expected    : string          ;
  const command     : TIntFunctionPtr
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    command;
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// 7f7e3987-b954-41b8-8084-99beca08752c
procedure LinkedListTest.pop_gets_element_from_the_list;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(7);
  TapAssertTrue(Self, 'pop gets element from the list', 7, list.Pop);
  list.Free;
end;

// c3f67e5d-cfa2-4c3e-a18f-7ce999c3c885
procedure LinkedListTest.push_pop_respectively_add_remove_at_the_end_of_the_list;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(11);
  list.Push(13);
  TapAssertTrue(Self, 'push/pop respectively add/remove at the end of the list', 13, list.Pop);
  TapAssertTrue(Self, 'push/pop respectively add/remove at the end of the list', 11, list.Pop);
  list.Free;
end;

// 00ea24ce-4f5c-4432-abb4-cc6e85462657
procedure LinkedListTest.shift_gets_an_element_from_the_list;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(17);
  TapAssertTrue(Self, 'shift gets an element from the list', 17, list.Shift);
  list.Free;
end;

// 37962ee0-3324-4a29-b588-5a4c861e6564
procedure LinkedListTest.shift_gets_first_element_from_the_list;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(23);
  list.Push(5);
  TapAssertTrue(Self, 'shift gets first element from the list', 23, list.Shift);
  TapAssertTrue(Self, 'shift gets first element from the list', 5, list.Shift);
  list.Free;
end;

// 30a3586b-e9dc-43fb-9a73-2770cec2c718
procedure LinkedListTest.unshift_adds_element_at_start_of_the_list;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Unshift(23);
  list.Unshift(5);
  TapAssertTrue(Self, 'unshift adds element at start of the list', 5, list.Shift);
  TapAssertTrue(Self, 'unshift adds element at start of the list', 23, list.Shift);
  list.Free;
end;

// 042f71e4-a8a7-4cf0-8953-7e4f3a21c42d
procedure LinkedListTest.pop_push_shift_and_unshift_can_be_used_in_any_order;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(1);
  list.Push(2);
  TapAssertTrue(Self, 'pop, push, shift, and unshift can be used in any order', 2, list.Pop);
  list.Push(3);
  TapAssertTrue(Self, 'pop, push, shift, and unshift can be used in any order', 1, list.Shift);
  list.Unshift(4);
  list.Push(5);
  TapAssertTrue(Self, 'pop, push, shift, and unshift can be used in any order', 4, list.Shift);
  TapAssertTrue(Self, 'pop, push, shift, and unshift can be used in any order', 5, list.Pop);
  TapAssertTrue(Self, 'pop, push, shift, and unshift can be used in any order', 3, list.Shift);
  list.Free;
end;

// 88f65c0c-4532-4093-8295-2384fb2f37df
procedure LinkedListTest.count_an_empty_list;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  TapAssertTrue(Self, 'count an empty list', 0, list.Count);
  list.Free;
end;

// fc055689-5cbe-4cd9-b994-02e2abbb40a5
procedure LinkedListTest.count_a_list_with_items;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(37);
  list.Push(1);
  TapAssertTrue(Self, 'count a list with items', 2, list.Count);
  list.Free;
end;

// 8272cef5-130d-40ea-b7f6-5ffd0790d650
procedure LinkedListTest.count_is_correct_after_mutation;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(31);
  TapAssertTrue(Self, 'count is correct after mutation', 1, list.Count);
  list.Unshift(43);
  TapAssertTrue(Self, 'count is correct after mutation', 2, list.Count);
  list.Shift;
  TapAssertTrue(Self, 'count is correct after mutation', 1, list.Count);
  list.Pop;
  TapAssertTrue(Self, 'count is correct after mutation', 0, list.Count);
  list.Free;
end;

// 229b8f7a-bd8a-4798-b64f-0dc0bb356d95
procedure LinkedListTest.popping_to_empty_doesnt_break_the_list;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(41);
  list.Push(59);
  list.Pop;
  list.Pop;
  list.Push(47);
  TapAssertTrue(Self, 'popping to empty doesnt break the list', 1, list.Count);
  TapAssertTrue(Self, 'popping to empty doesnt break the list', 47, list.Pop);
  list.Free;
end;

// 4e1948b4-514e-424b-a3cf-a1ebbfa2d1ad
procedure LinkedListTest.shifting_to_empty_doesnt_break_the_list;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(41);
  list.Push(59);
  list.Shift;
  list.Shift;
  list.Push(47);
  TapAssertTrue(Self, 'shifting to empty doesnt break the list', 1, list.Count);
  TapAssertTrue(Self, 'shifting to empty doesnt break the list', 47, list.Shift);
  list.Free;
end;

// e8f7c600-d597-4f79-949d-8ad8bae895a6
procedure LinkedListTest.deletes_the_only_element;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(61);
  list.Delete(61);
  TapAssertTrue(Self, 'deletes the only element', 0, list.Count);
  list.Free;
end;

// fd65e422-51f3-45c0-9fd0-c33da638f89b
procedure LinkedListTest.deletes_the_element_with_the_specified_value_from_the_list;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(71);
  list.Push(83);
  list.Push(79);
  list.Delete(83);
  TapAssertTrue(Self, 'deletes the element with the specified value from the list', 2, list.Count);
  TapAssertTrue(Self, 'deletes the element with the specified value from the list', 79, list.Pop);
  TapAssertTrue(Self, 'deletes the element with the specified value from the list', 71, list.Shift);
  list.Free;
end;

// 59db191a-b17f-4ab7-9c5c-60711ec1d013
procedure LinkedListTest.deletes_the_element_with_the_specified_value_from_the_list_re_assigns_tail;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(71);
  list.Push(83);
  list.Push(79);
  list.Delete(83);
  TapAssertTrue(Self, 'deletes the element with the specified value from the list, re-assigns tail', 2, list.Count);
  TapAssertTrue(Self, 'deletes the element with the specified value from the list, re-assigns tail', 79, list.Pop);
  TapAssertTrue(Self, 'deletes the element with the specified value from the list, re-assigns tail', 71, list.Pop);
  list.Free;
end;

// 58242222-5d39-415b-951d-8128247f8993
procedure LinkedListTest.deletes_the_element_with_the_specified_value_from_the_list_re_assigns_head;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(71);
  list.Push(83);
  list.Push(79);
  list.Delete(83);
  TapAssertTrue(Self, 'deletes the element with the specified value from the list, re-assigns head', 2, list.Count);
  TapAssertTrue(Self, 'deletes the element with the specified value from the list, re-assigns head', 71, list.Shift);
  TapAssertTrue(Self, 'deletes the element with the specified value from the list, re-assigns head', 79, list.Shift);
  list.Free;
end;

// ee3729ee-3405-4bd2-9bad-de0d4aa5d647
procedure LinkedListTest.deletes_the_first_of_two_elements;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(97);
  list.Push(101);
  list.Delete(97);
  TapAssertTrue(Self, 'deletes the first of two elements', 1, list.Count);
  TapAssertTrue(Self, 'deletes the first of two elements', 101, list.Pop);
  list.Free;
end;

// 47e3b3b4-b82c-4c23-8c1a-ceb9b17cb9fb
procedure LinkedListTest.deletes_the_second_of_two_elements;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(97);
  list.Push(101);
  list.Delete(101);
  TapAssertTrue(Self, 'deletes the second of two elements', 1, list.Count);
  TapAssertTrue(Self, 'deletes the second of two elements', 97, list.Pop);
  list.Free;
end;

// 7b420958-f285-4922-b8f9-10d9dcab5179
procedure LinkedListTest.delete_does_not_modify_the_list_if_the_element_is_not_found;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(89);
  list.Delete(103);
  TapAssertTrue(Self, 'delete does not modify the list if the element is not found', 1, list.Count);
  list.Free;
end;

// 7e04828f-6082-44e3-a059-201c63252a76
procedure LinkedListTest.deletes_only_the_first_occurrence;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  list.Push(73);
  list.Push(9);
  list.Push(9);
  list.Push(107);
  list.Delete(9);
  TapAssertTrue(Self, 'deletes only the first occurrence', 3, list.Count);
  TapAssertTrue(Self, 'deletes only the first occurrence', 107, list.Pop);
  TapAssertTrue(Self, 'deletes only the first occurrence', 9, list.Pop);
  TapAssertTrue(Self, 'deletes only the first occurrence', 73, list.Pop);
  list.Free;
end;

procedure LinkedListTest.pop_from_empty_list_raises_error;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  TapAssertExpectionMessage(Self, 'pop from empty list raises error', 'empty list', @list.Pop);
  list.Free;
end;

procedure LinkedListTest.shift_from_empty_list_raises_error;
var
  list : TLinkedList;
begin
  list := TLinkedList.Create;
  TapAssertExpectionMessage(Self, 'shift from empty list raises error', 'empty list', @list.Shift);
  list.Free;
end;

initialization
RegisterTest(LinkedListTest);

end.
