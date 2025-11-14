unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ClockTest = class(TTestCase)
  published
    procedure on_the_hour;
    procedure past_the_hour;
    procedure midnight_is_zero_hours;
    procedure hour_rolls_over;
    procedure hour_rolls_over_continuously;
    procedure sixty_minutes_is_next_hour;
    procedure minutes_roll_over;
    procedure minutes_roll_over_continuously;
    procedure hour_and_minutes_roll_over;
    procedure hour_and_minutes_roll_over_continuously;
    procedure hour_and_minutes_roll_over_to_exactly_midnight;
    procedure negative_hour;
    procedure negative_hour_rolls_over;
    procedure negative_hour_rolls_over_continuously;
    procedure negative_minutes;
    procedure negative_minutes_roll_over;
    procedure negative_minutes_roll_over_continuously;
    procedure negative_sixty_minutes_is_previous_hour;
    procedure negative_hour_and_minutes_both_roll_over;
    procedure negative_hour_and_minutes_both_roll_over_continuously;
    procedure add_minutes;
    procedure add_no_minutes;
    procedure add_to_next_hour;
    procedure add_more_than_one_hour;
    procedure add_more_than_two_hours_with_carry;
    procedure add_across_midnight;
    procedure add_more_than_one_day_1500_min_equal_25_hrs;
    procedure add_more_than_two_days;
    procedure subtract_minutes;
    procedure subtract_to_previous_hour;
    procedure subtract_more_than_an_hour;
    procedure subtract_across_midnight;
    procedure subtract_more_than_two_hours;
    procedure subtract_more_than_two_hours_with_borrow;
    procedure subtract_more_than_one_day_1500_min_equal_25_hrs;
    procedure subtract_more_than_two_days;
    procedure clocks_with_same_time;
    procedure clocks_a_minute_apart;
    procedure clocks_an_hour_apart;
    procedure clocks_with_hour_overflow;
    procedure clocks_with_hour_overflow_by_several_days;
    procedure clocks_with_negative_hour;
    procedure clocks_with_negative_hour_that_wraps;
    procedure clocks_with_negative_hour_that_wraps_multiple_times;
    procedure clocks_with_minute_overflow;
    procedure clocks_with_minute_overflow_by_several_days;
    procedure clocks_with_negative_minute;
    procedure clocks_with_negative_minute_that_wraps;
    procedure clocks_with_negative_minute_that_wraps_multiple_times;
    procedure clocks_with_negative_hours_and_minutes;
    procedure clocks_with_negative_hours_and_minutes_that_wrap;
    procedure full_clock_and_zeroed_clock;
  end;

implementation

uses Clock;

// a577bacc-106b-496e-9792-b3083ea8705e
procedure ClockTest.on_the_hour;
begin
  TapAssertTrue(Self, 'on the hour', '08:00', Clock.create(8, 0));
end;

// b5d0c360-3b88-489b-8e84-68a1c7a4fa23
procedure ClockTest.past_the_hour;
begin
  TapAssertTrue(Self, 'past the hour', '11:09', Clock.create(11, 9));
end;

// 473223f4-65f3-46ff-a9f7-7663c7e59440
procedure ClockTest.midnight_is_zero_hours;
begin
  TapAssertTrue(Self, 'midnight is zero hours', '00:00', Clock.create(24, 0));
end;

// ca95d24a-5924-447d-9a96-b91c8334725c
procedure ClockTest.hour_rolls_over;
begin
  TapAssertTrue(Self, 'hour rolls over', '01:00', Clock.create(25, 0));
end;

// f3826de0-0925-4d69-8ac8-89aea7e52b78
procedure ClockTest.hour_rolls_over_continuously;
begin
  TapAssertTrue(Self, 'hour rolls over continuously', '04:00', Clock.create(100, 0));
end;

// a02f7edf-dfd4-4b11-b21a-86de3cc6a95c
procedure ClockTest.sixty_minutes_is_next_hour;
begin
  TapAssertTrue(Self, 'sixty minutes is next hour', '02:00', Clock.create(1, 60));
end;

// 8f520df6-b816-444d-b90f-8a477789beb5
procedure ClockTest.minutes_roll_over;
begin
  TapAssertTrue(Self, 'minutes roll over', '02:40', Clock.create(0, 160));
end;

// c75c091b-47ac-4655-8d40-643767fc4eed
procedure ClockTest.minutes_roll_over_continuously;
begin
  TapAssertTrue(Self, 'minutes roll over continuously', '04:43', Clock.create(0, 1723));
end;

// 06343ecb-cf39-419d-a3f5-dcbae0cc4c57
procedure ClockTest.hour_and_minutes_roll_over;
begin
  TapAssertTrue(Self, 'hour and minutes roll over', '03:40', Clock.create(25, 160));
end;

// be60810e-f5d9-4b58-9351-a9d1e90e660c
procedure ClockTest.hour_and_minutes_roll_over_continuously;
begin
  TapAssertTrue(Self, 'hour and minutes roll over continuously', '11:01', Clock.create(201, 3001));
end;

// 1689107b-0b5c-4bea-aad3-65ec9859368a
procedure ClockTest.hour_and_minutes_roll_over_to_exactly_midnight;
begin
  TapAssertTrue(Self, 'hour and minutes roll over to exactly midnight', '00:00', Clock.create(72, 8640));
end;

// d3088ee8-91b7-4446-9e9d-5e2ad6219d91
procedure ClockTest.negative_hour;
begin
  TapAssertTrue(Self, 'negative hour', '23:15', Clock.create(-1, 15));
end;

// 77ef6921-f120-4d29-bade-80d54aa43b54
procedure ClockTest.negative_hour_rolls_over;
begin
  TapAssertTrue(Self, 'negative hour rolls over', '23:00', Clock.create(-25, 0));
end;

// 359294b5-972f-4546-bb9a-a85559065234
procedure ClockTest.negative_hour_rolls_over_continuously;
begin
  TapAssertTrue(Self, 'negative hour rolls over continuously', '05:00', Clock.create(-91, 0));
end;

// 509db8b7-ac19-47cc-bd3a-a9d2f30b03c0
procedure ClockTest.negative_minutes;
begin
  TapAssertTrue(Self, 'negative minutes', '00:20', Clock.create(1, -40));
end;

// 5d6bb225-130f-4084-84fd-9e0df8996f2a
procedure ClockTest.negative_minutes_roll_over;
begin
  TapAssertTrue(Self, 'negative minutes roll over', '22:20', Clock.create(1, -160));
end;

// d483ceef-b520-4f0c-b94a-8d2d58cf0484
procedure ClockTest.negative_minutes_roll_over_continuously;
begin
  TapAssertTrue(Self, 'negative minutes roll over continuously', '16:40', Clock.create(1, -4820));
end;

// 1cd19447-19c6-44bf-9d04-9f8305ccb9ea
procedure ClockTest.negative_sixty_minutes_is_previous_hour;
begin
  TapAssertTrue(Self, 'negative sixty minutes is previous hour', '01:00', Clock.create(2, -60));
end;

// 9d3053aa-4f47-4afc-bd45-d67a72cef4dc
procedure ClockTest.negative_hour_and_minutes_both_roll_over;
begin
  TapAssertTrue(Self, 'negative hour and minutes both roll over', '20:20', Clock.create(-25, -160));
end;

// 51d41fcf-491e-4ca0-9cae-2aa4f0163ad4
procedure ClockTest.negative_hour_and_minutes_both_roll_over_continuously;
begin
  TapAssertTrue(Self, 'negative hour and minutes both roll over continuously', '22:10', Clock.create(-121, -5810));
end;

// d098e723-ad29-4ef9-997a-2693c4c9d89a
procedure ClockTest.add_minutes;
begin
  TapAssertTrue(Self, 'add minutes', '10:03', Clock.add(10, 0, 3));
end;

// b6ec8f38-e53e-4b22-92a7-60dab1f485f4
procedure ClockTest.add_no_minutes;
begin
  TapAssertTrue(Self, 'add no minutes', '06:41', Clock.add(6, 41, 0));
end;

// efd349dd-0785-453e-9ff8-d7452a8e7269
procedure ClockTest.add_to_next_hour;
begin
  TapAssertTrue(Self, 'add to next hour', '01:25', Clock.add(0, 45, 40));
end;

// 749890f7-aba9-4702-acce-87becf4ef9fe
procedure ClockTest.add_more_than_one_hour;
begin
  TapAssertTrue(Self, 'add more than one hour', '11:01', Clock.add(10, 0, 61));
end;

// da63e4c1-1584-46e3-8d18-c9dc802c1713
procedure ClockTest.add_more_than_two_hours_with_carry;
begin
  TapAssertTrue(Self, 'add more than two hours with carry', '03:25', Clock.add(0, 45, 160));
end;

// be167a32-3d33-4cec-a8bc-accd47ddbb71
procedure ClockTest.add_across_midnight;
begin
  TapAssertTrue(Self, 'add across midnight', '00:01', Clock.add(23, 59, 2));
end;

// 6672541e-cdae-46e4-8be7-a820cc3be2a8
procedure ClockTest.add_more_than_one_day_1500_min_equal_25_hrs;
begin
  TapAssertTrue(Self, 'add more than one day (1500 min = 25 hrs)', '06:32', Clock.add(5, 32, 1500));
end;

// 1918050d-c79b-4cb7-b707-b607e2745c7e
procedure ClockTest.add_more_than_two_days;
begin
  TapAssertTrue(Self, 'add more than two days', '11:21', Clock.add(1, 1, 3500));
end;

// 37336cac-5ede-43a5-9026-d426cbe40354
procedure ClockTest.subtract_minutes;
begin
  TapAssertTrue(Self, 'subtract minutes', '10:00', Clock.subtract(10, 3, 3));
end;

// 0aafa4d0-3b5f-4b12-b3af-e3a9e09c047b
procedure ClockTest.subtract_to_previous_hour;
begin
  TapAssertTrue(Self, 'subtract to previous hour', '09:33', Clock.subtract(10, 3, 30));
end;

// 9b4e809c-612f-4b15-aae0-1df0acb801b9
procedure ClockTest.subtract_more_than_an_hour;
begin
  TapAssertTrue(Self, 'subtract more than an hour', '08:53', Clock.subtract(10, 3, 70));
end;

// 8b04bb6a-3d33-4e6c-8de9-f5de6d2c70d6
procedure ClockTest.subtract_across_midnight;
begin
  TapAssertTrue(Self, 'subtract across midnight', '23:59', Clock.subtract(0, 3, 4));
end;

// 07c3bbf7-ce4d-4658-86e8-4a77b7a5ccd9
procedure ClockTest.subtract_more_than_two_hours;
begin
  TapAssertTrue(Self, 'subtract more than two hours', '21:20', Clock.subtract(0, 0, 160));
end;

// 90ac8a1b-761c-4342-9c9c-cdc3ed5db097
procedure ClockTest.subtract_more_than_two_hours_with_borrow;
begin
  TapAssertTrue(Self, 'subtract more than two hours with borrow', '03:35', Clock.subtract(6, 15, 160));
end;

// 2149f985-7136-44ad-9b29-ec023a97a2b7
procedure ClockTest.subtract_more_than_one_day_1500_min_equal_25_hrs;
begin
  TapAssertTrue(Self, 'subtract more than one day (1500 min = 25 hrs)', '04:32', Clock.subtract(5, 32, 1500));
end;

// ba11dbf0-ac27-4acb-ada9-3b853ec08c97
procedure ClockTest.subtract_more_than_two_days;
begin
  TapAssertTrue(Self, 'subtract more than two days', '00:20', Clock.subtract(2, 20, 3000));
end;

// f2fdad51-499f-4c9b-a791-b28c9282e311
procedure ClockTest.clocks_with_same_time;
begin
  TapAssertTrue(Self, 'clocks with same time', true, Clock.equal(15, 37, 15, 37));
end;

// 5d409d4b-f862-4960-901e-ec430160b768
procedure ClockTest.clocks_a_minute_apart;
begin
  TapAssertTrue(Self, 'clocks a minute apart', false, Clock.equal(15, 36, 15, 37));
end;

// a6045fcf-2b52-4a47-8bb2-ef10a064cba5
procedure ClockTest.clocks_an_hour_apart;
begin
  TapAssertTrue(Self, 'clocks an hour apart', false, Clock.equal(14, 37, 15, 37));
end;

// 66b12758-0be5-448b-a13c-6a44bce83527
procedure ClockTest.clocks_with_hour_overflow;
begin
  TapAssertTrue(Self, 'clocks with hour overflow', true, Clock.equal(10, 37, 34, 37));
end;

// 2b19960c-212e-4a71-9aac-c581592f8111
procedure ClockTest.clocks_with_hour_overflow_by_several_days;
begin
  TapAssertTrue(Self, 'clocks with hour overflow by several days', true, Clock.equal(3, 11, 99, 11));
end;

// 6f8c6541-afac-4a92-b0c2-b10d4e50269f
procedure ClockTest.clocks_with_negative_hour;
begin
  TapAssertTrue(Self, 'clocks with negative hour', true, Clock.equal(22, 40, -2, 40));
end;

// bb9d5a68-e324-4bf5-a75e-0e9b1f97a90d
procedure ClockTest.clocks_with_negative_hour_that_wraps;
begin
  TapAssertTrue(Self, 'clocks with negative hour that wraps', true, Clock.equal(17, 3, -31, 3));
end;

// 56c0326d-565b-4d19-a26f-63b3205778b7
procedure ClockTest.clocks_with_negative_hour_that_wraps_multiple_times;
begin
  TapAssertTrue(Self, 'clocks with negative hour that wraps multiple times', true, Clock.equal(13, 49, -83, 49));
end;

// c90b9de8-ddff-4ffe-9858-da44a40fdbc2
procedure ClockTest.clocks_with_minute_overflow;
begin
  TapAssertTrue(Self, 'clocks with minute overflow', true, Clock.equal(0, 1, 0, 1441));
end;

// 533a3dc5-59a7-491b-b728-a7a34fe325de
procedure ClockTest.clocks_with_minute_overflow_by_several_days;
begin
  TapAssertTrue(Self, 'clocks with minute overflow by several days', true, Clock.equal(2, 2, 2, 4322));
end;

// fff49e15-f7b7-4692-a204-0f6052d62636
procedure ClockTest.clocks_with_negative_minute;
begin
  TapAssertTrue(Self, 'clocks with negative minute', true, Clock.equal(2, 40, 3, -20));
end;

// 605c65bb-21bd-43eb-8f04-878edf508366
procedure ClockTest.clocks_with_negative_minute_that_wraps;
begin
  TapAssertTrue(Self, 'clocks with negative minute that wraps', true, Clock.equal(4, 10, 5, -1490));
end;

// b87e64ed-212a-4335-91fd-56da8421d077
procedure ClockTest.clocks_with_negative_minute_that_wraps_multiple_times;
begin
  TapAssertTrue(Self, 'clocks with negative minute that wraps multiple times', true, Clock.equal(6, 15, 6, -4305));
end;

// 822fbf26-1f3b-4b13-b9bf-c914816b53dd
procedure ClockTest.clocks_with_negative_hours_and_minutes;
begin
  TapAssertTrue(Self, 'clocks with negative hours and minutes', true, Clock.equal(7, 32, -12, -268));
end;

// e787bccd-cf58-4a1d-841c-ff80eaaccfaa
procedure ClockTest.clocks_with_negative_hours_and_minutes_that_wrap;
begin
  TapAssertTrue(Self, 'clocks with negative hours and minutes that wrap', true, Clock.equal(18, 7, -54, -11513));
end;

// 96969ca8-875a-48a1-86ae-257a528c44f5
procedure ClockTest.full_clock_and_zeroed_clock;
begin
  TapAssertTrue(Self, 'full clock and zeroed clock', true, Clock.equal(24, 0, 0, 0));
end;

initialization
RegisterTest(ClockTest);

end.
