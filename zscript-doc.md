Table of Contents
=================

<!-- vim-markdown-toc GFM -->

* [Introduction](#introduction)
* [Translation Unit](#translation-unit)
* [Versions](#versions)
* [Top-level](#top-level)
* [Class definitions](#class-definitions)
   * [Class flags](#class-flags)
   * [Examples: Class headers](#examples-class-headers)
   * [Examples: Class definitions](#examples-class-definitions)
   * [Class content](#class-content)
   * [Property definitions](#property-definitions)
   * [Default blocks](#default-blocks)
   * [State definitions](#state-definitions)
   * [Examples: Property definitions](#examples-property-definitions)
* [Structure definitions](#structure-definitions)
   * [Structure flags](#structure-flags)
   * [Structure content](#structure-content)
   * [Examples: Structure definitions](#examples-structure-definitions)
* [Enumeration definitions](#enumeration-definitions)
   * [Examples: Enumeration definitions](#examples-enumeration-definitions)
* [Constant definitions](#constant-definitions)
   * [Examples: Constant definitions](#examples-constant-definitions)
* [Static array definitions](#static-array-definitions)
* [Include directives](#include-directives)
   * [Examples: Include directives](#examples-include-directives)
* [Types](#types)
   * [Integers](#integers)
   * [Floating-point types](#floating-point-types)
   * [Strings](#strings)
   * [Names](#names)
   * [Color](#color)
   * [Vectors](#vectors)
   * [Fixed-size arrays](#fixed-size-arrays)
   * [Dynamic-size arrays](#dynamic-size-arrays)
   * [Maps](#maps)
   * [Class type references](#class-type-references)
   * [User types](#user-types)
   * [Read-only types](#read-only-types)
   * [Other types](#other-types)
* [Expressions and Operators](#expressions-and-operators)
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
      * [Unary expressions](#unary-expressions)
      * [Binary expressions](#binary-expressions)
         * [Assignment expressions](#assignment-expressions)
      * [Ternary expression](#ternary-expression)
* [Statements](#statements)
   * [Compound statements](#compound-statements)
   * [Expression statements](#expression-statements)
   * [Examples: Expression statements](#examples-expression-statements)
   * [Conditional statements](#conditional-statements)
   * [Examples: Conditional statements](#examples-conditional-statements)
   * [Switch statements](#switch-statements)
   * [Examples: Switch statements](#examples-switch-statements)
   * [Loop statements](#loop-statements)
   * [Control flow statements](#control-flow-statements)
   * [Examples: Control flow statements](#examples-control-flow-statements)
   * [Local variable statements](#local-variable-statements)
   * [Multi-assignment statements](#multi-assignment-statements)
   * [Examples: Multi-assignment statements](#examples-multi-assignment-statements)
   * [Static array statements](#static-array-statements)
   * [Null statements](#null-statements)
* [Member declarations](#member-declarations)
   * [Member declaration flags](#member-declaration-flags)
   * [Examples: Member declarations](#examples-member-declarations)
* [Method definitions](#method-definitions)
   * [Method definition flags](#method-definition-flags)
* [Concepts](#concepts)
   * [Action Scoping](#action-scoping)
   * [Object Scoping](#object-scoping)
   * [Format String](#format-string)
* [API](#api)
   * [Type symbols](#type-symbols)
      * [Integer types](#integer-types)
      * [Floating-point types](#floating-point-types-1)
   * [Globals](#globals)
      * [Global functions](#global-functions)
         * [Class handling](#class-handling)
         * [Random number generation](#random-number-generation)
         * [Math](#math)
         * [Game](#game)
         * [Sound](#sound)
         * [System](#system)
      * [Global variables](#global-variables)
         * [Static info](#static-info)
         * [Game state](#game-state)
         * [Client](#client)
         * [Players](#players)
   * [Built-in types](#built-in-types)
      * [Object](#object)
      * [Array](#array)
      * [Color](#color-1)
      * [FixedArray](#fixedarray)
      * [String](#string)
      * [TextureID](#textureid)
      * [Vector2/Vector3](#vector2vector3)
   * [Level Data](#level-data)
      * [Vertex](#vertex)
      * [Side](#side)
      * [Line](#line)
      * [Sector](#sector)
      * [SectorPortal](#sectorportal)
      * [SectorTagIterator](#sectortagiterator)
      * [LineIdIterator](#lineiditerator)
      * [LevelLocals](#levellocals)
   * [Players](#players-1)
      * [PlayerInfo](#playerinfo)
      * [PlayerClass](#playerclass)
      * [PlayerSkin](#playerskin)
      * [Team](#team)
   * [Weapons](#weapons)
      * [Weapon](#weapon)
   * [Drawing](#drawing)
      * [Font](#font)
      * [BrokenLines](#brokenlines)
      * [TexMan](#texman)

<!-- vim-markdown-toc -->

Introduction
============

ZScript is a new (circa 2017) scripting language that has sprung from the ceasing of ZDoom and the subsequent reprisal of GZDoom as mainline. It is similar to Java, though it has many deficiencies, oddities and other such issues. Despite this, it is still the most powerful Doom modding tool since straight up source editing, and will likely stay that way for a while until Eternity Engine inevitably becomes competition-worthy with scripting additions.

This documentation serves as an introduction to and informal specification of the ZScript language from a programmer's viewpoint. It should also be useful for non-programmers looking for specifics on the inner workings of the language and more information on the functions and properties provided to it.

ZScript runs in a virtual machine much like ACS, although because it is *not* compiled to bytecode and uses an object-oriented structure, the virtual machine is far more complex, and also therefore quite a bit slower. ZScript may only be read from source files by the engine, which has several benefits as well as detriments. It is the opinion of the author that this is a bad solution, but the author will refrain from going on a several-paragraph tirade about why bytecode is always better than source, even if it is an optional component.

In any case, here we are. This documentation will detail all aspects of ZScript, from the language and type system to the API and finer details. This document is distributed under the [CC0 public domain license](https://creativecommons.org/publicdomain/zero/1.0/legalcode) in the hope that it is useful reference and serves as a solid basis for further writings. This document was originally written by Alison Sanderson (Marrub.) Attribution is encouraged but not required.

Translation Unit
================

Full ZScript files are referred to as "translation units." This terminology comes from the C standard, and refers simply to the entirety of a ZScript source file. ZScript files are looked for in lumps named `zscript` with any extension. The standard extension is `.txt`, but `.zsc` and `.zs` are common as well. The author of this documentation prefers `.zsc`.

The base translation unit `zscript` may start with a version directive, then followed by any number of top-level definitions and `#include` directives. Included translation units may not have version directives.

All keywords and identifiers in ZScript are case insensitive.

Versions
========

A version directive may be placed at the very beginning of a ZScript file, the syntax being:

```
version "num"
```

Where `num` is the ZScript version to use. By default ZScript is `version "2.3"`, the original ZScript specification. This old version is not supported by this documentation and it is highly encouraged to always use the latest version of ZScript. The minimum version supported by this documentation is 2.4.

Here is a list of differences between ZScript versions:

Version 2.5

- Added `Inventory::GetPowerupIcon`.
- Added `class InterBackground`.
- Added `struct PatchInfo`.
- Added `class StatusScreen`.

Version 3.3

- Default parameters in overridden virtual functions are now an error.

Version 3.4

- Added "internal" keyword.

Version 3.5.1

- Deprecated `String.LastIndexOf`.

Top-level
=========

A ZScript file can have one of several things at the top level of the file, following a version directive:

- Class definitions
- Structure definitions
- Enumeration definitions
- Constant definitions
- Include directives

Class definitions
=================

A class defines an object type within ZScript, and is most of what you'll be creating within the language.

All classes inherit from other classes. The base class can be set within the class header, but if it is not the class will automatically inherit from Object.

Classes are subject to Scoping. They are also implicitly reference values, and therefore can be null. Use `new` to instantiate a new class object.

Classes that inherit from Actor can replace other actors when spawned in maps, and can also be used freely in DECORATE. Actors have states, which will not be explained in this document as they are already well-documented on the ZDoom wiki.

A class is formed with the syntax:

```
class Name [: BaseClass] [Class flags...]
{
   [Class content...]
}
```

Or, alternatively, the rest of the file can be used as class content. Note that with this syntax you cannot use include directives afterward:

```
class Name [: BaseClass] [Class flags...];

[Class content...]
```

If the class is defined within the same archive as the current file, then one can continue a class definition with the syntax:

```
extend class Name
```

In place of the class header.

Class flags
-----------

| Flag                    | Description                                                                  |
| ----                    | -----------                                                                  |
| `abstract`              | Cannot be instantiated with `new`.                                           |
| `ui`                    | Class has UI scope.                                                          |
| `play`                  | Class has Play scope.                                                        |
| `replaces ReplaceClass` | Replaces ReplaceClass with this class. Only works with descendants of Actor. |
| `native`                | Class is from the engine. Only usable internally.                            |
| `version("ver")`        | Restricted to ZScript version *ver* or higher.                               |

Examples: Class headers
-----------------------

Various class headers:

```
class MyCoolObject // automatically inherits Object
class MyCoolScopedObject play // has Play scope
class MyCoolThinker : Thinker // inherits Thinker
class MyCoolActor : Actor replaces OtherActor
class MyCoolInterface abstract // can only be inherited
```

Examples: Class definitions
---------------------------

Basic class definition with a member variable and member function:

```
class BasicClass
{
   int m_thing;

   void changeThing()
   {
      m_thing = 500;
   }
}
```

Alternate syntax usage:

```
class TheWholeFileIsAClassOhNo;

int m_mymember;

// end of file
```

Class content
-------------

Class contents are an optional list of various things logically contained within the class, including:

- Member declarations
- Method definitions
- Property definitions
- Default blocks
- State definitions
- Enumeration definitions
- Structure definitions
- Constant definitions
- Static array definitions

Property definitions
--------------------

Property definitions are used within classes to define defaultable attributes on actors. They are not valid on classes not derived from Actor.

When registered, a property will be available in the `default` block as `ClassName.PropertyName`. Properties can be given multiple members to initialize.

Property definitions take the form `property Name: Member list...;`.

Properties defined in ZScript are usable from DECORATE.

Default blocks
--------------

Default blocks are used on classes derived from Actor to create an overridable list of defaults to properties, allowing for swift creation of flexible actor types.

In DECORATE, this is everything that isn't in the `states` block, but in ZScript, for syntax flexibility purposes, it must be enclosed in a block with `default` at the beginning, formed:

```
default
{
   Default statement list...
}
```

Default statements include flags and properties. Flags are the same as DECORATE, though sub-actor flags require their prefix, and can optionally be followed by a semicolon. Properties are the same as DECORATE, with a terminating semicolon required.

State definitions
-----------------

These are the same as DECORATE, but states that do not have function blocks require terminating semicolons. Double quotes around `####` and `----` are no longer required. State blocks can be subject to Action Scoping with the syntax `states(Scope)`.

Examples: Property definitions
------------------------------

A class with some properties:

```
class MyCoolActor : Actor
{
   default
   {
      MyCoolActor.MyCoolMember 5000;
      MyCoolActor.MyCoolMemberList 501, 502;
   }

   int m_myCoolMember;
   int m_coolMember1, m_coolMember2;

   property MyCoolMember: m_myCoolMember;
   property MyCoolMemberList: m_coolMember1, m_coolMember2;
}
```

Structure definitions
=====================

A structure is an object type that does not inherit from Object and is not always (though occasionally is) a reference type, unlike classes. Structures marked as `native` are passed by-reference as arguments, and `null` can be passed in their place. Non-native structures cannot be passed as arguments.

Structures are preferred for basic compound data types that do not need to be instanced and are often used as a way of generalizing code. They cannot be returned from functions.

Structures are subject to Scoping.

A structure takes the form of:

```
struct Name [Structure flags...]
{
   [Structure content...]
}
```

Optionally followed by a semicolon.

Structure flags
---------------

| Flag             | Description                                                             |
| ----             | -----------                                                             |
| `ui`             | Structure has UI scope.                                                 |
| `play`           | Structure has Play scope.                                               |
| `clearscope`     | Structure has Data scope. Default.                                      |
| `native`         | Structure is from the engine. Only usable internally.                   |
| `version("ver")` | Restricted to ZScript version *ver* or higher.                          |

Structure content
-----------------

Structure contents are an optional list of various things logically contained within the structure, including:

- Member declarations
- Method definitions
- Enumeration definitions
- Constant definitions

Examples: Structure definitions
-------------------------------

Simple structure:

```
struct MyCoolStructure
{
   int x;
   int y;
   int z;
}
```

Enumeration definitions
=======================

An enumeration is a list of named numbers, which by default will be incremental from 0. By default they decay to the type `int`, but the default decay type can be set manually.

An enumeration definition takes the form:

```
enum Name [: IntegerType]
{
   [Enumerator...]
}
```

Optionally followed by a semicolon.

Enumerators can either be incremental (from the last enumerator or 0 if there is none) or explicitly set with the basic syntax `enumerator = value`. Enumerators must be followed by a comma unless it is the end of the list.

Examples: Enumeration definitions
---------------------------------

Basic enumeration:

```
enum MyCoolEnum
{
   A, // has value int(0)
   B, // 1 ...
   C, // 2 ...
   D  // and 3
}
```

Less trivial example:

```
enum MyCoolerEnum : int16
{
   A = 500, // has value int16(500)
   B, // 501
   C = 200,
   D, // 201
   E, // 202
};
```

Constant definitions
====================

Constants are simple named values. They are created with the syntax:

```
const Name = value;
```

Constants are not assignable. Their type is inferred from their value, so if you wish for them to have a specific type, you must cast the value to that type.

Examples: Constant definitions
------------------------------

Making an integer constant from a double:

```
const MyCoolInt = int(777.7777);
```

Static array definitions
=========================

Similar to constants, static arrays are named values, but for an array. They are created with the syntax:

```
static const Type name[] = {
   [Expression list...]
};
```

Or:

```
static const Type[] name = {
   [Expression list...]
};
```

Static arrays cannot be multi-dimensional, unlike normal arrays.

Include directives
==================

Include directives include other files to be processed by the ZScript compiler, allowing you to organize and separate code into different files. Their syntax is simple:

```
#include "filename"
```

Note that included filenames will conflict with other mods. If two mods have a file named `zscript/MyCoolClasses.zsc` and both include it, expecting to get different files, the engine will fail to load with a script error.

To avoid this, it is suggested to place your ZScript code under a uniquely named sub-folder.

Examples: Include directives
----------------------------

Basic includes:

```
#include "zscript/MyCoolMod/MyCoolClasses.zsc"
```

Types
=====

ZScript has several categories of types: Integer types, floating-point (decimal) types, strings, vectors, names, classes, et al. There are a wide variety of ways to use these types, as well as a wide variety of places they are used.

Types determine what kind of value an object stores, how it acts within an expression, etc. All objects, constants and enumerations have a type. Argument lists use types to ensure a function is used properly.

Most basic types have methods attached to them, and both integer and floating-point type names have symbols accessible from them. See the API section for more information.

Integers
-------------

Integer types are basic integral numbers. They include:

| Name     | Usable as argument | Bits | Lowest value   | Highest value |
| ----     | :----------------: | :--: | -----------:   | :------------ |
| `int`    | Yes                | 32   | -2,147,483,648 | 2,147,483,647 |
| `uint`   | Yes                | 32   | 0              | 4,294,967,296 |
| `int16`  | No                 | 16   | -32,768        | 32,767        |
| `uint16` | No                 | 16   | 0              | 65,535        |
| `int8`   | No                 | 8    | -128           | 127           |
| `uint8`  | No                 | 8    | 0              | 255           |

Floating-point types
--------------------

Floating-point types hold exponents, generally represented as regular decimal numbers. There are two such types available to ZScript:

| Name      | Usable as argument | Notes                                                              |
| ----      | :----------------: | -----                                                              |
| `double`  | Yes                | 64-bit floating-point number.                                      |
| `float`   | Yes (64 bits)      | 32-bit in structures and classes, 64-bit otherwise.                |
| `float64` | Yes                | Alias for `double`.                                                |
| `float32` | No                 | 32-bit floating-point number. Not implemented correctly, unusable. |

Strings
-------

| Name      | Usable as argument |
| ----      | :----------------: |
| `string`  | Yes                |

The `string` type is a mutable, garbage-collected string reference type. Strings are not structures or classes, however there are methods attached to the type, detailed in the API section.

Names
-----

| Name      | Usable as argument |
| ----      | :----------------: |
| `name`    | Yes                |

The `name` type is an indexed string. While their contents are the same as a string, their actual value is merely an integer which can be compared far quicker than a string. Names are used for many internal purposes such as damage type names. Strings are implicitly casted to names.

Color
-----

| Name      | Usable as argument |
| ----      | :----------------: |
| `color`   | Yes                |

The `color` type can be converted from a string using the X11RGB lump or a hex color in the format `#RRGGBB`, or with either `color(R, G, B)` or `color(R, G, B, A)`.

Vectors
-------

| Name      | Usable as argument |
| ----      | :----------------: |
| `vector2` | Yes                |
| `vector3` | Yes                |

There are two vector types in ZScript, `vector2` and `vector3`, which hold two and three members, respectively. Their members can be accessed through `x`, `y` and (for `vector3`,) `z`. `vector3` can additionally get the X and Y components as a `vector2` with `xy`.

Vectors can use many operators and even have special ones to themselves. See the Expressions and Operators section for more information.

Fixed-size arrays
-----------------

| Name         | Usable as argument |
| ----         | :----------------: |
| `type[size]` | No                 |

Fixed-size arrays take the form `Type[size]`. They hold `size` number of `Type` elements, which can be accessed with the array access operator. Multi-dimensional arrays are also supported.

Dynamic-size arrays
-------------------

| Name          | Usable as argument |
| ----          | :----------------: |
| `array<Type>` | Yes                |

Dynamically sized arrays take the form `array<Type>`, and hold an arbitrary number of `Type` elements, which can be accessed with the array access operator. Multi-dimensional dynamic arrays are not supported.

Maps
----

| Name              | Usable as argument |
| ----              | :----------------: |
| `map<Type, Type>` | No                 |

Map types take the form `map<Type, Type>`. They are not yet implemented.

Class type references
---------------------

| Name          | Usable as argument |
| ----          | :----------------: |
| `class<Type>` | Yes                |
| `class`       | Yes                |

Class type references are used to describe a concrete *type* rather than an object. They simply take the form `class`, and can be restrained to descendants of a type with the syntax `class<Type>`. Strings are implicitly casted to class type references.

User types
----------

| Name                   | Usable as argument    |
| ----                   | :----------------:    |
| Any class object       | Yes                   |
| `native` struct object | Yes                   |
| User struct object     | No                    |
| `@Type`                | Yes (only internally) |

Any other identifier used as a type will resolve to a user class, structure or enumeration type.

Identifiers prefixed with `@` are native pointers to objects and not necessarily exposed to ZScript. This is not usable in user code.

A type name that is within a specific scope can be accessed by prefixing it with a `.`. The type `.MyClass.MySubStructure` will resolve to the type `MySubStructure` contained within `MyClass`.

Read-only types
---------------

| Name             | Usable as argument |
| ----             | :----------------: |
| `readonly<Type>` | Yes                |

A read-only type, as its name implies, may only be read from, and is effectively immutable. They take the form `readonly<Type>`.

Other types
-----------

| Name         | Usable as argument | Description                                                     |
| ----         | :----------------: | -----------                                                     |
| `bool`       | Yes                | Holds one of two values: `true` or `false`.                     |
| `sound`      | Yes                | Holds a sound reference.                                        |
| `textureid`  | Yes                | Holds a texture reference.                                      |
| `spriteid`   | Yes                | Holds a sprite reference.                                       |
| `state`      | Yes                | A reference to an actor state.                                  |
| `statelabel` | Yes                | The name of an actor state.                                     |
| `void`       | No                 | Alias for `None`. Unknown purpose, likely implementation error. |
| `voidptr`    | No                 | A pointer to a real memory address. Implementation detail.      |

Strings will implicitly convert to `sound` and `statelabel`.

Expressions and Operators
=========================

Literals
--------

Much like C or most other programming languages, ZScript has object literals, including string literals, integer literals, float literals, name literals, boolean literals, and the null pointer.

### String literals

String literals take the same form as in C:

```
"text here"
```

String literals have character escapes, which are formed with a backslash and a character. Character escapes include:

| Spelling                | Output                                        |
| --------                | ------                                        |
| `\"`                    | A literal `"`.                                |
| `\\`                    | A literal `\`.                                |
| `\` followed by newline | Concatenates the next line with this one.     |
| `\a`                    | Byte `0x07` (BEL - bell, anachronism.)        |
| `\b`                    | Byte `0x08` (BS - backspace, anachronism.)    |
| `\c`                    | Byte `0x1c` (TEXTCOLOR_ESCAPE.)               |
| `\f`                    | Byte `0x0c` (FF - form feed, anachronism.)    |
| `\n`                    | Byte `0x0a` (LF - new line.)                  |
| `\t`                    | Byte `0x09` (HT - tab.)                       |
| `\r`                    | Byte `0x0d` (CR - return.)                    |
| `\v`                    | Byte `0x0b` (VT - vertical tab, anachronism.) |
| `\?`                    | A literal `?` (obsolete anachronism.)         |
| `\xnn`                  | Byte `0xnn`.                                  |
| `\Xnn`                  | Byte `0xnn`.                                  |
| `\nnn`                  | Byte `0nnn` (octal.)                          |

To quote [cppreference](https://en.cppreference.com/w/cpp/language/escape), "of the octal escape sequences, `\0` is the most useful because it represents the terminating null character in null-terminated strings."

String literals, also like C and C++, will be concatenated when put directly next to each other. For example, this:

```
"text 1" "text 2"
```

Will be parsed as a single string literal with the text `"text 1text 2"`.

### Class type literals

Class type literals take the same form as string literals, but do note that they are not the same.

### Name literals

Name literals are similar to string literals, though they use apostrophes instead of quote marks:

```
'text here'
```

They do not concatenate like string literals, and do not have character escapes.

### Integer literals

Integer literals are formed similarly to C. They may take one of three forms, and be typed `uint` or `int` based on whether there is a `u` or `U` at the end or not.

The parser also supports an optional `l`/`L` suffix as in C, though it does not actually do anything, and it is advised you do not use it for potential forward compatibility purposes.

Integer literals can be in the basic base-10/decimal form:

```
1234567890 // int
500u       // uint
```

Base-16/hexadecimal form, which may use upper- or lower-case decimals and `0x` prefix, depending on user preference:

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

### Float literals

Float literals, much like integer literals, are formed similarly to C, but they do not support hex-float notation. Float literals support exponent notation.

The parser supports an optional `f`/`F` suffix as in C, though it does not actually do anything, and it is advised you do not use it for potential forward compatibility purposes.

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

### Boolean literals

The two boolean literals are spelled `false` and `true`, and much like C, can decay to the integer literals `0` and `1`.

### Null pointer

The null pointer literal is spelled `null` and represents an object that does not exist in memory. Like C, it is not equivalent to the integer literal `0`, and is more similar to C++'s `nullptr`.

Expressions
-----------

### Primary expressions

Basic expressions, also known as primary expressions, can be one of:

- An identifier for a constant or variable.
- The `Super` keyword.
- Any object literal.
- A vector literal.
- An expression in parentheses.

Identifiers work as you expect, they reference a variable or constant. The `Super` keyword references the parent type or any member within it.

#### Vector literals

Vector literals are not under object literals as they are not constants in the same manner as other literals, since they contain expressions within them. As such, they are expressions, not proper value-based literals. They can be formed with:

```
(x, y)    //=> vector2, where x is not a vector2
(x, y)    //=> vector3, where x *is* a vector2
(x, y, z) //=> vector3
```

All components must have type `double`.

### Postfix expressions

Postfix expressions are affixed at the end of an expression, and are used for a large variety of things, although the actual amount of postfix expressions is small:

| Form                    | Description                                                                                      |
| ----                    | -----------                                                                                      |
| `a([Argument list...])` | Function call.                                                                                   |
| `Type(a)`               | Type cast.                                                                                       |
| `(class<Type>)(a)`      | Class type reference cast.                                                                       |
| `a[b]`                  | Array access.                                                                                    |
| `a.b`                   | Member access.                                                                                   |
| `a++`                   | Post-increment. This increments (adds 1 to) the object after the expression is evaluated.        |
| `a--`                   | Post-decrement. This decrements (subtracts 1 from) the object after the expression is evaluated. |

### Unary expressions

Unary expressions are affixed at the beginning of an expression. The simplest example of a unary expression is the negation operator, `-`, as in `-500`. Unary expressions include:

| Form        | Description                                                                           |
| ----        | -----------                                                                           |
| `-a`        | Negation.                                                                             |
| `!a`        | Logical negation, "not."                                                              |
| `++a`       | Pre-increment. This adds 1 to the object and evaluates as the resulting value.        |
| `--a`       | Pre-decrement. This subtracts 1 from the object and evaluates as the resulting value. |
| `~a`        | Bitwise negation. Flips all bits in an integer.                                       |
| `+a`        | Affirmation. Does not actually do anything.                                           |
| `sizeof a`  | Evaluates the size of the type of an expression. Unknown purpose.                     |
| `alignof a` | Evaluates the alignment of the type of an expression. Unknown purpose.                |

### Binary expressions

Binary expressions operate on two expressions, and are the most common kind of expression. They are used inline like regular math syntax, ie. `1 + 1`. Binary expressions include:

| Form        | Description                                                                       |
| ----        | -----------                                                                       |
| `a + b`     | Addition.                                                                         |
| `a - b`     | Subtraction.                                                                      |
| `a * b`     | Multiplication.                                                                   |
| `a / b`     | Division quotient.                                                                |
| `a % b`     | Division remainder, also known as "modulus." Unlike C, this works on floats, too. |
| `a ** b`    | Exponent ("power of.")                                                            |
| `a << b`    | Left bitwise shift.                                                               |
| `a >> b`    | Right bitwise shift.                                                              |
| `a >>> b`   | Right unsigned bitwise shift.                                                     |
| `a cross b` | Vector cross-product.                                                             |
| `a dot b`   | Vector dot-product.                                                               |
| `a .. b`    | Concatenation, creates a string from two values.                                  |
| `a < b`     | `true` if `a` is less than `b`.                                                   |
| `a > b`     | `true` if `a` is greater than `b`.                                                |
| `a <= b`    | `true` if `a` is less than or equal to `b`.                                       |
| `a >= b`    | `true` if `a` is greater than or equal to `b`.                                    |
| `a == b`    | `true` if `a` is equal to `b`.                                                    |
| `a != b`    | `true` if `a` is not equal to `b`.                                                |
| `a ~== b`   | `true` if `a` is approximately equal to `b`. For strings this is a case-insensitive comparison, for floats and vectors this checks if the difference between the two is smaller than ε. |
| `a && b`    | `true` if `a` and `b` are both `true`.                                            |
| `a \|\| b`  | `true` if `a` or `b` is `true`.                                                   |
| `a is "b"`  | `true` if `a`'s type is equal to or a descendant of `b`.                          |
| `a <>= b`   | Signed difference between `a` and `b`.                                            |
| `a & b`     | Bitwise AND.                                                                      |
| `a ^ b`     | Bitwise XOR.                                                                      |
| `a \| b`    | Bitwise OR.                                                                       |
| `a::b`      | Scope operator. Not implemented yet.                                              |

#### Assignment expressions

Assignment expressions are a subset of binary expressions which *are never constant expressions*. They assign a value to another value, as one might guess.

| Form       | Description               |
| ----       | -----------               |
| `a = b`    | Assigns `b` to `a`.       |
| `a += b`   | Assigns `a + b` to `a`.   |
| `a -= b`   | Assigns `a - b` to `a`.   |
| `a *= b`   | Assigns `a * b` to `a`.   |
| `a /= b`   | Assigns `a / b` to `a`.   |
| `a %= b`   | Assigns `a % b` to `a`.   |
| `a <<= b`  | Assigns `a << b` to `a`.  |
| `a >>= b`  | Assigns `a >> b` to `a`.  |
| `a >>>= b` | Assigns `a >>> b` to `a`. |
| `a \|= b`  | Assigns `a \| b` to `a`.  |
| `a &= b`   | Assigns `a & b` to `a`.   |
| `a ^= b`   | Assigns `a ^ b` to `a`.   |

### Ternary expression

The ternary expression is formed `a ? b : c`, and will evaluate to `b` if `a` is `true`, or `c` if it is `false`.

Statements
==========

All functions are made up of a list of *statements* enclosed with left and right braces, which in and of itself is a statement called a *compound statement*, or *block*.

Compound statements
-------------------

A compound statement is formed as:

```
{
   [Statement list...]
}
```

Note that the statement list is optional, so an empty compound statement `{}` is entirely valid.

Expression statements
---------------------

An expression statement is the single most common type of statement in just about any programming language. In ZScript, exactly like C and C++, an expression statement is simply formed with any expression followed by a semicolon. Function calls and variable assignments are expressions, for instance, so it is quite clear why they are common.

Examples: Expression statements
-------------------------------

Some basic expressions:

```
myCoolFunction(5, 4);
m_myCoolMember = 500;
5 * 5; // does nothing of course, but valid
```

Conditional statements
----------------------

A conditional statement will, conditionally, choose a statement (or none) to execute. They work the same as in C and ACS.

Examples: Conditional statements
--------------------------------

Simple conditional:

```
if(a)
   b();
```

Simple conditional, with else statement and a block:

```
if(a)
{
   b();
   c = d;
}
else
   e = f;
```

Switch statements
-----------------

A switch statement takes an expression of integer or name type and selects a labeled statement to run. They work the same as in C and ACS.

Examples: Switch statements
---------------------------

A switch demonstrating fall-through and default cases:

```
switch(a)
{
case 500: Console.printf("a is 500"); break;
case 501: Console.printf("a is 501"); // falls through to next case
case 502: Console.printf("a is 501 or 502"); break;
default:
   Console.printf("not sure what a is!");
   // break is implied here
}
```

Loop statements
---------------

ZScript has five loop statements, `for`, `while`, `until`, `do while` and `do until`. `for`, `while` and `do while` work the same as in C, C++ and ACS, while `until` and `do until` do the inverse of `while` and `do while`.

The `for` loop takes a limited statement and two optional expressions: The statement for when the loop begins (which is scoped to the loop,) one expression for checking if the loop should break, and one which is executed every time the loop iterates.

The `while` loop simply takes one expression for checking if the loop should break, equivalent to `for(; a;)`.

The `until` loop is equivalent to `while(!a)`.

`do while` and `do until` will only check the expression after the first iteration is complete. The `do while` and `do until` loops are formed as such:

```
do
   Statement
while(a) // unlike C, you don't need a semicolon here

do
   Statement
until(a)
```

Control flow statements
-----------------------

As in C, there are three control flow statements that manipulate where the program will execute statements next, which are available contextually. They are `continue`, `break` and `return`.

`continue` is available in loop statements and will continue to the next iteration immediately.

`break` is available in loop statements and switch statements, and will break out of the containing statement early.

`return` is available in functions. If the function does not return any values, it may only be spelled `return;` and will simply exit the function early. If the function does return values, it takes a comma-separated list for each value returned.

Examples: Control flow statements
---------------------------------

Use of `continue`:

```
for(int i = 0; i < 50; i++)
{
   if(i == 25) continue; // don't do anything on 25!

   doThing(i);
}
```

Use of `break`:

```
for(int i = 0; i < 50; i++)
{
   if(i == 25) break; // exit the loop at 25!

   doThing(i);
}
```

Use of `return` in various contexts:

```
void returnsNothing()
{
   if(m_thing != 50) return; // exit early if m_thing isn't 50.

   doThing(m_thing);
}

int returnsInt()
{
   if(m_thing == 50)
      return 50; // m_thing is 50, so return 50.

   return 0; // must have a return eventually
}

int, int returnsTwoInts()
{
   return 1, 2; // returns 1 and 2.
}
```

Local variable statements
-------------------------

Local variable statements are formed in one of 3 ways. The `let` keyword can be used to automatically determine the type of the variable from the initializer, while the other two syntaxes use an explicit type, and initialization is optional.

```
Type a;
Type a[Expression]; // alternate syntax for local array

let a = b;
Type a = b;
Type a = {Expression list...}; // for fixed size array types
Type a[Expression] = {Expression list...};
```

Multi-assignment statements
---------------------------

Expressions or functions that return multiple values can be assigned into multiple variables with the syntax:

```
[Expression list...] = Expression;
```

Examples: Multi-assignment statements
-------------------------------------

Getting the actor out of `A_SpawnItemEx`:

```
Actor mo;
bool spawned;
[spawned, mo] = A_SpawnItemEx("MyCoolActor");
```

Static array statements
-----------------------

Static arrays can be defined normally as a statement.

Null statements
---------------

A null statement does nothing, and is formed `;`. It is similar to an empty compound statement.

Member declarations
===================

Member declarations define data within a structure or class that can be accessed directly within methods of the object (or its derived classes,) or indirectly from instances of it with the member access operator.

A member declaration is formed as so:

```
[Member declaration flags...] Type name;
```

Or, if you want multiple members with the same type and flags:

```
[Member declaration flags...] Type name[, name...];
```

Note that the types Font and CVar are unserializable as members and must be marked transient.

Member declaration flags
------------------------

| Flag                | Description                                                                                                         |
| ----                | -----------                                                                                                         |
| `private`           | Member is not visible to any class but this one.                                                                    |
| `protected`         | Member is not visible to any class but this one and any descendants of it.                                          |
| `ui`                | Member has UI scope.                                                                                                |
| `play`              | Member has Play scope.                                                                                              |
| `meta`              | Member is read-only static class data. Only really useful on actors, since these can be set via properties on them. |
| `transient`         | Member is not saved into save games. Required for unserializable objects and recommended for UI context objects.    |
| `readonly`          | Member is not writable.                                                                                             |
| `internal`          | Member is only writable from `gzdoom.pk3`.                                                                          |
| `deprecated("ver")` | If accessed, a script warning will occur on load if the archive version is greater than *ver*.                      |
| `native`            | Member is from the engine. Only usable internally.                                                                  |
| `version("ver")`    | Restricted to ZScript version *ver* or higher.                                                                      |

Examples: Member declarations
-----------------------------

Some basic member variables:

```
int m_myCoolInt;
int m_coolInt1, m_coolInt2, m_coolInt3;
int[10] m_coolIntArray;
private int m_coolPrivateInt;
protected meta int m_coolMetaInt;
```

Method definitions
==================

Method definitions define functions within a structure or class that can be accessed directly within other methods of the object (or its derived classes,) or indirectly from instances of it with the member access operator.

Methods marked as `virtual` may have their functionality overridden by derived classes, and in those overrides one can use the `Super` keyword to call the parent function.

Methods are formed as so:

```
[Method definition flags...] Type[, Type...] name([Argument list...]) [const]
{
   [Function body here]
}
```

If `const` is placed after the function signature and before the function body, the method will not be allowed to modify any members in the object instance it's being called on.

The keyword `void` can be used in place of a type (or type list) to have a method which does not have any return value. Similarly, one can place `void` where the argument list might be, although this is redundant as having no argument list at all is allowed.

Arguments of methods may only be of certain types due to technical limitations. See the type table for a list of which are usable and which are not.

Method definition flags
-----------------------

| Flag                | Description                                                                                    |
| ----                | -----------                                                                                    |
| `private`           | Method is not visible to any class but this one.                                               |
| `protected`         | Method is not visible to any class but this one and any descendants of it.                     |
| `static`            | Function is not a method, but a global function without a `self` pointer.                      |
| `ui`                | Method has UI scope.                                                                           |
| `play`              | Method has Play scope.                                                                         |
| `clearscope`        | Method has Data scope.                                                                         |
| `virtualscope`      | Method has scope of the type of the object it's being called on.                               |
| `virtual`           | Method can be overridden in derived classes.                                                   |
| `override`          | Method is overriding a base class' virtual method.                                             |
| `final`             | Virtual method cannot be further overridden from derived classes.                              |
| `action`            | Method has implicit `owner` and `state` parameters, mostly useful on weapons.                  |
| `action(Scope)`     | Same as above, but has an action scope. See "Action Scoping" for more information.             |
| `deprecated("ver")` | If accessed, a script warning will occur on load if the archive version is greater than *ver*. |
| `vararg`            | Method doesn't type-check arguments after `...`. Only usable internally.                       |
| `native`            | Method is from the engine. Only usable internally.                                             |
| `version("ver")`    | Restricted to ZScript version *ver* or higher.                                                 |

Concepts
========

Action Scoping
--------------

On classes derived from Actor, states and methods can be scoped to a certain subset of uses. This is mainly to differentiate actions which take place in inventory items and weapons, and actions which take place in the actual game map. The available scopes are:

| Name      | Description                                   |
| ----      | -----------                                   |
| `actor`   | Actions are called from an actual map object. |
| `overlay` | Actions are called from a weapon overlay.     |
| `weapon`  | Actions are called from a weapon.             |
| `item`    | Actions are called from an inventory item.    |

Object Scoping
--------------

Most objects are subject to object scoping, which restricts the way data can be used in certain contexts. This is to ensure that the playsim does not get changed by the UI, for instance, or that the playsim doesn't read from the UI and break network synchronization. In other words, it is to prevent a multitude of errors that arise when data is modified or read from the wrong places.

There are three scopes in ZScript: Play, UI, and Data (also known as "clearscope.") The Play scope is used for objects that are part of the game simulation and interact with the world in some way or another, while the UI scope is for objects that have no correlation with the world besides perhaps reading information from it. The Data scope is shared between the two, and must be used carefully.

Here is a chart of data access possibilities for each scope:

|                   | Data scope | Play scope | UI scope   |
| -                 | ---------- | ---------- | ---------- |
| From Data context | Read/write | Read-only  | No access  |
| From Play context | Read/write | Read/write | No access  |
| From UI context   | Read/write | Read-only  | Read/write |

Format String
-------------

A format string is a string that specifies the format of a conversion from arbitrary data to a contiguous character string. A format string contains normal characters and *conversion specifiers*. See [this page](https://en.cppreference.com/w/c/io/fprintf) for more information. Differences between C's `printf` and ZScript formats include:

- Since there's no `char` type, `int` is used for `%c`.
- `%s` also works for `name`.
- No `%n` specifier.
- An additional conversion specifier `%B` exists which converts a number to binary.
- An additional conversion specifier `%H` exists which works like `%g` but automatically selects the smallest precision.

API
===

The ZScript API is vast and has some holes which are hard to explain. Some parts are implemented in ways that don't make sense to user code, but are fine to the engine. Because of this, the API shall be documented in pseudo-ZScript which gives an idea of how it works for the modder rather than for the engine.

Type symbols
------------

Integer and floating-point types have symbols which can be accessed through `typename.name`. Here is a list of them.

### Integer types

- `Min`

   Minimum value of type.

- `Max`

   Maximum value of type.

### Floating-point types

- `Min_Normal`

   Minimum value of type.

- `Max`

   Maximum value of type.

- `Epsilon`

   ε value of type.

- `NaN`

   Not-a-Number value of type.

- `Infinity`

   ∞ value of type.

- `Min_Denormal`

   Minimum positive subnormal value of type.

- `Dig`

   Number of decimal digits in type.

- `Min_Exp`

   Minimum exponent bits value of type.

- `Max_Exp`

   Maximum exponent bits value of type.

- `Mant_Dig`

   Number of mantissa bits in type.

- `Min_10_Exp`

   Minimum exponent of type.

- `Max_10_Exp`

   Maximum exponent of type.

Globals
-------

### Global functions

#### Class handling

```
Type New(class typename = ThisClass);
Type GetDefaultByType(TypeName);
```

- `New`

   Typically spelled lowercase (`new`), creates an object with type `typename`. Defaults to using the class of the calling object.

- `GetDefaultByType`

   Gets the default value of any built-in type.

#### Random number generation

All of these functions may have `[identifier]` between the function name and the argument list to specify a named RNG table to use.

```
int Random(int min = 0, int max = 255);
int Random2(uint mask = uint.max);
int RandomPick(int...);
double FRandom(double min, double max);
double FRandomPick(double...);
void SetRandomSeed(uint num);
```

- `Random`

   Returns a random integer between `min` and `max`.

- `Random2`

   Returns a random integer value between `-mask` and `mask`. `mask` is used as a bit mask, so it is recommended to use a value of one less than a power of two (ie. 3, 7, 15, 31, 63, 127, 255...)

- `RandomPick`

   Returns one of the provided parameters randomly.

- `FRandom`

   Returns a random float between `min` and `max`.

- `FRandomPick`

   Same as `RandomPick`, but with floats.

- `SetRandomSeed`

   Sets the seed of the RNG table to `num`.

#### Math

```
Type Min(Type n, Type minimum);
Type Max(Type n, Type maximum);
Type Clamp(Type n, Type minimum, Type maximum);
Type Abs(Type n);
double ATan2(double y, double x);
double VectorAngle(double x, double y);
uint BAM(double angle);
```

- `Min`

   Returns `n` if `n` is more than `minimum`, or `minimum`.

- `Max`

   Returns `n` if `n` is less than `maximum`, or `maximum`.

- `Clamp`

   Returns `n` if `n` is more than `minimum` and less than `maximum`, or either of those values if it is not.

- `Abs`

   Returns `|n|` (absolute of `n`.)

- `ATan2`

   Computes the arctangent of `y / x` using the arguments' signs to determine the correct quadrant.

- `VectorAngle`

   Same as `ATan2`, but with arguments reversed.

- `BAM`

   Returns a byte angle of `angle` (`degrees * (0x40000000 / 90.0)`.)

#### Game

```
string G_SkillName();
int G_SkillPropertyInt(int p);
double G_SkillPropertyFloat(int p);
vector3, int G_PickDeathmatchStart();
vector3, int G_PickPlayerStart(int pnum, int flags = 0);
```

- `G_SkillName`

   The name of the skill in play.

- `G_SkillPropertyInt`

   Returns a skill property. `p` may be:

   | Name                   |
   | ----                   |
   | `SKILLP_FastMonsters`  |
   | `SKILLP_Respawn`       |
   | `SKILLP_RespawnLimit`  |
   | `SKILLP_DisableCheats` |
   | `SKILLP_AutoUseHealth` |
   | `SKILLP_SpawnFilter`   |
   | `SKILLP_EasyBossBrain` |
   | `SKILLP_ACSReturn`     |
   | `SKILLP_NoPain`        |
   | `SKILLP_EasyKey`       |
   | `SKILLP_SlowMonsters`  |
   | `SKILLP_Infight`       |
   | `SKILLP_PlayerRespawn` |

- `G_SkillPropertyFloat`

   Returns a skill property. `p` may be:

   | Name                    |
   | ----                    |
   | `SKILLP_AmmoFactor`     |
   | `SKILLP_DropAmmoFactor` |
   | `SKILLP_ArmorFactor`    |
   | `SKILLP_HealthFactor`   |
   | `SKILLP_DamageFactor`   |
   | `SKILLP_Aggressiveness` |
   | `SKILLP_MonsterHealth`  |
   | `SKILLP_FriendlyHealth` |

- `G_PickDeathmatchStart`

   Returns the position and angle of a random deathmatch start location.

- `G_PickPlayerStart`

   Returns the position and angle of a player start for player `pnum`. `flags` may be:

   | Name                  | Description                                                  |
   | ----                  | -----------                                                  |
   | `PPS_FORCERANDOM`     | Always randomly picks a random player spawn for this player. |
   | `PPS_NOBLOCKINGCHECK` | Does not check if an object is blocking the player spawn.    |

#### Sound

```
void S_Sound(sound sound_id, int channel, float volume = 1, float attenuation = ATTN_NORM);
void S_PauseSound(bool notmusic, bool notsfx);
void S_ResumeSound(bool notsfx);
bool S_ChangeMusic(string music_name, int order = 0, bool looping = true, bool force = false);
float S_GetLength(sound sound_id);
void SetMusicVolume(float vol);
```

- `S_Sound`

   Plays a sound (as defined in SNDINFO) from the calling object if it has world presence (is an actor or sector etc.)

   `channel` may be:

   | Name          | Description                                                        |
   | ----          | -----------                                                        |
   | `CHAN_AUTO`   | Automatically assigns the sound to a free channel (if one exists.) |
   | `CHAN_WEAPON` | For weapon noises.                                                 |
   | `CHAN_VOICE`  | For player grunts.                                                 |
   | `CHAN_ITEM`   | For item pickups.                                                  |
   | `CHAN_BODY`   | For footsteps and generally anything else.                         |
   | `CHAN_5`      | Extra sound channel.                                               |
   | `CHAN_6`      | Extra sound channel.                                               |
   | `CHAN_7`      | Extra sound channel.                                               |

   `channel` may also have the following flags OR'd onto it:

   | Name               | Description                                                                       |
   | ----               | -----------                                                                       |
   | `CHAN_LISTENERZ`   | Sound ignores height entirely, playing at the listener's vertical position.       |
   | `CHAN_MAYBE_LOCAL` | Does not play sound to other players if the silent pickup compat flag is enabled. |
   | `CHAN_UI`          | Does not record sound in savegames/demos.                                         |
   | `CHAN_NOPAUSE`     | Does not pause in menus or when `S_PauseSound` is called.                         |
   | `CHAN_LOOP`        | Continues playing the sound on loop until it is stopped manually.                 |
   | `CHAN_NOSTOP`      | Does not start a new sound if the channel is already playing something.           |

   Additionally, `CHAN_PICKUP` is equivalent to `CHAN_ITEM | CHAN_MAYBE_LOCAL`.

   `attenuation` determines the dropoff distance of the sound. The higher the value, the quicker it fades. Constants include:

   | Name          | Value   | Description                                                                       |
   | ----          | -----   | -----------                                                                       |
   | `ATTN_NONE`   | `0`     | Does not drop off at all, plays throughout the whole map.                         |
   | `ATTN_NORM`   | `1`     | Drops off using the `close_dist` and `clipping_dist` defined in SNDINFO. Default. |
   | `ATTN_IDLE`   | `1.001` | Uses Doom's default sound attenuation.                                            |
   | `ATTN_STATIC` | `3`     | Drops off quickly, at around 512 units.                                           |

- `S_PauseSound`

   Pauses music if `notmusic` is false and all game sounds if `notsfx` is false. Used for instance in the time stop powerup.

- `S_ResumeSound`

   Resumes playing music and, if `notsfx` is false, all game sounds as well.

#### System

```
uint MSTime();
vararg void ThrowAbortException(string format, ...);
```

- `MSTime`

   Returns the number of milliseconds since the engine was started. **Not deterministic.**

- `ThrowAbortException`

   Kills the VM and ends the game (without exiting) with a formatted error.

### Global variables

These variables are accessible in any context and are not bound by any specific object.

#### Static info

```
readonly array<class<Actor>> AllActorClasses;
readonly array<Team> Teams;
readonly array<PlayerClass> PlayerClasses;
readonly array<PlayerSkin> PlayerSkins;

play DehInfo DEH;
readonly GameInfoStruct GameInfo;
readonly textureid SkyFlatNum;
readonly FOptionMenuSettings OptionMenuSettings;
readonly Weapon WP_NOCHANGE;
```

- `AllActorClasses`

   As the name implies, an array of every actor class type reference.

- `Teams`

   An array of all teams. Maximum index is `Team.Max`.

- `PlayerClasses`

   An array of all player classes as defined in MAPINFO/GameInfo and KEYCONF.

- `PlayerSkins`

   An array of all player skins as defined in SKININFO and S_SKIN.

- `DEH`

   TODO

- `GameInfo`

   TODO

- `SkyFlatNum`

   The texture ID for sky flats. `F_SKY1` by default in Doom.

- `OptionMenuSettings`

   TODO

- `WP_NOCHANGE`

   A constant denoting that the weapon the player is currently holding shouldn't be switched from.

#### Game state

```
int ValidCount;
readonly bool AutomapActive;
play uint GameAction;
readonly int GameState;
readonly int GameTic;
readonly bool DemoPlayback;
readonly uint8 GlobalFreeze;
play LevelLocals Level;
```

- `ValidCount`

   Don't use this.

- `AutomapActive`

   `true` if the automap is currently open on the client. **Not deterministic.**

- `GameAction`

   Current global game action. May be one of:

   | Name                  | Description          |
   | ----                  | -----------          |
   | `ga_nothing`          | Does nothing.        |
   | `ga_loadlevel`        | Don't use this.      |
   | `ga_newgame`          | Don't use this.      |
   | `ga_newgame2`         | Don't use this.      |
   | `ga_recordgame`       | Don't use this.      |
   | `ga_loadgame`         | Don't use this.      |
   | `ga_loadgamehideicon` | Don't use this.      |
   | `ga_loadgameplaydemo` | Don't use this.      |
   | `ga_autoloadgame`     | Don't use this.      |
   | `ga_savegame`         | Don't use this.      |
   | `ga_autosave`         | Creates an autosave. |
   | `ga_playdemo`         | Don't use this.      |
   | `ga_completed`        | Don't use this.      |
   | `ga_slideshow`        | Don't use this.      |
   | `ga_worlddone`        | Don't use this.      |
   | `ga_screenshot`       | Takes a screenshot.  |
   | `ga_togglemap`        | Toggles the automap. |
   | `ga_fullconsole`      | Don't use this.      |

- `GameState`

   Current global game state. May be one of:

   | Name              | Description                                          |
   | ----              | -----------                                          |
   | `GS_LEVEL`        | Inside a level.                                      |
   | `GS_INTERMISSION` | Inbetween levels.                                    |
   | `GS_FINALE`       | Reading a cluster end text or at the end sequence.   |
   | `GS_DEMOSCREEN`   | Inside a level but watching a demo in the main menu. |
   | `GS_FULLCONSOLE`  | Outside of a level, console only.                    |
   | `GS_HIDECONSOLE`  | Outside of a level, console hidden (ie. main menu.)  |
   | `GS_STARTUP`      | Game not yet initialized.                            |
   | `GS_TITLELEVEL`   | Watching a TITLEMAP in the main menu.                |

- `GameTic`

   Number of game tics passed since engine initialization. **Not deterministic.**

- `DemoPlayback`

   Watching a demo.

- `GlobalFreeze`

   TODO: I have no idea what the difference between this and `Level.Frozen` is.

- `Level`

   All level info as defined in LevelLocals.

#### Client

```
KeyBindings Bindings;
KeyBindings AutomapBindings;
readonly Font SmallFont;
readonly Font SmallFont2;
readonly Font BigFont;
readonly Font ConFont;
readonly Font IntermissionFont;
readonly int CleanXFac;
readonly int CleanYFac;
readonly int CleanWidth;
readonly int CleanHeight;
readonly int CleanXFac_1;
readonly int CleanYFac_1;
readonly int CleanWidth_1;
readonly int CleanHeight_1;
ui int MenuActive;
ui int BackbuttonTime;
ui float BackbuttonAlpha;
ui BaseStatusBar StatusBar;
int LocalViewPitch;
```

- `Bindings`

   TODO

- `AutomapBindings`

   TODO

- `SmallFont`

   The `smallfnt` for the current game.

- `SmallFont2`

   The alternate `smallfnt`.

- `BigFont`

   The `bigfont` for the current game.

- `ConFont`

   The console font.

- `IntermissionFont`

   The font used in intermission screens.

- `CleanXFac`

   TODO

- `CleanYFac`

   TODO

- `CleanWidth`

   TODO

- `CleanHeight`

   TODO

- `CleanXFac_1`

   TODO

- `CleanYFac_1`

   TODO

- `CleanWidth_1`

   TODO

- `CleanHeight_1`

   TODO

- `MenuActive`

   The current active menu state. One of:

   | Name             | Description                                                    |
   | ----             | -----------                                                    |
   | `Menu.Off`       | No active menu.                                                |
   | `Menu.On`        | Menu is open, game is paused.                                  |
   | `Menu.OnNoPause` | Menu is opened, but the game is not paused.                    |
   | `Menu.WaitKey`   | Menu is opened, waiting for a key for a controls menu binding. |

- `BackbuttonTime`

   The time until the back button starts fading out in menus.

- `BackbuttonAlpha`

   Alpha of the back button in menus.

- `StatusBar`

   TODO

- `LocalViewPitch`

   The pitch angle (in degrees) of `ConsolePlayer`'s view. **Not deterministic.**


#### Players

```
readonly bool Multiplayer;
readonly int ConsolePlayer;
readonly int Net_Arbitrator;
play PlayerInfo Players[MAXPLAYERS];
readonly bool PlayerInGame[MAXPLAYERS];
```

- `Multiplayer`

   Game is networked.

- `ConsolePlayer`

   Number of the player running the client. **Not deterministic.**

- `Net_Arbitrator`

   Number of the player who initiated the game.

- `Players`

   PlayerInfo structs for each player.

- `PlayerInGame`

   `true` if the player is currently in-game.

Built-in types
--------------

### Object

The base class of all `class` types.

```
class Object
{
   bool bDestroyed;

   class GetClass();
   class GetParentClass();
   string GetClassName();

   virtualscope void Destroy();

   virtual virtualscope void OnDestroy();
}
```

- `bDestroyed`

   This object wants to be destroyed but has not yet been garbage collected.

- `GetClass`

   Returns the class type of this object.

- `GetParentClass`

   Returns the class type of this object's parent class.

- `GetClassName`

   Returns a string representation of the class type of this object.

- `Destroy`

   Destroys this object. Do not use the object after calling this. References to it will be invalidated.

- `OnDestroy`

   Called when the object is collected by the garbage collector. **Not deterministic.**

### Array

While ZScript does not have proper user-facing generics, `Array` is one such type that does have a type parameter. It mirrors the internal `TArray` type.

```
struct Array<Type>
{
   void Copy(array<Type> other);
   void Move(array<Type> other);
   uint Find(Type item) const;
   uint Push(Type item);
   bool Pop();
   void Delete(uint index, int count = 1);
   void Insert(uint index, Type item);
   void ShrinkToFit();
   void Grow(uint amount);
   void Resize(uint amount);
   uint Reserve(uint amount);
   uint Max() const;
   uint Size() const;
   void Clear();
}
```

- `Copy`

   Copies another array's contents into this array.

- `Move`

   Moves another array's contents into this array.

- `Find`

   Finds the index of `item` in the array, or `Size` if it couldn't be found.

- `Push`

   Places `item` at the end of the array, calling `Grow` if necessary.

- `Pop`

   Deletes the last item in the array. Returns `false` if there are no items in the array.

- `Delete`

   Deletes `count` object(s) at `index`. Moves objects after them into their place.

- `Insert`

   Inserts `item` at `index`. Moves objects after `index` to the right.

- `ShrinkToFit`

   Shrinks the allocated array size `Max` to `Size`.

- `Grow`

   Ensures the array can hold at least `amount` new members.

- `Resize`

   Changes the allocated array size to `amount`. Deletes members if `amount` is smaller than `Size`.

- `Reserve`

   Adds `amount` new entries at the end of the array, increasing `Size`. Calls `Grow` if necessary.

- `Max`

   Returns the allocated size of the array.

- `Size`

   Returns the amount of objects in the array.

- `Clear`

   Clears out the entire array.

### Color

Colors simply store red, green, blue and alpha components.

```
struct Color
{
   uint8 r, g, b, a;
}
```

### FixedArray

Fixed-size arrays have a size method attached to them for convenience purposes.

```
struct FixedArray
{
   uint Size() const;
}
```

- `Size`

   Returns the size of the array. This is a compile-time constant.

### String

```
struct String
{
   static vararg string Format(string format, ...);

   vararg void AppendFormat(string format, ...);
   void Replace(string pattern, string replacement);
   string Left(int len) const;
   string Mid(int pos = 0, int len = int.max) const;
   void Truncate(int newlen);
   void Remove(int index, int amount);
   string CharAt(int pos) const;
   int CharCodeAt(int pos) const;
   string Filter();
   int IndexOf(string substr, int start = 0) const;
   deprecated("3.5.1") int LastIndexOf(string substr, int end = int.max) const;
   int RightIndexOf(string substr, int end = int.max) const;
   void ToUpper();
   void ToLower();
   int ToInt(int base = 0) const;
   double ToDouble() const;
   void Split(out array<string> tokens, string delimiter, EmptyTokenType keepEmpty = TOK_KEEPEMPTY) const;
   uint Length() const;
}
```

- `Format`

   Creates a string using a format string and any amount of arguments.

- `Replace`

   Replaces all instances of `pattern` with `replacement` in place.

- `AppendFormat`

   Works like `Format`, but appends the result to the string.

- `Left`

   Returns the first `len` characters as a new string.

- `Mid`

   Returns `len` characters starting at `pos` as a new string.

- `Truncate`

   Truncates the string to `len` characters in place.

- `Remove`

   Removes `amount` characters starting at `index` in place.

- `CharAt`

   Returns the character at `pos` as a new string.

- `CharCodeAt`

   Returns the character at `pos` as an integer.

- `Filter`

   Replaces escape sequences in a string with escaped characters as a new string.

- `IndexOf`

   Returns the first index of `substr` starting from the left at `start`.

- `LastIndexOf`

   Broken. Use `RightIndexOf` instead.

- `RightIndexOf`

   Returns the first index of `substr` starting from the right at `end`.

- `ToUpper`

   Converts all characters in the string to uppercase in place.

- `ToLower`

   Converts all characters in the string to lowercase in place.

- `ToInt`

   Interprets the string as a base `base` integer, guessing the base if it is `0`.

- `ToDouble`

   Interprets the string as a double precision floating point number.

- `Split`

   Splits the string by each `delimiter` into `tokens`. `keepEmpty` may be either `TOK_SKIPEMPTY` (the default) or `TOK_KEEPEMPTY`, which will keep or discard empty strings found while splitting.

### TextureID

Texture IDs can be explicitly converted to integers, but not the other way around. You can add and subtract integers with a `textureid`, however. (This only works with the integer on the right hand side.)

```
struct TextureID
{
   bool IsValid() const;
   bool IsNull() const;
   bool Exists() const;
   void SetInvalid();
   void SetNull();
}
```

- `IsValid`

   Checks if the texture index is not the invalid index (`-1`.)

- `IsNull`

   Checks if the texture is the null index (`0`.)

- `Exists`

   Checks if the texture exists within the texture manager at all.

- `SetInvalid`

   Sets the texture index to `-1`.

- `SetNull`

   Sets the texture index to `0`.

   The proper way to zero-initialize a `textureid` is:

   ```
   textureid tex;
   tex.SetNull();
   ```

### Vector2/Vector3

```
struct Vector2
{
   double x, y;

   double Length() const;
   vector2 Unit() const;
}

struct Vector3
{
   double x, y, z;
   vector2 xy;

   double Length() const;
   vector3 Unit() const;
}
```

- `Length`

   Returns the length (magnitude) of the vector.

- `Unit`

   Returns a normalized vector. Equivalent to `vec / vec.length()`.

Level Data
----------

### Vertex

```
struct Vertex play
{
   readonly vector2 p;
}
```

- `p`

   The point this object represents.

### Side

Also known as a "sidedef." One of the textured sides of a line. Each sidedef has three portions: Upper, middle, and lower. The middle texture is special as it can have transparency.

The three portions of a sidedef can be referred to with:

| Name          | Description         |
| ----          | -----------         |
| `Side.Top`    | The upper portion.  |
| `Side.Mid`    | The middle portion. |
| `Side.Bottom` | The lower portion.  |

```
struct Side play
{
   readonly Sector Sector;
   readonly Line   Linedef;

   int16 Light;
   uint8 Flags;

   int Index();

   clearscope Vertex V1();
   clearscope Vertex V2();

   textureid GetTexture(int which);
   double GetTextureXOffset(int which);
   double GetTextureYOffset(int which);
   double GetTextureXScale(int which);
   double GetTextureYScale(int which);

   void SetTexture(int which, textureid tex);
   void SetTextureXOffset(int which, double offset);
   void SetTextureYOffset(int which, double offset);
   void SetTextureXScale(int which, double scale);
   void SetTextureYScale(int which, double scale);

   void AddTextureXOffset(int which, double delta);
   void AddTextureYOffset(int which, double delta);

   void MultiplyTextureXScale(int which, double delta);
   void MultiplyTextureYScale(int which, double delta);

   int GetUDMFInt(name nm);
   double GetUDMFFloat(name nm);
   string GetUDMFString(name nm);
}
```

- `Sector`

   The sector this side belongs to.

- `Linedef`

   The line this side belongs to.

- `Light`

   The light level of this side.

- `Flags`

   Any combination of the following bit flags:

   | Name                   | Description                                                                 |
   | ----                   | -----------                                                                 |
   | `WALLF_ABSLIGHTING`    | Light is absolute instead of relative to the sector.                        |
   | `WALLF_NOAUTODECALS`   | Don't attach decals to this surface.                                        |
   | `WALLF_NOFAKECONTRAST` | Disables the "fake contrast" effect for this side.                          |
   | `WALLF_SMOOTHLIGHTING` | Applies a unique contrast at all angles.                                    |
   | `WALLF_CLIP_MIDTEX`    | Clips the middle texture when it goes under the floor or above the ceiling. |
   | `WALLF_WRAP_MIDTEX`    | Repeats the middle texture infinitely on the vertical axis.                 |
   | `WALLF_POLYOBJ`        | This sidedef belongs to a polyobject.                                       |
   | `WALLF_LIGHT_FOG`      | The wall's lighting will ignore fog effects.                                |

- `Index`

   Returns the index of this side.

- `V1`, `V2`

   Returns the start and end points of this sidedef, respectively.

- `GetTexture`, `SetTexture`

   Gets or sets the texture of one portion of the sidedef.

- `GetTextureXOffset`, `SetTextureXOffset`, `AddTextureXOffset`

   Gets, sets or adds to the texture portion's horizontal offset.

- `GetTextureYOffset`, `SetTextureYOffset`, `AddTextureYOffset`

   Gets, sets or adds to the texture portion's vertical offset.

- `GetTextureXScale`, `SetTextureXScale`, `MultiplyTextureXScale`

   Gets, sets or multiplies the texture portion's horizontal scale.

- `GetTextureYScale`, `SetTextureYScale`, `MultiplyTextureYScale`

   Gets, sets or multiplies the texture portion's vertical scale.

- `GetUDMFInt`, `GetUDMFFloat`, `GetUDMFString`

   Gets a named UDMF property attached to this sidedef.

### Line

Also known as a "linedef." A line segment with two sides and two vertices.

```
struct Line
{
   readonly Vertex  V1, V2;
   readonly vector2 Delta;
   readonly Side    Sidedef[2];
   readonly double  BBox[4];
   readonly Sector  FrontSector;
   readonly Sector  BackSector;

   readonly uint PortalIndex;
   readonly uint PortalTransferred;

   int    ValidCount;
   uint   Flags;
   double Alpha;

   uint Activation;
   int  LockNumber;
   int  Special;
   int  Args[5];

   int Index();

   bool Activate(Actor activator, int side, int type);
   bool RemoteActivate(Actor activator, int side, int type, vector3 pos);

   bool IsLinePortal();
   bool IsVisualPortal();
   Line GetPortalDestination();

   int GetUDMFInt(name nm);
   double GetUDMFFloat(name nm);
   string GetUDMFString(name nm);
}
```

- `V1`, `V2`

   Returns the start and end points of this line segment, respectively.

- `Delta`

   Equivalent to `V2 - V1`.

- `Sidedef`

   The front and back sides of this line, 0 and 1 respectively. The aliases `Line.Front` and `Line.Back` are provided as well.

- `BBox`

   The top, bottom, left and right of the line, respective to array index.

- `FrontSector`, `BackSector`

   The sector of the front and back sides of this line.

- `PortalIndex`

   TODO

- `PortalTransferred`

   TODO

- `ValidCount`

   Don't use this.

- `Flags`

   Any combination of the following bit flags:

   | Name                     | Description                                                                       |
   | ----                     | -----------                                                                       |
   | `ML_BLOCKING`            | Line is solid and blocks everything but projectiles and hitscans.                 |
   | `ML_BLOCKMONSTERS`       | Line blocks non-flying monsters.                                                  |
   | `ML_BLOCKPROJECTILE`     | Line blocks projectiles.                                                          |
   | `ML_BLOCKHITSCAN`        | Line blocks hitscans.                                                             |
   | `ML_BLOCK_FLOATERS`      | Line blocks flying monsters.                                                      |
   | `ML_BLOCK_PLAYERS`       | Line blocks players.                                                              |
   | `ML_BLOCKEVERYTHING`     | Line blocks everything.                                                           |
   | `ML_BLOCKUSE`            | Line blocks use actions.                                                          |
   | `ML_BLOCKSIGHT`          | Line blocks line of sight.                                                        |
   | `ML_TWOSIDED`            | Line has a back side.                                                             |
   | `ML_CLIP_MIDTEX`         | Applies `WALLF_CLIP_MIDTEX` to both sides.                                        |
   | `ML_WRAP_MIDTEX`         | Applies `WALLF_WRAP_MIDTEX` to both sides.                                        |
   | `ML_DONTPEGTOP`          | Upper texture is un-pegged on both sides.                                         |
   | `ML_DONTPEGBOTTOM`       | Lower texture is un-pegged on both sides.                                         |
   | `ML_ADDTRANS`            | Middle textures are drawn with additive translucency on both sides.               |
   | `ML_SECRET`              | Line will be shown as one-sided on the automap.                                   |
   | `ML_DONTDRAW`            | Never shown on the automap.                                                       |
   | `ML_MAPPED`              | Always shown on the automap.                                                      |
   | `ML_SOUNDBLOCK`          | Blocks sound propogation after two lines with this flag.                          |
   | `ML_ZONEBOUNDARY`        | Unknown. (TODO)                                                                   |
   | `ML_REPEAT_SPECIAL`      | Special may be activated multiple times.                                          |
   | `ML_MONSTERSCANACTIVATE` | Monsters may activate this line.                                                  |
   | `ML_CHECKSWITCHRANGE`    | Checks the activator's vertical position as well as horizontal before activating. |
   | `ML_RAILING`             | Unknown. (TODO)                                                                   |
   | `ML_3DMIDTEX`            | Middle texture can be collided with and walked on as if it were a thin sector.    |
   | `ML_3DMIDTEX_IMPASS`     | Unknown. (TODO)                                                                   |
   | `ML_FIRSTSIDEONLY`       | Unknown. (TODO)                                                                   |

- `Alpha`

   Alpha of the middle texture on both sides.

- `Activation`

   TODO

- `LockNumber`

   TODO

- `Special`

   Number of the special action to be executed when this line is activated.

- `Args`

   Arguments of the line's special action.

- `Index`

   Returns the index of this line.

- `Activate`

   TODO

- `RemoteActivate`

   TODO

- `IsLinePortal`

   TODO

- `IsVisualPortal`

   TODO

- `GetPortalDestination`

   TODO

- `GetUDMFInt`, `GetUDMFFloat`, `GetUDMFString`

   Gets a named UDMF property attached to this linedef.

### Sector

TODO

### SectorPortal

TODO

### SectorTagIterator

TODO

### LineIdIterator

Iterates over line indices with a specified tag.

```
class LineIdIterator
{
   static LineIdIterator Create(int tag);

   int Next();
}
```

- `Create`

   Creates a new iterator over lines with tag `tag`.

- `Next`

   Returns the index of the current line and advances the iterator. Returns -1 when the list is exhausted.

### LevelLocals

TODO

```
struct LevelLocals
{
   // Map data
   array<Sector> Sectors;
   array<Line>   Lines;
   array<Side>   Sides;

   readonly array<Vertex>       Vertexes;
   internal array<SectorPortal> SectorPortals;

   // Stats
   int Total_Secrets;
   int Found_Secrets;
   int Total_Items;
   int Found_Items;
   int Total_Monsters;
   int Killed_Monsters;

   // Time
   readonly int Time;
   readonly int MapTime;
   readonly int TotalTime;
   readonly int StartTime;
   readonly int ParTime;
   readonly int SuckTime;

   // Map sequencing
   readonly int    Cluster;
   readonly int    ClusterFlags;
   readonly int    LevelNum;
   readonly string LevelName;
   readonly string MapName;

   string NextMap;
   string NextSecretMap;

   readonly int MapType;

   // Music
   readonly string Music;
   readonly int    MusicOrder;

   // Sky
   readonly textureid SkyTexture1;
   readonly textureid SkyTexture2;

   float SkySpeed1;
   float SkySpeed2;

   // Physics
   play double Gravity;
   play double AirControl
   play double AirFriction;
   play int    AirSupply;

   // State
   bool AllMap;
   bool Frozen;

   // Static info
   string F1Pic;
   readonly double TeamDamage;
   readonly bool   NoInventoryBar;
   readonly bool   MonstersTelefrag;
   readonly bool   ActOwnSpecial;
   readonly bool   SndSeqTotalCtrl;
   readonly bool   MissilesActivateImpact;
   readonly bool   MonsterFallingDamage;
   readonly bool   CheckSwitchRange;
   readonly bool   PolyGrind;
   readonly bool   NoMonsters;
   readonly bool   AllowRespawn;
   readonly bool   Infinite_Flight;
   readonly bool   No_Dlg_Freeze;
   readonly int    FogDensity;
   readonly int    OutsideFogDensity;
   readonly int    SkyFog;
   readonly float  PixelStretch;

   string GetUDMFString(int type, int index, name key);
   int GetUDMFInt(int type, int index, name key);
   double GetUDMFFloat(int type, int index, name key);

   bool ExecuteSpecial(int special, Actor activator, Line linedef, bool lineside, int arg1 = 0, int arg2 = 0, int arg3 = 0, int arg4 = 0, int arg5 = 0);

   void SetInterMusic(string nextmap);
   string FormatMapName(int mapnamecolor);
   string GetChecksum() const;
   void ChangeSky(textureid sky1, textureid sky2);
   string TimeFormatted(bool totals = false);

   bool IsJumpingAllowed() const;
   bool IsCrouchingAllowed() const;
   bool IsFreelookAllowed() const;

   static void GiveSecret(Actor activator, bool printmsg = true, bool playsound = true);
   static void StartSlideshow(name whichone = 'none');
   static void WorldDone();
   static void RemoveAllBots(bool fromlist);

   static clearscope vector2 Vec2Diff(vector2 v1, vector2 v2);
   static clearscope vector3 Vec3Diff(vector3 v1, vector3 v2);
   static clearscope vector3 SphericalCoords(vector3 viewpoint, vector3 targetPos, vector2 viewAngles = (0, 0), bool absolute = false);
   static clearscope vector2 Vec2Offset(vector2 pos, vector2 dir, bool absolute = false);
   static clearscope vector3 Vec2OffsetZ(vector2 pos, vector2 dir, double atz, bool absolute = false);
   static clearscope vector3 Vec3Offset(vector3 pos, vector3 dir, bool absolute = false);
}
```

Players
-------

### PlayerInfo

TODO

### PlayerClass

A player class as defined in either MAPINFO/GameInfo or KEYCONF.

```
struct PlayerClass
{
   class<Actor> Type;
   uint         Flags;
   array<int>   Skins;

   bool CheckSkin(int skin);
   void EnumColorsets(out array<int> data);
   name GetColorsetName(int setnum);
}
```

- `Type`

   The class type reference for this player class.

- `Flags`

   Not currently implemented correctly, `PCF_NOMENU` does not exist in ZScript, but its value is `1` if you need to check for that.

- `Skins`

   Skin indices available to this player class.

- `CheckSkin`

   Checks if `skin` is in `Skins`.

- `EnumColorsets`

   TODO

- `GetColorsetName`

   TODO

### PlayerSkin

A player skin as defined in SKININFO or S_SKIN.

```
struct PlayerSkin
{
   string  SkinName;
   string  Face;
   uint8   Gender;
   uint8   Range0Start;
   uint8   Range0End;
   bool    OtherGame;
   vector2 Scale;
   int     Sprite;
   int     CrouchSprite;
   int     NameSpc;
}
```

- `SkinName`

   Name of the skin.

- `Face`

   Prefix for statusbar face graphics.

- `Gender`

   Default gender of the skin (0 for male, 1 for female, 2 for other.)

- `Range0Start`

   The beginning of the translation range to be used for changing the player sprite's color.

- `Range0End`

   The end of the translation range to be used for changing the player sprite's color.

- `OtherGame`

   The player skin is made for another game and needs to be color remapped differently.

- `Scale`

   The scaling factor used for the player sprite.

- `Sprite`

   The sprite ID for this skin.

- `CrouchSprite`

   The crouching sprite ID for this skin.

- `NameSpc`

   If this skin was defined in S_SKIN, this refers to the marker lump itself.

### Team

A team as defined in TEAMINFO.

```
struct Team
{
   const NoTeam;
   const Max;

   string mName;
}
```

- `NoTeam`

   A constant index for a player with no team.

- `Max`

   The maximum number of teams.

- `mName`

   The name of the team.

Weapons
-------

### Weapon

TODO

Drawing
-------

### Font

A font as defined in FONTDEFS or a ZDoom or bitmap font file.

```
struct Font
{
   static int FindFontColor(name color);
   static Font FindFont(name fontname);
   static Font GetFont(name fontname);

   int GetCharWidth(int code);
   int StringWidth(string code);
   int GetHeight();
   string GetCursor();
   BrokenLines BreakLines(string text, int maxlen);
}
```

- `FindFontColor`

   Returns the color range enumeration for a named color.

- `FindFont`

   Gets a font as defined in FONTDEFS.

- `GetFont`

   Gets a font either as defined in FONTDEFS or a ZDoom/bitmap font.

- `GetCharWidth`

   Returns the width in pixels of a character code.

- `StringWidth`

   Returns the width in pixels of the string.

- `GetHeight`

   Returns the line height of the font.

- `GetCursor`

   Returns the string used as a blinking cursor graphic for this font.

- `BreakLines`

   Breaks `text` up into a `BrokenLines` structure according to the screen and clip region, as well as appropriately accounting for a maximum width in pixels of `maxlen`.

### BrokenLines

A container representing an array of lines of text that have been broken up to fit the screen and clipping region.

```
class BrokenLines
{
   int Count();
   int StringWidth(int line);
   string StringAt(int line);
}
```

- `Count`

   Returns the amount of lines in this container.

- `StringWidth`

   Returns the width (in pixels) of line `line`.

- `StringAt`

   Returns the text of line `line`.

### TexMan

The **Tex**ture **Man**ager is used for loading, finding, replacing and getting information on textures.

```
struct TexMan
{
   static textureid CheckForTexture(string name, int usetype, int flags = TexMan.TryAny);
   static void ReplaceTextures(string from, string to, int flags);
   static string GetName(textureid tex);
   static int, int GetSize(textureid tex);
   static vector2 GetScaledSize(textureid tex);
   static vector2 GetScaledOffset(textureid tex);
   static int CheckRealHeight(textureid tex);
   static void SetCameraToTexture(Actor viewpoint, string texture, double fov);
}
```

- `CheckForTexture`

   Returns a `textureid` for the texture named `name`. `usetype` may be one of the following, which selects what kind of texture to find:

   | Name                       | Description                                                    |
   | ----                       | -----------                                                    |
   | `TexMan.Type_Any`          | Returns any kind of texture.                                   |
   | `TexMan.Type_Wall`         | Returns any composited wall texture, ie. `STARTAN2`.           |
   | `TexMan.Type_Flat`         | Returns any flat, ie. `FLOOR0_1`.                              |
   | `TexMan.Type_Sprite`       | Returns a sprite, ie. `MEDIA0`.                                |
   | `TexMan.Type_WallPatch`    | Returns an uncomposited patch, ie. `DOOR2_1`.                  |
   | `TexMan.Type_Build`        | Returns a tile from a BUILD TILES entry.                       |
   | `TexMan.Type_SkinSprite`   | Unknown. (TODO)                                                |
   | `TexMan.Type_Decal`        | Unknown. (TODO)                                                |
   | `TexMan.Type_MiscPatch`    | Unknown. (TODO)                                                |
   | `TexMan.Type_FontChar`     | Unknown. (TODO)                                                |
   | `TexMan.Type_Override`     | Unknown. (TODO)                                                |
   | `TexMan.Type_Autopage`     | Returns an automap background graphic. (TODO: needs example)   |
   | `TexMan.Type_SkinGraphic`  | Unknown. (TODO)                                                |
   | `TexMan.Type_Null`         | Returns the null graphic. Ignores `name`.                      |
   | `TexMan.Type_FirstDefined` | Unknown. (TODO)                                                |

   `flags` may be any of the following combined (with the bitwise OR operator `|`:)

   | Name                   | Description                                     |
   | ----                   | -----------                                     |
   | `TexMan.TryAny`        | Default. Unknown. (TODO)                        |
   | `TexMan.Overridable`   | Unknown. (TODO)                                 |
   | `TexMan.ReturnFirst`   | Unknown. (TODO)                                 |
   | `TexMan.AllowSkins`    | Unknown. (TODO)                                 |
   | `TexMan.ShortNameOnly` | Will force use of a short name when searching.  |
   | `TexMan.DontCreate`    | Will never create a new texture when searching. |

- `ReplaceTextures`

   Replaces textures named `from` with `to` within the map. `flags` may be used to filter out certain textures from being replaced:

   | Name                 | Description                          |
   | ----                 | -----------                          |
   | `TexMan.NOT_BOTTOM`  | Filters out linedef bottom textures. |
   | `TexMan.NOT_MIDDLE`  | Filters out linedef middle textures. |
   | `TexMan.NOT_TOP`     | Filters out linedef upper textures.  |
   | `TexMan.NOT_FLOOR`   | Filters out floor flats.             |
   | `TexMan.NOT_CEILING` | Filters out ceiling flats.           |
   | `TexMan.NOT_WALL`    | Filters out any linedef texture.     |
   | `TexMan.NOT_FLAT`    | Filters out any flat texture.        |

- `GetName`

   Returns the original name of a `textureid`.

- `GetSize`

   Returns the width and height of a `textureid`.

- `GetScaledSize`

   TODO

- `GetScaledOffset`

   TODO

- `CheckRealHeight`

   TODO

- `SetCameraToTexture`

   Sets the camera texture (as defined in ANIMDEFS) `texture` to the viewpoint of `viewpoint` with a fov of `fov`.
