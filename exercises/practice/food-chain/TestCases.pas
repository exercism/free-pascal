unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  FoodChainTest = class(TTestCase)
  published
    procedure fly;
    procedure spider;
    procedure bird;
    procedure cat;
    procedure dog;
    procedure goat;
    procedure cow;
    procedure horse;
    procedure multiple_verses;
    procedure full_song;
  end;

implementation

uses FoodChain;

// 751dce68-9412-496e-b6e8-855998c56166
procedure FoodChainTest.fly;
begin
  TapAssertTrue(Self, 'fly', 'I know an old lady who swallowed a fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.', FoodChain.recite(1, 1));
end;

// 6c56f861-0c5e-4907-9a9d-b2efae389379
procedure FoodChainTest.spider;
begin
  TapAssertTrue(Self, 'spider', 'I know an old lady who swallowed a spider.' + #10 + 'It wriggled and jiggled and tickled inside her.' + #10 + 'She swallowed the spider to catch the fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.', FoodChain.recite(2, 2));
end;

// 3edf5f33-bef1-4e39-ae67-ca5eb79203fa
procedure FoodChainTest.bird;
begin
  TapAssertTrue(Self, 'bird', 'I know an old lady who swallowed a bird.' + #10 + 'How absurd to swallow a bird!' + #10 + 'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + #10 + 'She swallowed the spider to catch the fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.', FoodChain.recite(3, 3));
end;

// e866a758-e1ff-400e-9f35-f27f28cc288f
procedure FoodChainTest.cat;
begin
  TapAssertTrue(Self, 'cat', 'I know an old lady who swallowed a cat.' + #10 + 'Imagine that, to swallow a cat!' + #10 + 'She swallowed the cat to catch the bird.' + #10 + 'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + #10 + 'She swallowed the spider to catch the fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.', FoodChain.recite(4, 4));
end;

// 3f02c30e-496b-4b2a-8491-bc7e2953cafb
procedure FoodChainTest.dog;
begin
  TapAssertTrue(Self, 'dog', 'I know an old lady who swallowed a dog.' + #10 + 'What a hog, to swallow a dog!' + #10 + 'She swallowed the dog to catch the cat.' + #10 + 'She swallowed the cat to catch the bird.' + #10 + 'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + #10 + 'She swallowed the spider to catch the fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.', FoodChain.recite(5, 5));
end;

// 4b3fd221-01ea-46e0-825b-5734634fbc59
procedure FoodChainTest.goat;
begin
  TapAssertTrue(Self, 'goat', 'I know an old lady who swallowed a goat.' + #10 + 'Just opened her throat and swallowed a goat!' + #10 + 'She swallowed the goat to catch the dog.' + #10 + 'She swallowed the dog to catch the cat.' + #10 + 'She swallowed the cat to catch the bird.' + #10 + 'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + #10 + 'She swallowed the spider to catch the fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.', FoodChain.recite(6, 6));
end;

// 1b707da9-7001-4fac-941f-22ad9c7a65d4
procedure FoodChainTest.cow;
begin
  TapAssertTrue(Self, 'cow', 'I know an old lady who swallowed a cow.' + #10 + 'I don''t know how she swallowed a cow!' + #10 + 'She swallowed the cow to catch the goat.' + #10 + 'She swallowed the goat to catch the dog.' + #10 + 'She swallowed the dog to catch the cat.' + #10 + 'She swallowed the cat to catch the bird.' + #10 + 'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + #10 + 'She swallowed the spider to catch the fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.', FoodChain.recite(7, 7));
end;

// 3cb10d46-ae4e-4d2c-9296-83c9ffc04cdc
procedure FoodChainTest.horse;
begin
  TapAssertTrue(Self, 'horse', 'I know an old lady who swallowed a horse.' + #10 + 'She''s dead, of course!', FoodChain.recite(8, 8));
end;

// 22b863d5-17e4-4d1e-93e4-617329a5c050
procedure FoodChainTest.multiple_verses;
begin
  TapAssertTrue(Self, 'multiple verses', 'I know an old lady who swallowed a fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.' + #10 + '' + #10 + 'I know an old lady who swallowed a spider.' + #10 + 'It wriggled and jiggled and tickled inside her.' + #10 + 'She swallowed the spider to catch the fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.' + #10 + '' + #10 + 'I know an old lady who swallowed a bird.' + #10 + 'How absurd to swallow a bird!' + #10 + 'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + #10 + 'She swallowed the spider to catch the fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.', FoodChain.recite(1, 3));
end;

// e626b32b-745c-4101-bcbd-3b13456893db
procedure FoodChainTest.full_song;
begin
  TapAssertTrue(Self, 'full song', 'I know an old lady who swallowed a fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.' + #10 + '' + #10 + 'I know an old lady who swallowed a spider.' + #10 + 'It wriggled and jiggled and tickled inside her.' + #10 + 'She swallowed the spider to catch the fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.' + #10 + '' + #10 + 'I know an old lady who swallowed a bird.' + #10 + 'How absurd to swallow a bird!' + #10 + 'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + #10 + 'She swallowed the spider to catch the fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.' + #10 + '' + #10 + 'I know an old lady who swallowed a cat.' + #10 + 'Imagine that, to swallow a cat!' + #10 + 'She swallowed the cat to catch the bird.' + #10 + 'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + #10 + 'She swallowed the spider to catch the fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.' + #10 + '' + #10 + 'I know an old lady who swallowed a dog.' + #10 + 'What a hog, to swallow a dog!' + #10 + 'She swallowed the dog to catch the cat.' + #10 + 'She swallowed the cat to catch the bird.' + #10 + 'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + #10 + 'She swallowed the spider to catch the fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.' + #10 + '' + #10 + 'I know an old lady who swallowed a goat.' + #10 + 'Just opened her throat and swallowed a goat!' + #10 + 'She swallowed the goat to catch the dog.' + #10 + 'She swallowed the dog to catch the cat.' + #10 + 'She swallowed the cat to catch the bird.' + #10 + 'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + #10 + 'She swallowed the spider to catch the fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.' + #10 + '' + #10 + 'I know an old lady who swallowed a cow.' + #10 + 'I don''t know how she swallowed a cow!' + #10 + 'She swallowed the cow to catch the goat.' + #10 + 'She swallowed the goat to catch the dog.' + #10 + 'She swallowed the dog to catch the cat.' + #10 + 'She swallowed the cat to catch the bird.' + #10 + 'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + #10 + 'She swallowed the spider to catch the fly.' + #10 + 'I don''t know why she swallowed the fly. Perhaps she''ll die.' + #10 + '' + #10 + 'I know an old lady who swallowed a horse.' + #10 + 'She''s dead, of course!', FoodChain.recite(1, 8));
end;

initialization
RegisterTest(FoodChainTest);

end.
