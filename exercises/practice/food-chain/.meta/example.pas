unit FoodChain;

{$mode ObjFPC}{$H+}

interface

function recite(const StartVerse, EndVerse : int8) : string;

implementation

uses SysUtils;

function recite(const StartVerse, EndVerse : int8) : string;
const
  LyricsComponents : Array[0..7] of Array[0..1] of String = (
    ('fly',    'I don''t know why she swallowed the fly.'       ),
    ('spider', 'It wriggled and jiggled and tickled inside her.'),
    ('bird',   'How absurd to swallow a bird!'                  ),
    ('cat',    'Imagine that, to swallow a cat!'                ),
    ('dog',    'What a hog, to swallow a dog!'                  ),
    ('goat',   'Just opened her throat and swallowed a goat!'   ),
    ('cow',    'I don''t know how she swallowed a cow!'         ),
    ('horse',  'She''s dead, of course!'                        )
 );
var
  i, j : integer;
  verse, verses : string;
begin
  verses := '';

  for i := StartVerse - 1 to EndVerse - 1 do
    begin
      verse := format(
        'I know an old lady who swallowed a %s.', [LyricsComponents[i, 0]]
      );
      verse := verse + #10 + LyricsComponents[i, 1];
      if LyricsComponents[i, 0] <> 'horse' then
        begin
          for j := i downto 1 do
            begin
              verse := verse + #10 +
                       format(
                         'She swallowed the %s to catch the %s.',
                         [LyricsComponents[j, 0], LyricsComponents[j - 1, 0]]
                       );
              if LyricsComponents[j - 1, 0] = 'spider' then
                verse := StringReplace(
                           verse + LyricsComponents[j - 1, 1],
                           'spider.It', 'spider that', []
                         );
            end;

          if LyricsComponents[i, 0] <> 'fly' then
            verse := verse + #10 + LyricsComponents[0, 1];

          verse := verse + ' Perhaps she''ll die.';
        end;

      if verses = '' then verses := verse
      else verses := verses + #10 + #10 + verse;
    end;

  result := verses;
end;

end.
