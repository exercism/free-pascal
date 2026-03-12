unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  TwelveDaysTest = class(TTestCase)
  published
    procedure first_day_a_partridge_in_a_pear_tree;
    procedure second_day_two_turtle_doves;
    procedure third_day_three_french_hens;
    procedure fourth_day_four_calling_birds;
    procedure fifth_day_five_gold_rings;
    procedure sixth_day_six_geese_a_laying;
    procedure seventh_day_seven_swans_a_swimming;
    procedure eighth_day_eight_maids_a_milking;
    procedure ninth_day_nine_ladies_dancing;
    procedure tenth_day_ten_lords_a_leaping;
    procedure eleventh_day_eleven_pipers_piping;
    procedure twelfth_day_twelve_drummers_drumming;
    procedure recites_first_three_verses_of_the_song;
    procedure recites_three_verses_from_the_middle_of_the_song;
    procedure recites_the_whole_song;
  end;

implementation

uses TwelveDays;

// c0b5a5e6-c89d-49b1-a6b2-9f523bff33f7
procedure TwelveDaysTest.first_day_a_partridge_in_a_pear_tree;
begin
  TapAssertTrue(Self, 'first day a partridge in a pear tree', 'On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.', TwelveDays.recite(1, 1));
end;

// 1c64508a-df3d-420a-b8e1-fe408847854a
procedure TwelveDaysTest.second_day_two_turtle_doves;
begin
  TapAssertTrue(Self, 'second day two turtle doves', 'On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.', TwelveDays.recite(2, 2));
end;

// a919e09c-75b2-4e64-bb23-de4a692060a8
procedure TwelveDaysTest.third_day_three_french_hens;
begin
  TapAssertTrue(Self, 'third day three french hens', 'On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.', TwelveDays.recite(3, 3));
end;

// 9bed8631-ec60-4894-a3bb-4f0ec9fbe68d
procedure TwelveDaysTest.fourth_day_four_calling_birds;
begin
  TapAssertTrue(Self, 'fourth day four calling birds', 'On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.', TwelveDays.recite(4, 4));
end;

// cf1024f0-73b6-4545-be57-e9cea565289a
procedure TwelveDaysTest.fifth_day_five_gold_rings;
begin
  TapAssertTrue(Self, 'fifth day five gold rings', 'On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.', TwelveDays.recite(5, 5));
end;

// 50bd3393-868a-4f24-a618-68df3d02ff04
procedure TwelveDaysTest.sixth_day_six_geese_a_laying;
begin
  TapAssertTrue(Self, 'sixth day six geese-a-laying', 'On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.', TwelveDays.recite(6, 6));
end;

// 8f29638c-9bf1-4680-94be-e8b84e4ade83
procedure TwelveDaysTest.seventh_day_seven_swans_a_swimming;
begin
  TapAssertTrue(Self, 'seventh day seven swans-a-swimming', 'On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.', TwelveDays.recite(7, 7));
end;

// 7038d6e1-e377-47ad-8c37-10670a05bc05
procedure TwelveDaysTest.eighth_day_eight_maids_a_milking;
begin
  TapAssertTrue(Self, 'eighth day eight maids-a-milking', 'On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.', TwelveDays.recite(8, 8));
end;

// 37a800a6-7a56-4352-8d72-0f51eb37cfe8
procedure TwelveDaysTest.ninth_day_nine_ladies_dancing;
begin
  TapAssertTrue(Self, 'ninth day nine ladies dancing', 'On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.', TwelveDays.recite(9, 9));
end;

// 10b158aa-49ff-4b2d-afc3-13af9133510d
procedure TwelveDaysTest.tenth_day_ten_lords_a_leaping;
begin
  TapAssertTrue(Self, 'tenth day ten lords-a-leaping', 'On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.', TwelveDays.recite(10, 10));
end;

// 08d7d453-f2ba-478d-8df0-d39ea6a4f457
procedure TwelveDaysTest.eleventh_day_eleven_pipers_piping;
begin
  TapAssertTrue(Self, 'eleventh day eleven pipers piping', 'On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.', TwelveDays.recite(11, 11));
end;

// 0620fea7-1704-4e48-b557-c05bf43967f0
procedure TwelveDaysTest.twelfth_day_twelve_drummers_drumming;
begin
  TapAssertTrue(Self, 'twelfth day twelve drummers drumming', 'On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.', TwelveDays.recite(12, 12));
end;

// da8b9013-b1e8-49df-b6ef-ddec0219e398
procedure TwelveDaysTest.recites_first_three_verses_of_the_song;
begin
  TapAssertTrue(Self, 'recites first three verses of the song', 'On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.' + #10 + 'On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.' + #10 + 'On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.', TwelveDays.recite(1, 3));
end;

// c095af0d-3137-4653-ad32-bfb899eda24c
procedure TwelveDaysTest.recites_three_verses_from_the_middle_of_the_song;
begin
  TapAssertTrue(Self, 'recites three verses from the middle of the song', 'On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.' + #10 + 'On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.' + #10 + 'On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.', TwelveDays.recite(4, 6));
end;

// 20921bc9-cc52-4627-80b3-198cbbfcf9b7
procedure TwelveDaysTest.recites_the_whole_song;
begin
  TapAssertTrue(Self, 'recites the whole song', 'On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.' + #10 + 'On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.' + #10 + 'On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.' + #10 + 'On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.' + #10 + 'On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.' + #10 + 'On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.' + #10 + 'On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.' + #10 + 'On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.' + #10 + 'On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.' + #10 + 'On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.' + #10 + 'On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.' + #10 + 'On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.', TwelveDays.recite(1, 12));
end;

initialization
RegisterTest(TwelveDaysTest);

end.
