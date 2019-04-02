Expressions and Operators
=========================

<!-- vim-markdown-toc GFM -->

* [Literals](#literals)
   * [String literals](#string-literals)
   * [Class type literals](#class-type-literals)
   * [Name literals](#name-literals)
   * [Integer literals](#integer-literals)
   * [Float literals](#float-literals)
   * [Boolean literals](#boolean-literals)
   * [Null pointer](#null-pointer)
* [Expressions](#expressions)
   * [Primary expressions](#primary-expressions)
      * [Vector literals](#vector-literals)
   * [Postfix expressions](#postfix-expressions)
      * [Argument list](#argument-list)
   * [Unary expressions](#unary-expressions)
   * [Binary expressions](#binary-expressions)
      * [Assignment expressions](#assignment-expressions)
   * [Ternary expression](#ternary-expression)

<!-- vim-markdown-toc -->

Literals
========

Much like C or most other programming languages, ZScript has object literals,
including string literals, integer literals, float literals, name literals,
boolean literals, and the null pointer.

## String literals

String literals take the same form as in C:

```
"text here"
```

String literals have character escapes, which are formed with a backslash and a
character. Character escapes include:

| Spelling                | Output                                          |
| --------                | ------                                          |
| `\"`                    | A literal `"`.                                  |
| `\\`                    | A literal `\`.                                  |
| `\` followed by newline | Concatenates the next line with this one.       |
| `\a`                    | Byte `0x07` (`BEL` - bell, anachronism.)        |
| `\b`                    | Byte `0x08` (`BS` - backspace, anachronism.)    |
| `\c`                    | Byte `0x1c` (`TEXTCOLOR_ESCAPE`.)               |
| `\f`                    | Byte `0x0c` (`FF` - form feed, anachronism.)    |
| `\n`                    | Byte `0x0a` (`LF` - new line.)                  |
| `\t`                    | Byte `0x09` (`HT` - tab.)                       |
| `\r`                    | Byte `0x0d` (`CR` - return.)                    |
| `\v`                    | Byte `0x0b` (`VT` - vertical tab, anachronism.) |
| `\?`                    | A literal `?` (obsolete anachronism.)           |
| `\xnn` or `\Xnn`        | Byte `0xnn`.                                    |
| `\nnn`                  | Byte `0nnn` (octal.)                            |

To quote [cppreference](https://en.cppreference.com/w/cpp/language/escape), "of
the octal escape sequences, `\0` is the most useful because it represents the
terminating null character in null-terminated strings."

String literals, also like C and C++, will be concatenated when put directly
next to each other. For example, this:

```
"text 1" "text 2"
```

Will be parsed as a single string literal with the text `"text 1text 2"`.

## Class type literals

Class type literals take the same form as string literals, but do note that
they are not the same.

## Name literals

Name literals are similar to string literals, though they use apostrophes
instead of quote marks:

```
'text here'
```

They do not concatenate like string literals, and do not have character
escapes.

## Integer literals

Integer literals are formed similarly to C. They may take one of three forms,
and be typed `uint` or `int` based on whether there is a `u` or `U` at the end
or not.

The parser also supports an optional `l`/`L` suffix as in C, though it does not
actually do anything, and it is advised you do not use it for potential forward
compatibility purposes.

Integer literals can be in the basic base-10/decimal form:

```
1234567890 // int
500u       // uint
```

Base-16/hexadecimal form, which may use upper- or lower-case decimals and `0x`
prefix, depending on user preference:

```
0x123456789ABCDEF0
0XaBcDeF0 // don't do this, please.
0x7fff
0x7FFFFFFF
```

And, base-8/octal form, prefixed with a `0`:

```
0777
0414444
```

## Float literals

Float literals, much like integer literals, are formed similarly to C, but they
do not support hex-float notation. Float literals support exponent notation.

The parser supports an optional `f`/`F` suffix as in C, though it does not
actually do anything, and it is advised you do not use it for potential forward
compatibility purposes.

Float literals can be formed in a few ways:

```
0.5 //=> 0.5
.5  //=> 0.5
1.  //=> 1.0
```

And with exponents:

```
0.5e+2 //=> 50
50e-2  //=> 0.5
```

## Boolean literals

The two boolean literals are spelled `false` and `true`, and much like C, can
decay to the integer literals `0` and `1`.

## Null pointer

The null pointer literal is spelled `null` and represents an object that does
not exist in memory. Like C, it is not equivalent to the integer literal `0`,
and is more similar to C++'s `nullptr`.

Expressions
===========

Expressions contain literals or other such *expressions* of objects, including
arithmetic and various conditions.

## Primary expressions

Basic expressions, also known as primary expressions, can be one of:

- An identifier for a constant or variable.
- The `Super` keyword.
- Any object literal.
- A vector literal.
- An expression in parentheses.

Identifiers work as you expect, they reference a variable or constant. The
`Super` keyword references the parent type or any member within it.

### Vector literals

Vector literals are not under object literals as they are not constants in the
same manner as other literals, since they contain expressions within them. As
such, they are expressions, not proper value-based literals. They can be formed
with:

```
( X , Y )     //=> vector2, where X is not a vector2
( X , Y )     //=> vector3, where X *is* a vector2
( X , Y , Z ) //=> vector3
```

All components must have type `double`, except in the second grammar where `X`
is `vector2`.

## Postfix expressions

Postfix expressions are affixed at the end of an expression, and are used for a
large variety of things, although the actual amount of postfix expressions is
small:

| Form                       | Description                                                                                      |
| ----                       | -----------                                                                                      |
| `A ( $[Argument-list]$ )`  | Function call.                                                                                   |
| `Type ( A )`               | Type cast.                                                                                       |
| `( class < Type > ) ( A )` | Class type reference cast.                                                                       |
| `A [ B ]`                  | Array access.                                                                                    |
| `A.B`                      | Member access.                                                                                   |
| `A++`                      | Post-increment. This increments (adds 1 to) the object after the expression is evaluated.        |
| `A--`                      | Post-decrement. This decrements (subtracts 1 from) the object after the expression is evaluated. |

### Argument list

The syntax for an argument list is:

```
Expression $[ , Expression]$...
```

Function calls may name arguments which have defaults with the syntax
`Identifier : Expression`, possibly skipping over other defaulted arguments.
After the first named defaultable argument, all other arguments must be named
as well.

## Unary expressions

Unary expressions are affixed at the beginning of an expression. The simplest
example of a unary expression is the negation operator, `-`, as in `-500`.
Unary expressions include:

| Form        | Description                                                                           |
| ----        | -----------                                                                           |
| `- A`       | Negation.                                                                             |
| `! A`       | Logical negation, "not."                                                              |
| `++ A`      | Pre-increment. This adds 1 to the object and evaluates as the resulting value.        |
| `-- A`      | Pre-decrement. This subtracts 1 from the object and evaluates as the resulting value. |
| `~ A`       | Bitwise negation. Flips all bits in an integer.                                       |
| `+ A`       | Affirmation. Does not actually do anything.                                           |
| `alignof A` | Evaluates the alignment of the type of an expression. Unknown purpose.                |
| `sizeof A`  | Evaluates the size of the type of an expression. Unknown purpose.                     |

## Binary expressions

Binary expressions operate on two expressions, and are the most common kind of
expression. They are used inline like regular math syntax, i.e. `1 + 1`. Binary
expressions include:

| Form        | Description                                                                       |
| ----        | -----------                                                                       |
| `A + B`     | Addition.                                                                         |
| `A - B`     | Subtraction.                                                                      |
| `A * B`     | Multiplication.                                                                   |
| `A / B`     | Division quotient.                                                                |
| `A % B`     | Division remainder, also known as "modulus." Unlike C, this works on floats, too. |
| `A ** B`    | Exponent ("power of.")                                                            |
| `A << B`    | Left bitwise shift.                                                               |
| `A >> B`    | Right bitwise shift.                                                              |
| `A >>> B`   | Right unsigned bitwise shift.                                                     |
| `A cross B` | Vector cross-product.                                                             |
| `A dot B`   | Vector dot-product.                                                               |
| `A .. B`    | Concatenation, creates a string from two values.                                  |
| `A < B`     | `true` if `A` is less than `B`.                                                   |
| `A > B`     | `true` if `A` is greater than `B`.                                                |
| `A <= B`    | `true` if `A` is less than or equal to `B`.                                       |
| `A >= B`    | `true` if `A` is greater than or equal to `B`.                                    |
| `A == B`    | `true` if `A` is equal to `B`.                                                    |
| `A != B`    | `true` if `A` is not equal to `B`.                                                |
| `A ~== B`   | `true` if `A` is approximately equal to `B`. For strings this is a case-insensitive comparison, for floats and vectors this checks if the difference between the two is smaller than ε. |
| `A && B`    | `true` if `A` and `B` are both `true`.                                            |
| `A \|\| B`  | `true` if `A` or `B` is `true`.                                                   |
| `A is "B"`  | `true` if `A`'s type is equal to or a descendant of `B`.                          |
| `A <>= B`   | Signed difference between `A` and `B`.                                            |
| `A & B`     | Bitwise AND.                                                                      |
| `A ^ B`     | Bitwise XOR.                                                                      |
| `A \| B`    | Bitwise OR.                                                                       |
| `A :: B`    | Scope operator. Not implemented yet.                                              |

### Assignment expressions

Assignment expressions are a subset of binary expressions which *are never
constant expressions*. They assign a value to another value, as one might
guess.

| Form       | Description               |
| ----       | -----------               |
| `A = B`    | Assigns `B` to `A`.       |
| `A += B`   | Assigns `A + B` to `A`.   |
| `A -= B`   | Assigns `A - B` to `A`.   |
| `A *= B`   | Assigns `A * B` to `A`.   |
| `A /= B`   | Assigns `A / B` to `A`.   |
| `A %= B`   | Assigns `A % B` to `A`.   |
| `A <<= B`  | Assigns `A << B` to `A`.  |
| `A >>= B`  | Assigns `A >> B` to `A`.  |
| `A >>>= B` | Assigns `A >>> B` to `A`. |
| `A \|= B`  | Assigns `A \| B` to `A`.  |
| `A &= B`   | Assigns `A & B` to `A`.   |
| `A ^= B`   | Assigns `A ^ B` to `A`.   |

## Ternary expression

The ternary expression is formed `A ? B : C`, and will evaluate to `B` if `A`
is `true`, or `C` if it is `false`.

<!-- EOF -->
