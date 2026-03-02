unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  SieveTest = class(TTestCase)
  published
    procedure no_primes_under_two;
    procedure find_first_prime;
    procedure find_primes_up_to_10;
    procedure limit_is_prime;
    procedure find_primes_up_to_1000;
  end;

implementation

uses Sieve;

// 88529125-c4ce-43cc-bb36-1eb4ddd7b44f
procedure SieveTest.no_primes_under_two;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [];
  actual := Sieve.primes(1);
  TapAssertTrue(Self, 'no primes under two', expect, actual);
end;

// 4afe9474-c705-4477-9923-840e1024cc2b
procedure SieveTest.find_first_prime;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [2];
  actual := Sieve.primes(2);
  TapAssertTrue(Self, 'find first prime', expect, actual);
end;

// 974945d8-8cd9-4f00-9463-7d813c7f17b7
procedure SieveTest.find_primes_up_to_10;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [2, 3, 5, 7];
  actual := Sieve.primes(10);
  TapAssertTrue(Self, 'find primes up to 10', expect, actual);
end;

// 2e2417b7-3f3a-452a-8594-b9af08af6d82
procedure SieveTest.limit_is_prime;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [2, 3, 5, 7, 11, 13];
  actual := Sieve.primes(13);
  TapAssertTrue(Self, 'limit is prime', expect, actual);
end;

// 92102a05-4c7c-47de-9ed0-b7d5fcd00f21
procedure SieveTest.find_primes_up_to_1000;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997];
  actual := Sieve.primes(1000);
  TapAssertTrue(Self, 'find primes up to 1000', expect, actual);
end;

initialization
RegisterTest(SieveTest);

end.
