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

So, remove this line before start to write your solution.

By default only the first test is executed.

To run all tests, type:

```sh
make test=all
```

All tests must have an "ok" status for the solution to be accepted.

It's possible to choose a single test to run by passing the corresponding number, for example:

```sh
make test=2
```

would only execute the second test.

[result]: https://www.freepascal.org/docs-html/3.2.2/ref/refse94.html
[exit]: https://www.freepascal.org/docs-html/3.2.2/rtl/system/exit.html
[raise]: https://www.freepascal.org/docs-html/3.2.2/ref/refse118.html
