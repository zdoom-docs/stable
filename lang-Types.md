# Types

<!-- vim-markdown-toc GFM -->

* [Integer Types](#integer-types)
   * [Symbols](#symbols)
* [Floating-point Types](#floating-point-types)
   * [Symbols](#symbols-1)
* [Strings](#strings)
* [Names](#names)
* [Colors](#colors)
* [Vectors](#vectors)
* [Fixed-size Arrays](#fixed-size-arrays)
* [Dynamic-size Arrays](#dynamic-size-arrays)
* [Maps](#maps)
* [Class Types](#class-types)
* [User Types](#user-types)
* [Read-only Types](#read-only-types)
* [Other Types](#other-types)
* [Variable Name](#variable-name)
* [Array Size](#array-size)

<!-- vim-markdown-toc -->

ZScript has several categories of types: Integer types, floating-point
(decimal) types, strings, vectors, names, classes, et al. There are a wide
variety of ways to use these types, as well as a wide variety of places they
are used.

Types determine what kind of value an object stores, how it acts within an
expression, etc. All objects, constants and enumerations have a type. Argument
lists use types to ensure a function is used properly.

Most basic types have methods attached to them, and both integer and
floating-point type names have symbols accessible from them. See the API
section for more information.

# Integer Types

Integer types are basic integral numbers. They include:

| Name     | Usable as argument | Bits | Lowest value   | Highest value |
| ----     | :----------------: | :--: | -----------:   | :------------ |
| `int`    | Yes                | 32   | -2,147,483,648 | 2,147,483,647 |
| `uint`   | Yes                | 32   | 0              | 4,294,967,296 |
| `int16`  | No                 | 16   | -32,768        | 32,767        |
| `uint16` | No                 | 16   | 0              | 65,535        |
| `int8`   | No                 | 8    | -128           | 127           |
| `uint8`  | No                 | 8    | 0              | 255           |

Some types have aliases as well:

| Name     | Aliases  |
| ----     | -------  |
| `sbyte`  | `int8`   |
| `byte`   | `uint8`  |
| `short`  | `int16`  |
| `ushort` | `uint16` |

## Symbols

Integer types have symbols attached which can be accessed by `typename.name`,
for instance `int.Max`.

- `Max`

   Maximum value of type.

- `Min`

   Minimum value of type.

# Floating-point Types

Floating-point types hold exponents, generally represented as regular decimal
numbers. There are two such types available to ZScript:

| Name      | Usable as argument | Notes                                                              |
| ----      | :----------------: | -----                                                              |
| `double`  | Yes                | 64-bit floating-point number.                                      |
| `float`   | Yes (64 bits)      | 32-bit in structures and classes, 64-bit otherwise.                |
| `float64` | Yes                | Alias for `double`.                                                |
| `float32` | No                 | 32-bit floating-point number. Not implemented correctly, unusable. |

## Symbols

Floating-point types have symbols attached which can be accessed by
`typename.name`, for instance `double.Infinity`.

- `Dig`

   Number of decimal digits in type.

- `Epsilon`

   ε value of type.

- `Infinity`

   ∞ value of type.

- `Mant_Dig`

   Number of mantissa bits in type.

- `Max`

   Maximum value of type.

- `Max_Exp`

   Maximum exponent bits value of type.

- `Max_10_Exp`

   Maximum exponent of type.

- `Min_Denormal`

   Minimum positive subnormal value of type.

- `Min_Exp`

   Minimum exponent bits value of type.

- `Min_Normal`

   Minimum value of type.

- `Min_10_Exp`

   Minimum exponent of type.

- `NaN`

   Not-a-Number value of type.

# Strings

| Name     | Usable as argument |
| ----     | :----------------: |
| `string` | Yes                |

The `string` type is a mutable, garbage-collected string reference type.
Strings are not structures or classes, however there are methods attached to
the type, detailed in the API section.

# Names

| Name   | Usable as argument |
| ----   | :----------------: |
| `name` | Yes                |

The `name` type is an indexed string. While their contents are the same as a
string, their actual value is merely an integer which can be compared far
quicker than a string. Names are used for many internal purposes such as damage
type names. Strings are implicitly cast to names.

Names can be converted to `int` with an explicit cast, and the negative of
`int(name())` may be used to create an integer representation of a string
usable by action specials, most prominently `Acs_NamedExecute`.

# Colors

| Name    | Usable as argument |
| ----    | :----------------: |
| `color` | Yes                |

The `color` type can be converted from a string using the `X11RGB` lump or a
hex color in the format `#RRGGBB`, or with either of:

```
color(R, G, B)
color(A, R, G, B)
```

# Vectors

| Name      | Usable as argument |
| ----      | :----------------: |
| `vector2` | Yes                |
| `vector3` | Yes                |

There are two vector types in ZScript, `vector2` and `vector3`, which hold two
and three members, respectively. Their members can be accessed through `x`, `y`
and (for `vector3`,) `z`. `vector3` can additionally get the X and Y components
as a `vector2` with `xy`.

Vectors can use many operators and even have special ones to themselves. See
the Expressions and Operators section for more information.

# Fixed-size Arrays

| Name              | Usable as argument |
| ----              | :----------------: |
| `Type Array-size` | No                 |

Fixed-size arrays take the form `Type[size]`. They hold `size` number of `Type`
elements, which can be accessed with the array access operator.

Multi-dimensional arrays are also supported, although the dimensions will be
backwards (right to left instead of left to right) unless `version` is `3.7.2`
or greater.

Note that this kind of type can also be declared in variable names themselves.

# Dynamic-size Arrays

| Name             | Usable as argument |
| ----             | :----------------: |
| `array < Type >` | Yes                |

Dynamically sized arrays take the form `array<Type>`, and hold an arbitrary
number of `Type` elements, which can be accessed with the array access
operator.

Dynamic-sized arrays do not have their lifetime scoped to their current block,
so the following:

```
for(int i = 0; i < 5; i++)
{
   array<int> a;
   a.Push(0);
}
```

Will result in an array with 5 elements.

Dynamically sized arrays also cannot store other dynamically sized arrays, or
user-defined `struct` objects.

# Maps

| Name                  | Usable as argument |
| ----                  | :----------------: |
| `map < Type , Type >` | No                 |

Map types take the form `map<Type, Type>`. They are not yet implemented.

# Class Types

| Name             | Usable as argument |
| ----             | :----------------: |
| `class < Type >` | Yes                |
| `class`          | Yes                |

Class type references are used to describe a concrete *type* rather than an
object. They simply take the form `class`, and can be restrained to descendants
of a type with the syntax `class<Type>`. Strings are implicitly cast to class
type references.

# User Types

| Name                         | Usable as argument |
| ----                         | :----------------: |
| Any class object             | Yes                |
| Native `struct` object       | Yes                |
| User-defined `struct` object | No                 |
| `@ Type`                     | Yes                |

Any other identifier used as a type will resolve to a user class, structure or
enumeration type.

Types prefixed with `@` are native pointers to objects (as opposed to objects
placed directly in the structure's data.) This is not usable in user code.

A type name that is within a specific scope can be accessed by prefixing it
with a `.`. The type `.MyClass.MySubStructure` will resolve to the type
`MySubStructure` contained within `MyClass`.

# Read-only Types

| Name                | Usable as argument |
| ----                | :----------------: |
| `readonly < Type >` | Yes                |

A read-only type, as its name implies, may only be read from, and is
effectively immutable. They take the form `readonly<Type>`. Do note that this
is separate from the member declaration flag.

# Other Types

| Name         | Usable as argument | Description                                                     |
| ----         | :----------------: | -----------                                                     |
| `bool`       | Yes                | Holds one of two values: `true` or `false`.                     |
| `sound`      | Yes                | Holds a sound reference.                                        |
| `spriteid`   | Yes                | Holds a sprite reference.                                       |
| `state`      | Yes                | A reference to an actor state.                                  |
| `statelabel` | Yes                | The name of an actor state.                                     |
| `textureid`  | Yes                | Holds a texture reference.                                      |
| `void`       | No                 | Alias for `None`. Unknown purpose, likely implementation error. |
| `voidptr`    | No                 | A pointer to a real memory address. Implementation detail.      |

Strings will implicitly convert to `sound` and `statelabel`.

# Variable Name

Variable names can have an array's size on them, instead of on the type, or
none. Variable names are formed as either:

```
Identifier
Identifier Array-size
```

# Array Size

Array sizes can be multi-dimensional or automatically sized, so all of the
following syntaxes are available:

```
[ ]
[ Expression ] $[Array-size...]$
```

<!-- EOF -->
