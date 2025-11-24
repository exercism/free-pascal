unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  HouseTest = class(TTestCase)
  published
    procedure verse_one_the_house_that_jack_built;
    procedure verse_two_the_malt_that_lay;
    procedure verse_three_the_rat_that_ate;
    procedure verse_four_the_cat_that_killed;
    procedure verse_five_the_dog_that_worried;
    procedure verse_six_the_cow_with_the_crumpled_horn;
    procedure verse_seven_the_maiden_all_forlorn;
    procedure verse_eight_the_man_all_tattered_and_torn;
    procedure verse_nine_the_priest_all_shaven_and_shorn;
    procedure verse_10_the_rooster_that_crowed_in_the_morn;
    procedure verse_11_the_farmer_sowing_his_corn;
    procedure verse_12_the_horse_and_the_hound_and_the_horn;
    procedure multiple_verses;
    procedure full_rhyme;
  end;

implementation

uses House;

// 28a540ff-f765-4348-9d57-ae33f25f41f2
procedure HouseTest.verse_one_the_house_that_jack_built;
begin
  TapAssertTrue(Self, 'verse one - the house that jack built', 'This is the house that Jack built.', House.recite(1, 1));
end;

// ebc825ac-6e2b-4a5e-9afd-95732191c8da
procedure HouseTest.verse_two_the_malt_that_lay;
begin
  TapAssertTrue(Self, 'verse two - the malt that lay', 'This is the malt that lay in the house that Jack built.', House.recite(2, 2));
end;

// 1ed8bb0f-edb8-4bd1-b6d4-b64754fe4a60
procedure HouseTest.verse_three_the_rat_that_ate;
begin
  TapAssertTrue(Self, 'verse three - the rat that ate', 'This is the rat that ate the malt that lay in the house that Jack built.', House.recite(3, 3));
end;

// 64b0954e-8b7d-4d14-aad0-d3f6ce297a30
procedure HouseTest.verse_four_the_cat_that_killed;
begin
  TapAssertTrue(Self, 'verse four - the cat that killed', 'This is the cat that killed the rat that ate the malt that lay in the house that Jack built.', House.recite(4, 4));
end;

// 1e8d56bc-fe31-424d-9084-61e6111d2c82
procedure HouseTest.verse_five_the_dog_that_worried;
begin
  TapAssertTrue(Self, 'verse five - the dog that worried', 'This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.', House.recite(5, 5));
end;

// 6312dc6f-ab0a-40c9-8a55-8d4e582beac4
procedure HouseTest.verse_six_the_cow_with_the_crumpled_horn;
begin
  TapAssertTrue(Self, 'verse six - the cow with the crumpled horn', 'This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.', House.recite(6, 6));
end;

// 68f76d18-6e19-4692-819c-5ff6a7f92feb
procedure HouseTest.verse_seven_the_maiden_all_forlorn;
begin
  TapAssertTrue(Self, 'verse seven - the maiden all forlorn', 'This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.', House.recite(7, 7));
end;

// 73872564-2004-4071-b51d-2e4326096747
procedure HouseTest.verse_eight_the_man_all_tattered_and_torn;
begin
  TapAssertTrue(Self, 'verse eight - the man all tattered and torn', 'This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.', House.recite(8, 8));
end;

// 0d53d743-66cb-4351-a173-82702f3338c9
procedure HouseTest.verse_nine_the_priest_all_shaven_and_shorn;
begin
  TapAssertTrue(Self, 'verse nine - the priest all shaven and shorn', 'This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.', House.recite(9, 9));
end;

// 452f24dc-8fd7-4a82-be1a-3b4839cfeb41
procedure HouseTest.verse_10_the_rooster_that_crowed_in_the_morn;
begin
  TapAssertTrue(Self, 'verse 10 - the rooster that crowed in the morn', 'This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.', House.recite(10, 10));
end;

// 97176f20-2dd3-4646-ac72-cffced91ea26
procedure HouseTest.verse_11_the_farmer_sowing_his_corn;
begin
  TapAssertTrue(Self, 'verse 11 - the farmer sowing his corn', 'This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.', House.recite(11, 11));
end;

// 09824c29-6aad-4dcd-ac98-f61374a6a8b7
procedure HouseTest.verse_12_the_horse_and_the_hound_and_the_horn;
begin
  TapAssertTrue(Self, 'verse 12 - the horse and the hound and the horn', 'This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.', House.recite(12, 12));
end;

// d2b980d3-7851-49e1-97ab-1524515ec200
procedure HouseTest.multiple_verses;
begin
  TapAssertTrue(Self, 'multiple verses', 'This is the cat that killed the rat that ate the malt that lay in the house that Jack built.' + #10 + 'This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.' + #10 + 'This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.' + #10 + 'This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.' + #10 + 'This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.', House.recite(4, 8));
end;

// 0311d1d0-e085-4f23-8ae7-92406fb3e803
procedure HouseTest.full_rhyme;
begin
  TapAssertTrue(Self, 'full rhyme', 'This is the house that Jack built.' + #10 + 'This is the malt that lay in the house that Jack built.' + #10 + 'This is the rat that ate the malt that lay in the house that Jack built.' + #10 + 'This is the cat that killed the rat that ate the malt that lay in the house that Jack built.' + #10 + 'This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.' + #10 + 'This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.' + #10 + 'This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.' + #10 + 'This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.' + #10 + 'This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.' + #10 + 'This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.' + #10 + 'This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.' + #10 + 'This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.', House.recite(1, 12));
end;

initialization
RegisterTest(HouseTest);

end.
