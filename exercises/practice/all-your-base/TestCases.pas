unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  AllYourBaseTest = class(TTestCase)
  published
    procedure single_bit_one_to_decimal;
    procedure binary_to_single_decimal;
    procedure single_decimal_to_binary;
    procedure binary_to_multiple_decimal;
    procedure decimal_to_binary;
    procedure trinary_to_hexadecimal;
    procedure hexadecimal_to_trinary;
    procedure fifteen_bit_integer;
    procedure empty_list;
    procedure single_zero;
    procedure multiple_zeros;
    procedure leading_zeros;
    procedure input_base_is_one;
    procedure input_base_is_zero;
    procedure input_base_is_negative;
    procedure negative_digit;
    procedure invalid_positive_digit;
    procedure output_base_is_one;
    procedure output_base_is_zero;
    procedure output_base_is_negative;
    procedure both_bases_are_negative;
  end;

implementation

uses AllYourBase;

procedure TapAssertExpectionMessage(
  ACase             : TTestCase ;
  const AMessage    : string    ;
  const Expected    : string    ;
  const InputBase   : integer   ;
  const InputDigits : TIntArray  ;
  const OutputBase  : integer
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    AllYourBase.rebase(InputBase, InputDigits, OutputBase)
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// 5ce422f9-7a4b-4f44-ad29-49c67cb32d2c
procedure AllYourBaseTest.single_bit_one_to_decimal;
begin
  TapAssertTrue(Self, 'single bit one to decimal', [1], AllYourBase.rebase(2, [1], 10));
end;

// 0cc3fea8-bb79-46ac-a2ab-5a2c93051033
procedure AllYourBaseTest.binary_to_single_decimal;
begin
  TapAssertTrue(Self, 'binary to single decimal', [5], AllYourBase.rebase(2, [1,0,1], 10));
end;

// f12db0f9-0d3d-42c2-b3ba-e38cb375a2b8
procedure AllYourBaseTest.single_decimal_to_binary;
begin
  TapAssertTrue(Self, 'single decimal to binary', [1,0,1], AllYourBase.rebase(10, [5], 2));
end;

// 2c45cf54-6da3-4748-9733-5a3c765d925b
procedure AllYourBaseTest.binary_to_multiple_decimal;
begin
  TapAssertTrue(Self, 'binary to multiple decimal', [4,2], AllYourBase.rebase(2, [1,0,1,0,1,0], 10));
end;

// 65ddb8b4-8899-4fcc-8618-181b2cf0002d
procedure AllYourBaseTest.decimal_to_binary;
begin
  TapAssertTrue(Self, 'decimal to binary', [1,0,1,0,1,0], AllYourBase.rebase(10, [4,2], 2));
end;

// 8d418419-02a7-4824-8b7a-352d33c6987e
procedure AllYourBaseTest.trinary_to_hexadecimal;
begin
  TapAssertTrue(Self, 'trinary to hexadecimal', [2,10], AllYourBase.rebase(3, [1,1,2,0], 16));
end;

// d3901c80-8190-41b9-bd86-38d988efa956
procedure AllYourBaseTest.hexadecimal_to_trinary;
begin
  TapAssertTrue(Self, 'hexadecimal to trinary', [1,1,2,0], AllYourBase.rebase(16, [2,10], 3));
end;

// 5d42f85e-21ad-41bd-b9be-a3e8e4258bbf
procedure AllYourBaseTest.fifteen_bit_integer;
begin
  TapAssertTrue(Self, '15-bit integer', [6,10,45], AllYourBase.rebase(97, [3,46,60], 73));
end;

// d68788f7-66dd-43f8-a543-f15b6d233f83
procedure AllYourBaseTest.empty_list;
begin
  TapAssertTrue(Self, 'empty list', [0], AllYourBase.rebase(2, [], 10));
end;

// 5e27e8da-5862-4c5f-b2a9-26c0382b6be7
procedure AllYourBaseTest.single_zero;
begin
  TapAssertTrue(Self, 'single zero', [0], AllYourBase.rebase(10, [0], 2));
end;

// 2e1c2573-77e4-4b9c-8517-6c56c5bcfdf2
procedure AllYourBaseTest.multiple_zeros;
begin
  TapAssertTrue(Self, 'multiple zeros', [0], AllYourBase.rebase(10, [0,0,0], 2));
end;

// 3530cd9f-8d6d-43f5-bc6e-b30b1db9629b
procedure AllYourBaseTest.leading_zeros;
begin
  TapAssertTrue(Self, 'leading zeros', [4,2], AllYourBase.rebase(7, [0,6,0], 10));
end;

// a6b476a1-1901-4f2a-92c4-4d91917ae023
procedure AllYourBaseTest.input_base_is_one;
begin
  TapAssertExpectionMessage(Self, 'input base is one', 'input base must be >= 2', 1, [0], 10);
end;

// e21a693a-7a69-450b-b393-27415c26a016
procedure AllYourBaseTest.input_base_is_zero;
begin
  TapAssertExpectionMessage(Self, 'input base is zero', 'input base must be >= 2', 0, [], 10);
end;

// 54a23be5-d99e-41cc-88e0-a650ffe5fcc2
procedure AllYourBaseTest.input_base_is_negative;
begin
  TapAssertExpectionMessage(Self, 'input base is negative', 'input base must be >= 2', -2, [1], 10);
end;

// 9eccf60c-dcc9-407b-95d8-c37b8be56bb6
procedure AllYourBaseTest.negative_digit;
begin
  TapAssertExpectionMessage(Self, 'negative digit', 'all digits must satisfy 0 <= d < input base', 2, [1,-1,1,0,1,0], 10);
end;

// 232fa4a5-e761-4939-ba0c-ed046cd0676a
procedure AllYourBaseTest.invalid_positive_digit;
begin
  TapAssertExpectionMessage(Self, 'invalid positive digit', 'all digits must satisfy 0 <= d < input base', 2, [1,2,1,0,1,0], 10);
end;

// 14238f95-45da-41dc-95ce-18f860b30ad3
procedure AllYourBaseTest.output_base_is_one;
begin
  TapAssertExpectionMessage(Self, 'output base is one', 'output base must be >= 2', 2, [1,0,1,0,1,0], 1);
end;

// 73dac367-da5c-4a37-95fe-c87fad0a4047
procedure AllYourBaseTest.output_base_is_zero;
begin
  TapAssertExpectionMessage(Self, 'output base is zero', 'output base must be >= 2', 10, [7], 0);
end;

// 13f81f42-ff53-4e24-89d9-37603a48ebd9
procedure AllYourBaseTest.output_base_is_negative;
begin
  TapAssertExpectionMessage(Self, 'output base is negative', 'output base must be >= 2', 2, [1], -7);
end;

// 0e6c895d-8a5d-4868-a345-309d094cfe8d
procedure AllYourBaseTest.both_bases_are_negative;
begin
  TapAssertExpectionMessage(Self, 'both bases are negative', 'input base must be >= 2', -2, [1], -7);
end;

initialization
RegisterTest(AllYourBaseTest);

end.
