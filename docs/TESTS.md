# Tests

Most tests check that, by assigning to [result] or by passing a value to [exit], you return the expected value.

Some tests check that you [raise] the expected exception.

## Running the tests

The `make` utility is a dependency to run the tests.

From within the exercise directory, type in a console/terminal:

```sh
make
```

If you didn't even touch the exercise solution file, you'll see a message like:

```
Please implement your solution.
```

So, remove this line before starting to write your solution.

By default only the first test is executed.

```text
TAP version 14
1..10
ok 1 - ...
```

To run all tests, type:

```sh
make test=all
```

```text
TAP version 14
1..10
ok 1 - empty_sentence
ok 2 - perfect_lower_case
ok 3 - only_lower_case
ok 4 - missing_the_letter_x
ok 5 - missing_the_letter_h
ok 6 - with_underscores
ok 7 - with_numbers
ok 8 - missing_letters_replaced_by_numbers
ok 9 - mixed_case_and_punctuation
ok 10 - am_and_AM_are_26_different_characters_but_not_a_pangram
```

Once all tests pass, you're finished with the exercise and can submit the solution.

It's possible to choose a single test to run by passing the corresponding number, for example:

```sh
make test=2
```

would only execute the second test.

[result]: https://www.freepascal.org/docs-html/3.2.2/ref/refse94.html
[exit]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/exit.html
[raise]: https://www.freepascal.org/docs-html/3.2.2/ref/refse118.html
