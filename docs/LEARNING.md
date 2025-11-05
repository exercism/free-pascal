# Learning

The Pascal programming language has a long history, and much of the online documentation is geared towards beginners. Most of these tutorials deal with console programs, where you print information to the screen and/or read user input. For example, one of the most common beginner tutorial is a program to print 'Hello World' on the screen:

```pascal
program HelloWorld;
begin
  writeln('Hello World!');
end.
```

When executed, from a console/terminal, this program will print 'Hello World' on the screen.

Here at Exercism, we use automated testing to ensure your solutions are correct, and therefore we need to use a **unit** instead of a **program**. The main difference is that you'll need to return a value from a function instead of print something to terminal:

```pascal
writeln('Hello World!');
```

became

```pascal
result := 'Hello World!'
```

The write/writeln commands are still useful for displaying information or obtaining a textual representation of the output of a command, a mathematical operation, etc.
