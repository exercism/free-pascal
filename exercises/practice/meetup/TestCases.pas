unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  MeetupTest = class(TTestCase)
  published
    procedure when_teenth_monday_is_the_13th_the_first_day_of_the_teenth_week;
    procedure when_teenth_monday_is_the_19th_the_last_day_of_the_teenth_week;
    procedure when_teenth_monday_is_some_day_in_the_middle_of_the_teenth_week;
    procedure when_teenth_tuesday_is_the_19th_the_last_day_of_the_teenth_week;
    procedure when_teenth_tuesday_is_some_day_in_the_middle_of_the_teenth_week;
    procedure when_teenth_tuesday_is_the_13th_the_first_day_of_the_teenth_week;
    procedure when_teenth_wednesday_is_some_day_in_the_middle_of_the_teenth_week;
    procedure when_teenth_wednesday_is_the_13th_the_first_day_of_the_teenth_week;
    procedure when_teenth_wednesday_is_the_19th_the_last_day_of_the_teenth_week;
    procedure when_teenth_thursday_is_some_day_in_the_middle_of_the_teenth_week;
    procedure when_teenth_thursday_is_the_13th_the_first_day_of_the_teenth_week;
    procedure when_teenth_thursday_is_the_19th_the_last_day_of_the_teenth_week;
    procedure when_teenth_friday_is_the_19th_the_last_day_of_the_teenth_week;
    procedure when_teenth_friday_is_some_day_in_the_middle_of_the_teenth_week;
    procedure when_teenth_friday_is_the_13th_the_first_day_of_the_teenth_week;
    procedure when_teenth_saturday_is_some_day_in_the_middle_of_the_teenth_week;
    procedure when_teenth_saturday_is_the_13th_the_first_day_of_the_teenth_week;
    procedure when_teenth_saturday_is_the_19th_the_last_day_of_the_teenth_week;
    procedure when_teenth_sunday_is_the_19th_the_last_day_of_the_teenth_week;
    procedure when_teenth_sunday_is_some_day_in_the_middle_of_the_teenth_week;
    procedure when_teenth_sunday_is_the_13th_the_first_day_of_the_teenth_week;
    procedure when_first_monday_is_some_day_in_the_middle_of_the_first_week;
    procedure when_first_monday_is_the_1st_the_first_day_of_the_first_week;
    procedure when_first_tuesday_is_the_7th_the_last_day_of_the_first_week;
    procedure when_first_tuesday_is_some_day_in_the_middle_of_the_first_week;
    procedure when_first_wednesday_is_some_day_in_the_middle_of_the_first_week;
    procedure when_first_wednesday_is_the_7th_the_last_day_of_the_first_week;
    procedure when_first_thursday_is_some_day_in_the_middle_of_the_first_week;
    procedure when_first_thursday_is_another_day_in_the_middle_of_the_first_week;
    procedure when_first_friday_is_the_1st_the_first_day_of_the_first_week;
    procedure when_first_friday_is_some_day_in_the_middle_of_the_first_week;
    procedure when_first_saturday_is_some_day_in_the_middle_of_the_first_week;
    procedure when_first_saturday_is_another_day_in_the_middle_of_the_first_week;
    procedure when_first_sunday_is_some_day_in_the_middle_of_the_first_week;
    procedure when_first_sunday_is_the_7th_the_last_day_of_the_first_week;
    procedure when_second_monday_is_some_day_in_the_middle_of_the_second_week;
    procedure when_second_monday_is_the_8th_the_first_day_of_the_second_week;
    procedure when_second_tuesday_is_the_14th_the_last_day_of_the_second_week;
    procedure when_second_tuesday_is_some_day_in_the_middle_of_the_second_week;
    procedure when_second_wednesday_is_some_day_in_the_middle_of_the_second_week;
    procedure when_second_wednesday_is_the_14th_the_last_day_of_the_second_week;
    procedure when_second_thursday_is_some_day_in_the_middle_of_the_second_week;
    procedure when_second_thursday_is_another_day_in_the_middle_of_the_second_week;
    procedure when_second_friday_is_the_8th_the_first_day_of_the_second_week;
    procedure when_second_friday_is_some_day_in_the_middle_of_the_second_week;
    procedure when_second_saturday_is_some_day_in_the_middle_of_the_second_week;
    procedure when_second_saturday_is_another_day_in_the_middle_of_the_second_week;
    procedure when_second_sunday_is_some_day_in_the_middle_of_the_second_week;
    procedure when_second_sunday_is_the_14th_the_last_day_of_the_second_week;
    procedure when_third_monday_is_some_day_in_the_middle_of_the_third_week;
    procedure when_third_monday_is_the_15th_the_first_day_of_the_third_week;
    procedure when_third_tuesday_is_the_21st_the_last_day_of_the_third_week;
    procedure when_third_tuesday_is_some_day_in_the_middle_of_the_third_week;
    procedure when_third_wednesday_is_some_day_in_the_middle_of_the_third_week;
    procedure when_third_wednesday_is_the_21st_the_last_day_of_the_third_week;
    procedure when_third_thursday_is_some_day_in_the_middle_of_the_third_week;
    procedure when_third_thursday_is_another_day_in_the_middle_of_the_third_week;
    procedure when_third_friday_is_the_15th_the_first_day_of_the_third_week;
    procedure when_third_friday_is_some_day_in_the_middle_of_the_third_week;
    procedure when_third_saturday_is_some_day_in_the_middle_of_the_third_week;
    procedure when_third_saturday_is_another_day_in_the_middle_of_the_third_week;
    procedure when_third_sunday_is_some_day_in_the_middle_of_the_third_week;
    procedure when_third_sunday_is_the_21st_the_last_day_of_the_third_week;
    procedure when_fourth_monday_is_some_day_in_the_middle_of_the_fourth_week;
    procedure when_fourth_monday_is_the_22nd_the_first_day_of_the_fourth_week;
    procedure when_fourth_tuesday_is_the_28th_the_last_day_of_the_fourth_week;
    procedure when_fourth_tuesday_is_some_day_in_the_middle_of_the_fourth_week;
    procedure when_fourth_wednesday_is_some_day_in_the_middle_of_the_fourth_week;
    procedure when_fourth_wednesday_is_the_28th_the_last_day_of_the_fourth_week;
    procedure when_fourth_thursday_is_some_day_in_the_middle_of_the_fourth_week;
    procedure when_fourth_thursday_is_another_day_in_the_middle_of_the_fourth_week;
    procedure when_fourth_friday_is_the_22nd_the_first_day_of_the_fourth_week;
    procedure when_fourth_friday_is_some_day_in_the_middle_of_the_fourth_week;
    procedure when_fourth_saturday_is_some_day_in_the_middle_of_the_fourth_week;
    procedure when_fourth_saturday_is_another_day_in_the_middle_of_the_fourth_week;
    procedure when_fourth_sunday_is_some_day_in_the_middle_of_the_fourth_week;
    procedure when_fourth_sunday_is_the_28th_the_last_day_of_the_fourth_week;
    procedure last_monday_in_a_month_with_four_mondays;
    procedure last_monday_in_a_month_with_five_mondays;
    procedure last_tuesday_in_a_month_with_four_tuesdays;
    procedure last_tuesday_in_another_month_with_four_tuesdays;
    procedure last_wednesday_in_a_month_with_five_wednesdays;
    procedure last_wednesday_in_a_month_with_four_wednesdays;
    procedure last_thursday_in_a_month_with_four_thursdays;
    procedure last_thursday_in_a_month_with_five_thursdays;
    procedure last_friday_in_a_month_with_five_fridays;
    procedure last_friday_in_a_month_with_four_fridays;
    procedure last_saturday_in_a_month_with_four_saturdays;
    procedure last_saturday_in_another_month_with_four_saturdays;
    procedure last_sunday_in_a_month_with_five_sundays;
    procedure last_sunday_in_a_month_with_four_sundays;
    procedure when_last_wednesday_in_february_in_a_leap_year_is_the_29th;
    procedure last_wednesday_in_december_that_is_also_the_last_day_of_the_year;
    procedure when_last_sunday_in_february_in_a_non_leap_year_is_not_the_29th;
    procedure when_first_friday_is_the_7th_the_last_day_of_the_first_week;
  end;

implementation

uses Meetup;

var message : string;

procedure MeetupTest.when_teenth_monday_is_the_13th_the_first_day_of_the_teenth_week;
const expected = '2013-05-13';
var actual : string;
begin
  // d7f8eadd-d4fc-46ee-8a20-e97bd3fd01c8
  actual  := Meetup.meetup(2013, 5, 'teenth', 'Monday');
  message := EncodeJsonMessage('when teenth Monday is the 13th, the first day of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_monday_is_the_19th_the_last_day_of_the_teenth_week;
const expected = '2013-08-19';
var actual : string;
begin
  // f78373d1-cd53-4a7f-9d37-e15bf8a456b4
  actual  := Meetup.meetup(2013, 8, 'teenth', 'Monday');
  message := EncodeJsonMessage('when teenth Monday is the 19th, the last day of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_monday_is_some_day_in_the_middle_of_the_teenth_week;
const expected = '2013-09-16';
var actual : string;
begin
  // 8c78bea7-a116-425b-9c6b-c9898266d92a
  actual  := Meetup.meetup(2013, 9, 'teenth', 'Monday');
  message := EncodeJsonMessage('when teenth Monday is some day in the middle of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_tuesday_is_the_19th_the_last_day_of_the_teenth_week;
const expected = '2013-03-19';
var actual : string;
begin
  // cfef881b-9dc9-4d0b-8de4-82d0f39fc271
  actual  := Meetup.meetup(2013, 3, 'teenth', 'Tuesday');
  message := EncodeJsonMessage('when teenth Tuesday is the 19th, the last day of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_tuesday_is_some_day_in_the_middle_of_the_teenth_week;
const expected = '2013-04-16';
var actual : string;
begin
  // 69048961-3b00-41f9-97ee-eb6d83a8e92b
  actual  := Meetup.meetup(2013, 4, 'teenth', 'Tuesday');
  message := EncodeJsonMessage('when teenth Tuesday is some day in the middle of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_tuesday_is_the_13th_the_first_day_of_the_teenth_week;
const expected = '2013-08-13';
var actual : string;
begin
  // d30bade8-3622-466a-b7be-587414e0caa6
  actual  := Meetup.meetup(2013, 8, 'teenth', 'Tuesday');
  message := EncodeJsonMessage('when teenth Tuesday is the 13th, the first day of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_wednesday_is_some_day_in_the_middle_of_the_teenth_week;
const expected = '2013-01-16';
var actual : string;
begin
  // 8db4b58b-92f3-4687-867b-82ee1a04f851
  actual  := Meetup.meetup(2013, 1, 'teenth', 'Wednesday');
  message := EncodeJsonMessage('when teenth Wednesday is some day in the middle of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_wednesday_is_the_13th_the_first_day_of_the_teenth_week;
const expected = '2013-02-13';
var actual : string;
begin
  // 6c27a2a2-28f8-487f-ae81-35d08c4664f7
  actual  := Meetup.meetup(2013, 2, 'teenth', 'Wednesday');
  message := EncodeJsonMessage('when teenth Wednesday is the 13th, the first day of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_wednesday_is_the_19th_the_last_day_of_the_teenth_week;
const expected = '2013-06-19';
var actual : string;
begin
  // 008a8674-1958-45b5-b8e6-c2c9960d973a
  actual  := Meetup.meetup(2013, 6, 'teenth', 'Wednesday');
  message := EncodeJsonMessage('when teenth Wednesday is the 19th, the last day of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_thursday_is_some_day_in_the_middle_of_the_teenth_week;
const expected = '2013-05-16';
var actual : string;
begin
  // e4abd5e3-57cb-4091-8420-d97e955c0dbd
  actual  := Meetup.meetup(2013, 5, 'teenth', 'Thursday');
  message := EncodeJsonMessage('when teenth Thursday is some day in the middle of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_thursday_is_the_13th_the_first_day_of_the_teenth_week;
const expected = '2013-06-13';
var actual : string;
begin
  // 85da0b0f-eace-4297-a6dd-63588d5055b4
  actual  := Meetup.meetup(2013, 6, 'teenth', 'Thursday');
  message := EncodeJsonMessage('when teenth Thursday is the 13th, the first day of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_thursday_is_the_19th_the_last_day_of_the_teenth_week;
const expected = '2013-09-19';
var actual : string;
begin
  // ecf64f9b-8413-489b-bf6e-128045f70bcc
  actual  := Meetup.meetup(2013, 9, 'teenth', 'Thursday');
  message := EncodeJsonMessage('when teenth Thursday is the 19th, the last day of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_friday_is_the_19th_the_last_day_of_the_teenth_week;
const expected = '2013-04-19';
var actual : string;
begin
  // ac4e180c-7d0a-4d3d-b05f-f564ebb584ca
  actual  := Meetup.meetup(2013, 4, 'teenth', 'Friday');
  message := EncodeJsonMessage('when teenth Friday is the 19th, the last day of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_friday_is_some_day_in_the_middle_of_the_teenth_week;
const expected = '2013-08-16';
var actual : string;
begin
  // b79101c7-83ad-4f8f-8ec8-591683296315
  actual  := Meetup.meetup(2013, 8, 'teenth', 'Friday');
  message := EncodeJsonMessage('when teenth Friday is some day in the middle of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_friday_is_the_13th_the_first_day_of_the_teenth_week;
const expected = '2013-09-13';
var actual : string;
begin
  // 6ed38b9f-0072-4901-bd97-7c8b8b0ef1b8
  actual  := Meetup.meetup(2013, 9, 'teenth', 'Friday');
  message := EncodeJsonMessage('when teenth Friday is the 13th, the first day of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_saturday_is_some_day_in_the_middle_of_the_teenth_week;
const expected = '2013-02-16';
var actual : string;
begin
  // dfae03ed-9610-47de-a632-655ab01e1e7c
  actual  := Meetup.meetup(2013, 2, 'teenth', 'Saturday');
  message := EncodeJsonMessage('when teenth Saturday is some day in the middle of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_saturday_is_the_13th_the_first_day_of_the_teenth_week;
const expected = '2013-04-13';
var actual : string;
begin
  // ec02e3e1-fc72-4a3c-872f-a53fa8ab358e
  actual  := Meetup.meetup(2013, 4, 'teenth', 'Saturday');
  message := EncodeJsonMessage('when teenth Saturday is the 13th, the first day of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_saturday_is_the_19th_the_last_day_of_the_teenth_week;
const expected = '2013-10-19';
var actual : string;
begin
  // d983094b-7259-4195-b84e-5d09578c89d9
  actual  := Meetup.meetup(2013, 10, 'teenth', 'Saturday');
  message := EncodeJsonMessage('when teenth Saturday is the 19th, the last day of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_sunday_is_the_19th_the_last_day_of_the_teenth_week;
const expected = '2013-05-19';
var actual : string;
begin
  // d84a2a2e-f745-443a-9368-30051be60c2e
  actual  := Meetup.meetup(2013, 5, 'teenth', 'Sunday');
  message := EncodeJsonMessage('when teenth Sunday is the 19th, the last day of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_sunday_is_some_day_in_the_middle_of_the_teenth_week;
const expected = '2013-06-16';
var actual : string;
begin
  // 0e64bc53-92a3-4f61-85b2-0b7168c7ce5a
  actual  := Meetup.meetup(2013, 6, 'teenth', 'Sunday');
  message := EncodeJsonMessage('when teenth Sunday is some day in the middle of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_teenth_sunday_is_the_13th_the_first_day_of_the_teenth_week;
const expected = '2013-10-13';
var actual : string;
begin
  // de87652c-185e-4854-b3ae-04cf6150eead
  actual  := Meetup.meetup(2013, 10, 'teenth', 'Sunday');
  message := EncodeJsonMessage('when teenth Sunday is the 13th, the first day of the teenth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_first_monday_is_some_day_in_the_middle_of_the_first_week;
const expected = '2013-03-04';
var actual : string;
begin
  // 2cbfd0f5-ba3a-46da-a8cc-0fe4966d3411
  actual  := Meetup.meetup(2013, 3, 'first', 'Monday');
  message := EncodeJsonMessage('when first Monday is some day in the middle of the first week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_first_monday_is_the_1st_the_first_day_of_the_first_week;
const expected = '2013-04-01';
var actual : string;
begin
  // a6168c7c-ed95-4bb3-8f92-c72575fc64b0
  actual  := Meetup.meetup(2013, 4, 'first', 'Monday');
  message := EncodeJsonMessage('when first Monday is the 1st, the first day of the first week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_first_tuesday_is_the_7th_the_last_day_of_the_first_week;
const expected = '2013-05-07';
var actual : string;
begin
  // 1bfc620f-1c54-4bbd-931f-4a1cd1036c20
  actual  := Meetup.meetup(2013, 5, 'first', 'Tuesday');
  message := EncodeJsonMessage('when first Tuesday is the 7th, the last day of the first week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_first_tuesday_is_some_day_in_the_middle_of_the_first_week;
const expected = '2013-06-04';
var actual : string;
begin
  // 12959c10-7362-4ca0-a048-50cf1c06e3e2
  actual  := Meetup.meetup(2013, 6, 'first', 'Tuesday');
  message := EncodeJsonMessage('when first Tuesday is some day in the middle of the first week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_first_wednesday_is_some_day_in_the_middle_of_the_first_week;
const expected = '2013-07-03';
var actual : string;
begin
  // 1033dc66-8d0b-48a1-90cb-270703d59d1d
  actual  := Meetup.meetup(2013, 7, 'first', 'Wednesday');
  message := EncodeJsonMessage('when first Wednesday is some day in the middle of the first week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_first_wednesday_is_the_7th_the_last_day_of_the_first_week;
const expected = '2013-08-07';
var actual : string;
begin
  // b89185b9-2f32-46f4-a602-de20b09058f6
  actual  := Meetup.meetup(2013, 8, 'first', 'Wednesday');
  message := EncodeJsonMessage('when first Wednesday is the 7th, the last day of the first week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_first_thursday_is_some_day_in_the_middle_of_the_first_week;
const expected = '2013-09-05';
var actual : string;
begin
  // 53aedc4d-b2c8-4dfb-abf7-a8dc9cdceed5
  actual  := Meetup.meetup(2013, 9, 'first', 'Thursday');
  message := EncodeJsonMessage('when first Thursday is some day in the middle of the first week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_first_thursday_is_another_day_in_the_middle_of_the_first_week;
const expected = '2013-10-03';
var actual : string;
begin
  // b420a7e3-a94c-4226-870a-9eb3a92647f0
  actual  := Meetup.meetup(2013, 10, 'first', 'Thursday');
  message := EncodeJsonMessage('when first Thursday is another day in the middle of the first week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_first_friday_is_the_1st_the_first_day_of_the_first_week;
const expected = '2013-11-01';
var actual : string;
begin
  // 61df3270-28b4-4713-bee2-566fa27302ca
  actual  := Meetup.meetup(2013, 11, 'first', 'Friday');
  message := EncodeJsonMessage('when first Friday is the 1st, the first day of the first week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_first_friday_is_some_day_in_the_middle_of_the_first_week;
const expected = '2013-12-06';
var actual : string;
begin
  // cad33d4d-595c-412f-85cf-3874c6e07abf
  actual  := Meetup.meetup(2013, 12, 'first', 'Friday');
  message := EncodeJsonMessage('when first Friday is some day in the middle of the first week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_first_saturday_is_some_day_in_the_middle_of_the_first_week;
const expected = '2013-01-05';
var actual : string;
begin
  // a2869b52-5bba-44f0-a863-07bd1f67eadb
  actual  := Meetup.meetup(2013, 1, 'first', 'Saturday');
  message := EncodeJsonMessage('when first Saturday is some day in the middle of the first week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_first_saturday_is_another_day_in_the_middle_of_the_first_week;
const expected = '2013-02-02';
var actual : string;
begin
  // 3585315a-d0db-4ea1-822e-0f22e2a645f5
  actual  := Meetup.meetup(2013, 2, 'first', 'Saturday');
  message := EncodeJsonMessage('when first Saturday is another day in the middle of the first week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_first_sunday_is_some_day_in_the_middle_of_the_first_week;
const expected = '2013-03-03';
var actual : string;
begin
  // c49e9bd9-8ccf-4cf2-947a-0ccd4e4f10b1
  actual  := Meetup.meetup(2013, 3, 'first', 'Sunday');
  message := EncodeJsonMessage('when first Sunday is some day in the middle of the first week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_first_sunday_is_the_7th_the_last_day_of_the_first_week;
const expected = '2013-04-07';
var actual : string;
begin
  // 1513328b-df53-4714-8677-df68c4f9366c
  actual  := Meetup.meetup(2013, 4, 'first', 'Sunday');
  message := EncodeJsonMessage('when first Sunday is the 7th, the last day of the first week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_second_monday_is_some_day_in_the_middle_of_the_second_week;
const expected = '2013-03-11';
var actual : string;
begin
  // 49e083af-47ec-4018-b807-62ef411efed7
  actual  := Meetup.meetup(2013, 3, 'second', 'Monday');
  message := EncodeJsonMessage('when second Monday is some day in the middle of the second week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_second_monday_is_the_8th_the_first_day_of_the_second_week;
const expected = '2013-04-08';
var actual : string;
begin
  // 6cb79a73-38fe-4475-9101-9eec36cf79e5
  actual  := Meetup.meetup(2013, 4, 'second', 'Monday');
  message := EncodeJsonMessage('when second Monday is the 8th, the first day of the second week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_second_tuesday_is_the_14th_the_last_day_of_the_second_week;
const expected = '2013-05-14';
var actual : string;
begin
  // 4c39b594-af7e-4445-aa03-bf4f8effd9a1
  actual  := Meetup.meetup(2013, 5, 'second', 'Tuesday');
  message := EncodeJsonMessage('when second Tuesday is the 14th, the last day of the second week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_second_tuesday_is_some_day_in_the_middle_of_the_second_week;
const expected = '2013-06-11';
var actual : string;
begin
  // 41b32c34-2e39-40e3-b790-93539aaeb6dd
  actual  := Meetup.meetup(2013, 6, 'second', 'Tuesday');
  message := EncodeJsonMessage('when second Tuesday is some day in the middle of the second week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_second_wednesday_is_some_day_in_the_middle_of_the_second_week;
const expected = '2013-07-10';
var actual : string;
begin
  // 90a160c5-b5d9-4831-927f-63a78b17843d
  actual  := Meetup.meetup(2013, 7, 'second', 'Wednesday');
  message := EncodeJsonMessage('when second Wednesday is some day in the middle of the second week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_second_wednesday_is_the_14th_the_last_day_of_the_second_week;
const expected = '2013-08-14';
var actual : string;
begin
  // 23b98ce7-8dd5-41a1-9310-ef27209741cb
  actual  := Meetup.meetup(2013, 8, 'second', 'Wednesday');
  message := EncodeJsonMessage('when second Wednesday is the 14th, the last day of the second week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_second_thursday_is_some_day_in_the_middle_of_the_second_week;
const expected = '2013-09-12';
var actual : string;
begin
  // 447f1960-27ca-4729-bc3f-f36043f43ed0
  actual  := Meetup.meetup(2013, 9, 'second', 'Thursday');
  message := EncodeJsonMessage('when second Thursday is some day in the middle of the second week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_second_thursday_is_another_day_in_the_middle_of_the_second_week;
const expected = '2013-10-10';
var actual : string;
begin
  // c9aa2687-300c-4e79-86ca-077849a81bde
  actual  := Meetup.meetup(2013, 10, 'second', 'Thursday');
  message := EncodeJsonMessage('when second Thursday is another day in the middle of the second week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_second_friday_is_the_8th_the_first_day_of_the_second_week;
const expected = '2013-11-08';
var actual : string;
begin
  // a7e11ef3-6625-4134-acda-3e7195421c09
  actual  := Meetup.meetup(2013, 11, 'second', 'Friday');
  message := EncodeJsonMessage('when second Friday is the 8th, the first day of the second week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_second_friday_is_some_day_in_the_middle_of_the_second_week;
const expected = '2013-12-13';
var actual : string;
begin
  // 8b420e5f-9290-4106-b5ae-022f3e2a3e41
  actual  := Meetup.meetup(2013, 12, 'second', 'Friday');
  message := EncodeJsonMessage('when second Friday is some day in the middle of the second week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_second_saturday_is_some_day_in_the_middle_of_the_second_week;
const expected = '2013-01-12';
var actual : string;
begin
  // 80631afc-fc11-4546-8b5f-c12aaeb72b4f
  actual  := Meetup.meetup(2013, 1, 'second', 'Saturday');
  message := EncodeJsonMessage('when second Saturday is some day in the middle of the second week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_second_saturday_is_another_day_in_the_middle_of_the_second_week;
const expected = '2013-02-09';
var actual : string;
begin
  // e34d43ac-f470-44c2-aa5f-e97b78ecaf83
  actual  := Meetup.meetup(2013, 2, 'second', 'Saturday');
  message := EncodeJsonMessage('when second Saturday is another day in the middle of the second week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_second_sunday_is_some_day_in_the_middle_of_the_second_week;
const expected = '2013-03-10';
var actual : string;
begin
  // a57d59fd-1023-47ad-b0df-a6feb21b44fc
  actual  := Meetup.meetup(2013, 3, 'second', 'Sunday');
  message := EncodeJsonMessage('when second Sunday is some day in the middle of the second week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_second_sunday_is_the_14th_the_last_day_of_the_second_week;
const expected = '2013-04-14';
var actual : string;
begin
  // a829a8b0-abdd-4ad1-b66c-5560d843c91a
  actual  := Meetup.meetup(2013, 4, 'second', 'Sunday');
  message := EncodeJsonMessage('when second Sunday is the 14th, the last day of the second week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_third_monday_is_some_day_in_the_middle_of_the_third_week;
const expected = '2013-03-18';
var actual : string;
begin
  // 501a8a77-6038-4fc0-b74c-33634906c29d
  actual  := Meetup.meetup(2013, 3, 'third', 'Monday');
  message := EncodeJsonMessage('when third Monday is some day in the middle of the third week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_third_monday_is_the_15th_the_first_day_of_the_third_week;
const expected = '2013-04-15';
var actual : string;
begin
  // 49e4516e-cf32-4a58-8bbc-494b7e851c92
  actual  := Meetup.meetup(2013, 4, 'third', 'Monday');
  message := EncodeJsonMessage('when third Monday is the 15th, the first day of the third week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_third_tuesday_is_the_21st_the_last_day_of_the_third_week;
const expected = '2013-05-21';
var actual : string;
begin
  // 4db61095-f7c7-493c-85f1-9996ad3012c7
  actual  := Meetup.meetup(2013, 5, 'third', 'Tuesday');
  message := EncodeJsonMessage('when third Tuesday is the 21st, the last day of the third week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_third_tuesday_is_some_day_in_the_middle_of_the_third_week;
const expected = '2013-06-18';
var actual : string;
begin
  // 714fc2e3-58d0-4b91-90fd-61eefd2892c0
  actual  := Meetup.meetup(2013, 6, 'third', 'Tuesday');
  message := EncodeJsonMessage('when third Tuesday is some day in the middle of the third week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_third_wednesday_is_some_day_in_the_middle_of_the_third_week;
const expected = '2013-07-17';
var actual : string;
begin
  // b08a051a-2c80-445b-9b0e-524171a166d1
  actual  := Meetup.meetup(2013, 7, 'third', 'Wednesday');
  message := EncodeJsonMessage('when third Wednesday is some day in the middle of the third week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_third_wednesday_is_the_21st_the_last_day_of_the_third_week;
const expected = '2013-08-21';
var actual : string;
begin
  // 80bb9eff-3905-4c61-8dc9-bb03016d8ff8
  actual  := Meetup.meetup(2013, 8, 'third', 'Wednesday');
  message := EncodeJsonMessage('when third Wednesday is the 21st, the last day of the third week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_third_thursday_is_some_day_in_the_middle_of_the_third_week;
const expected = '2013-09-19';
var actual : string;
begin
  // fa52a299-f77f-4784-b290-ba9189fbd9c9
  actual  := Meetup.meetup(2013, 9, 'third', 'Thursday');
  message := EncodeJsonMessage('when third Thursday is some day in the middle of the third week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_third_thursday_is_another_day_in_the_middle_of_the_third_week;
const expected = '2013-10-17';
var actual : string;
begin
  // f74b1bc6-cc5c-4bf1-ba69-c554a969eb38
  actual  := Meetup.meetup(2013, 10, 'third', 'Thursday');
  message := EncodeJsonMessage('when third Thursday is another day in the middle of the third week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_third_friday_is_the_15th_the_first_day_of_the_third_week;
const expected = '2013-11-15';
var actual : string;
begin
  // 8900f3b0-801a-466b-a866-f42d64667abd
  actual  := Meetup.meetup(2013, 11, 'third', 'Friday');
  message := EncodeJsonMessage('when third Friday is the 15th, the first day of the third week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_third_friday_is_some_day_in_the_middle_of_the_third_week;
const expected = '2013-12-20';
var actual : string;
begin
  // 538ac405-a091-4314-9ccd-920c4e38e85e
  actual  := Meetup.meetup(2013, 12, 'third', 'Friday');
  message := EncodeJsonMessage('when third Friday is some day in the middle of the third week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_third_saturday_is_some_day_in_the_middle_of_the_third_week;
const expected = '2013-01-19';
var actual : string;
begin
  // 244db35c-2716-4fa0-88ce-afd58e5cf910
  actual  := Meetup.meetup(2013, 1, 'third', 'Saturday');
  message := EncodeJsonMessage('when third Saturday is some day in the middle of the third week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_third_saturday_is_another_day_in_the_middle_of_the_third_week;
const expected = '2013-02-16';
var actual : string;
begin
  // dd28544f-f8fa-4f06-9bcd-0ad46ce68e9e
  actual  := Meetup.meetup(2013, 2, 'third', 'Saturday');
  message := EncodeJsonMessage('when third Saturday is another day in the middle of the third week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_third_sunday_is_some_day_in_the_middle_of_the_third_week;
const expected = '2013-03-17';
var actual : string;
begin
  // be71dcc6-00d2-4b53-a369-cbfae55b312f
  actual  := Meetup.meetup(2013, 3, 'third', 'Sunday');
  message := EncodeJsonMessage('when third Sunday is some day in the middle of the third week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_third_sunday_is_the_21st_the_last_day_of_the_third_week;
const expected = '2013-04-21';
var actual : string;
begin
  // b7d2da84-4290-4ee6-a618-ee124ae78be7
  actual  := Meetup.meetup(2013, 4, 'third', 'Sunday');
  message := EncodeJsonMessage('when third Sunday is the 21st, the last day of the third week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_fourth_monday_is_some_day_in_the_middle_of_the_fourth_week;
const expected = '2013-03-25';
var actual : string;
begin
  // 4276dc06-a1bd-4fc2-b6c2-625fee90bc88
  actual  := Meetup.meetup(2013, 3, 'fourth', 'Monday');
  message := EncodeJsonMessage('when fourth Monday is some day in the middle of the fourth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_fourth_monday_is_the_22nd_the_first_day_of_the_fourth_week;
const expected = '2013-04-22';
var actual : string;
begin
  // ddbd7976-2deb-4250-8a38-925ac1a8e9a2
  actual  := Meetup.meetup(2013, 4, 'fourth', 'Monday');
  message := EncodeJsonMessage('when fourth Monday is the 22nd, the first day of the fourth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_fourth_tuesday_is_the_28th_the_last_day_of_the_fourth_week;
const expected = '2013-05-28';
var actual : string;
begin
  // eb714ef4-1656-47cc-913c-844dba4ebddd
  actual  := Meetup.meetup(2013, 5, 'fourth', 'Tuesday');
  message := EncodeJsonMessage('when fourth Tuesday is the 28th, the last day of the fourth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_fourth_tuesday_is_some_day_in_the_middle_of_the_fourth_week;
const expected = '2013-06-25';
var actual : string;
begin
  // 16648435-7937-4d2d-b118-c3e38fd084bd
  actual  := Meetup.meetup(2013, 6, 'fourth', 'Tuesday');
  message := EncodeJsonMessage('when fourth Tuesday is some day in the middle of the fourth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_fourth_wednesday_is_some_day_in_the_middle_of_the_fourth_week;
const expected = '2013-07-24';
var actual : string;
begin
  // de062bdc-9484-437a-a8c5-5253c6f6785a
  actual  := Meetup.meetup(2013, 7, 'fourth', 'Wednesday');
  message := EncodeJsonMessage('when fourth Wednesday is some day in the middle of the fourth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_fourth_wednesday_is_the_28th_the_last_day_of_the_fourth_week;
const expected = '2013-08-28';
var actual : string;
begin
  // c2ce6821-169c-4832-8d37-690ef5d9514a
  actual  := Meetup.meetup(2013, 8, 'fourth', 'Wednesday');
  message := EncodeJsonMessage('when fourth Wednesday is the 28th, the last day of the fourth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_fourth_thursday_is_some_day_in_the_middle_of_the_fourth_week;
const expected = '2013-09-26';
var actual : string;
begin
  // d462c631-2894-4391-a8e3-dbb98b7a7303
  actual  := Meetup.meetup(2013, 9, 'fourth', 'Thursday');
  message := EncodeJsonMessage('when fourth Thursday is some day in the middle of the fourth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_fourth_thursday_is_another_day_in_the_middle_of_the_fourth_week;
const expected = '2013-10-24';
var actual : string;
begin
  // 9ff1f7b6-1b72-427d-9ee9-82b5bb08b835
  actual  := Meetup.meetup(2013, 10, 'fourth', 'Thursday');
  message := EncodeJsonMessage('when fourth Thursday is another day in the middle of the fourth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_fourth_friday_is_the_22nd_the_first_day_of_the_fourth_week;
const expected = '2013-11-22';
var actual : string;
begin
  // 83bae8ba-1c49-49bc-b632-b7c7e1d7e35f
  actual  := Meetup.meetup(2013, 11, 'fourth', 'Friday');
  message := EncodeJsonMessage('when fourth Friday is the 22nd, the first day of the fourth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_fourth_friday_is_some_day_in_the_middle_of_the_fourth_week;
const expected = '2013-12-27';
var actual : string;
begin
  // de752d2a-a95e-48d2-835b-93363dac3710
  actual  := Meetup.meetup(2013, 12, 'fourth', 'Friday');
  message := EncodeJsonMessage('when fourth Friday is some day in the middle of the fourth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_fourth_saturday_is_some_day_in_the_middle_of_the_fourth_week;
const expected = '2013-01-26';
var actual : string;
begin
  // eedd90ad-d581-45db-8312-4c6dcf9cf560
  actual  := Meetup.meetup(2013, 1, 'fourth', 'Saturday');
  message := EncodeJsonMessage('when fourth Saturday is some day in the middle of the fourth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_fourth_saturday_is_another_day_in_the_middle_of_the_fourth_week;
const expected = '2013-02-23';
var actual : string;
begin
  // 669fedcd-912e-48c7-a0a1-228b34af91d0
  actual  := Meetup.meetup(2013, 2, 'fourth', 'Saturday');
  message := EncodeJsonMessage('when fourth Saturday is another day in the middle of the fourth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_fourth_sunday_is_some_day_in_the_middle_of_the_fourth_week;
const expected = '2013-03-24';
var actual : string;
begin
  // 648e3849-ea49-44a5-a8a3-9f2a43b3bf1b
  actual  := Meetup.meetup(2013, 3, 'fourth', 'Sunday');
  message := EncodeJsonMessage('when fourth Sunday is some day in the middle of the fourth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_fourth_sunday_is_the_28th_the_last_day_of_the_fourth_week;
const expected = '2013-04-28';
var actual : string;
begin
  // f81321b3-99ab-4db6-9267-69c5da5a7823
  actual  := Meetup.meetup(2013, 4, 'fourth', 'Sunday');
  message := EncodeJsonMessage('when fourth Sunday is the 28th, the last day of the fourth week', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.last_monday_in_a_month_with_four_mondays;
const expected = '2013-03-25';
var actual : string;
begin
  // 1af5e51f-5488-4548-aee8-11d7d4a730dc
  actual  := Meetup.meetup(2013, 3, 'last', 'Monday');
  message := EncodeJsonMessage('last Monday in a month with four Mondays', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.last_monday_in_a_month_with_five_mondays;
const expected = '2013-04-29';
var actual : string;
begin
  // f29999f2-235e-4ec7-9dab-26f137146526
  actual  := Meetup.meetup(2013, 4, 'last', 'Monday');
  message := EncodeJsonMessage('last Monday in a month with five Mondays', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.last_tuesday_in_a_month_with_four_tuesdays;
const expected = '2013-05-28';
var actual : string;
begin
  // 31b097a0-508e-48ac-bf8a-f63cdcf6dc41
  actual  := Meetup.meetup(2013, 5, 'last', 'Tuesday');
  message := EncodeJsonMessage('last Tuesday in a month with four Tuesdays', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.last_tuesday_in_another_month_with_four_tuesdays;
const expected = '2013-06-25';
var actual : string;
begin
  // 8c022150-0bb5-4a1f-80f9-88b2e2abcba4
  actual  := Meetup.meetup(2013, 6, 'last', 'Tuesday');
  message := EncodeJsonMessage('last Tuesday in another month with four Tuesdays', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.last_wednesday_in_a_month_with_five_wednesdays;
const expected = '2013-07-31';
var actual : string;
begin
  // 0e762194-672a-4bdf-8a37-1e59fdacef12
  actual  := Meetup.meetup(2013, 7, 'last', 'Wednesday');
  message := EncodeJsonMessage('last Wednesday in a month with five Wednesdays', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.last_wednesday_in_a_month_with_four_wednesdays;
const expected = '2013-08-28';
var actual : string;
begin
  // 5016386a-f24e-4bd7-b439-95358f491b66
  actual  := Meetup.meetup(2013, 8, 'last', 'Wednesday');
  message := EncodeJsonMessage('last Wednesday in a month with four Wednesdays', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.last_thursday_in_a_month_with_four_thursdays;
const expected = '2013-09-26';
var actual : string;
begin
  // 12ead1a5-cdf9-4192-9a56-2229e93dd149
  actual  := Meetup.meetup(2013, 9, 'last', 'Thursday');
  message := EncodeJsonMessage('last Thursday in a month with four Thursdays', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.last_thursday_in_a_month_with_five_thursdays;
const expected = '2013-10-31';
var actual : string;
begin
  // 7db89e11-7fbe-4e57-ae3c-0f327fbd7cc7
  actual  := Meetup.meetup(2013, 10, 'last', 'Thursday');
  message := EncodeJsonMessage('last Thursday in a month with five Thursdays', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.last_friday_in_a_month_with_five_fridays;
const expected = '2013-11-29';
var actual : string;
begin
  // e47a739e-b979-460d-9c8a-75c35ca2290b
  actual  := Meetup.meetup(2013, 11, 'last', 'Friday');
  message := EncodeJsonMessage('last Friday in a month with five Fridays', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.last_friday_in_a_month_with_four_fridays;
const expected = '2013-12-27';
var actual : string;
begin
  // 5bed5aa9-a57a-4e5d-8997-2cc796a5b0ec
  actual  := Meetup.meetup(2013, 12, 'last', 'Friday');
  message := EncodeJsonMessage('last Friday in a month with four Fridays', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.last_saturday_in_a_month_with_four_saturdays;
const expected = '2013-01-26';
var actual : string;
begin
  // 61e54cba-76f3-4772-a2b1-bf443fda2137
  actual  := Meetup.meetup(2013, 1, 'last', 'Saturday');
  message := EncodeJsonMessage('last Saturday in a month with four Saturdays', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.last_saturday_in_another_month_with_four_saturdays;
const expected = '2013-02-23';
var actual : string;
begin
  // 8b6a737b-2fa9-444c-b1a2-80ce7a2ec72f
  actual  := Meetup.meetup(2013, 2, 'last', 'Saturday');
  message := EncodeJsonMessage('last Saturday in another month with four Saturdays', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.last_sunday_in_a_month_with_five_sundays;
const expected = '2013-03-31';
var actual : string;
begin
  // 0b63e682-f429-4d19-9809-4a45bd0242dc
  actual  := Meetup.meetup(2013, 3, 'last', 'Sunday');
  message := EncodeJsonMessage('last Sunday in a month with five Sundays', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.last_sunday_in_a_month_with_four_sundays;
const expected = '2013-04-28';
var actual : string;
begin
  // 5232307e-d3e3-4afc-8ba6-4084ad987c00
  actual  := Meetup.meetup(2013, 4, 'last', 'Sunday');
  message := EncodeJsonMessage('last Sunday in a month with four Sundays', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_last_wednesday_in_february_in_a_leap_year_is_the_29th;
const expected = '2012-02-29';
var actual : string;
begin
  // 0bbd48e8-9773-4e81-8e71-b9a51711e3c5
  actual  := Meetup.meetup(2012, 2, 'last', 'Wednesday');
  message := EncodeJsonMessage('when last Wednesday in February in a leap year is the 29th', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.last_wednesday_in_december_that_is_also_the_last_day_of_the_year;
const expected = '2014-12-31';
var actual : string;
begin
  // fe0936de-7eee-4a48-88dd-66c07ab1fefc
  actual  := Meetup.meetup(2014, 12, 'last', 'Wednesday');
  message := EncodeJsonMessage('last Wednesday in December that is also the last day of the year', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_last_sunday_in_february_in_a_non_leap_year_is_not_the_29th;
const expected = '2015-02-22';
var actual : string;
begin
  // 2ccf2488-aafc-4671-a24e-2b6effe1b0e2
  actual  := Meetup.meetup(2015, 2, 'last', 'Sunday');
  message := EncodeJsonMessage('when last Sunday in February in a non-leap year is not the 29th', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure MeetupTest.when_first_friday_is_the_7th_the_last_day_of_the_first_week;
const expected = '2012-12-07';
var actual : string;
begin
  // 00c3ce9f-cf36-4b70-90d8-92b32be6830e
  actual  := Meetup.meetup(2012, 12, 'first', 'Friday');
  message := EncodeJsonMessage('when first Friday is the 7th, the last day of the first week', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(MeetupTest);

end.
