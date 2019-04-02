Language
========

<!-- vim-markdown-toc GFM -->

* [Reading This Document](#reading-this-document)
* [Translation Unit](#translation-unit)
* [Versions](#versions)
* [Top-level](#top-level)
* [Class definitions](#class-definitions)
      * [Example: Class headers](#example-class-headers)
      * [Example: Class definitions](#example-class-definitions)
   * [Class flags](#class-flags)
   * [Class content](#class-content)
   * [Property definitions](#property-definitions)
      * [Example: Property definitions](#example-property-definitions)
   * [Flag definitions](#flag-definitions)
      * [Example: Flag definitions](#example-flag-definitions)
   * [Default blocks](#default-blocks)
      * [Default flag](#default-flag)
      * [Default property](#default-property)
   * [State definitions](#state-definitions)
* [Structure definitions](#structure-definitions)
      * [Example: Structure definitions](#example-structure-definitions)
   * [Structure flags](#structure-flags)
   * [Structure content](#structure-content)
* [Enumeration definitions](#enumeration-definitions)
      * [Example: Enumeration definitions](#example-enumeration-definitions)
* [Constant definitions](#constant-definitions)
      * [Example: Constant definitions](#example-constant-definitions)
* [Static array definitions](#static-array-definitions)
* [Include directives](#include-directives)
      * [Example: Include directives](#example-include-directives)
* [Types](#types)
   * [Integers](#integers)
      * [Symbols](#symbols)
   * [Floating-point types](#floating-point-types)
      * [Symbols](#symbols-1)
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
   * [Variable name](#variable-name)
   * [Array size](#array-size)
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
         * [Argument list](#argument-list)
      * [Unary expressions](#unary-expressions)
      * [Binary expressions](#binary-expressions)
         * [Assignment expressions](#assignment-expressions)
      * [Ternary expression](#ternary-expression)
* [Statements](#statements)
   * [Compound statements](#compound-statements)
   * [Expression statements](#expression-statements)
      * [Example: Expression statements](#example-expression-statements)
   * [Conditional statements](#conditional-statements)
      * [Example: Conditional statements](#example-conditional-statements)
   * [Switch statements](#switch-statements)
      * [Example: Switch statements](#example-switch-statements)
   * [Loop statements](#loop-statements)
   * [Control flow statements](#control-flow-statements)
      * [Example: Control flow statements](#example-control-flow-statements)
   * [Local variable statements](#local-variable-statements)
   * [Multi-assignment statements](#multi-assignment-statements)
      * [Example: Multi-assignment statements](#example-multi-assignment-statements)
   * [Static array statements](#static-array-statements)
   * [Null statements](#null-statements)
* [Member declarations](#member-declarations)
      * [Example: Member declarations](#example-member-declarations)
   * [Member declaration flags](#member-declaration-flags)
* [Method definitions](#method-definitions)
   * [Method argument list](#method-argument-list)
      * [Example: Method argument lists](#example-method-argument-lists)
   * [Method definition flags](#method-definition-flags)
      * [Action functions](#action-functions)

<!-- vim-markdown-toc -->

ZScript is a new (circa 2017) scripting language that has sprung from the
ceasing of ZDoom and the subsequent reprisal of GZDoom as mainline. It is
similar to Java, though it has many deficiencies, oddities and other such
issues. Despite this, it is still the most powerful Doom modding tool since
straight up source editing, and will likely stay that way for a while until
Eternity Engine inevitably becomes competition-worthy with scripting additions.

This documentation serves as an introduction to and informal specification of
the ZScript language from a programmer's viewpoint. It should also be useful
for non-programmers looking for specifics on the inner workings of the language
and more information on the functions and properties provided to it.

ZScript runs in a virtual machine much like ACS, although because it is *not*
compiled to bytecode and uses an object-oriented structure, the virtual machine
is far more complex, and also therefore quite a bit slower. ZScript may only be
read from source files by the engine, which has several benefits as well as
detriments. It is the opinion of the author that this is a bad solution, but
the author will refrain from going on a several-paragraph tirade about why
bytecode is always better than source, even if it is an optional component.

In any case, here we are. This documentation will detail all aspects of
ZScript, from the language and type system to the API and finer details. This
document is distributed under the [CC0 public domain license](LICENSE.txt) in
the hope that it is useful reference and serves as a solid basis for further
writings. This document was originally written by Alison Sanderson (Marrub.)
Attribution is encouraged but not required.

Reading This Document
=====================

This document's syntaxes are written in a specific way to be easy to read but
still close enough to a formal syntax that, for instance, someone writing a
parser could do so off of this document. Here is a legend describing all syntax
element spellings:

| Spelling      | Meaning                                                                                                   |
| --------      | -------                                                                                                   |
| Keyword       | Any keyword with spaces around it is spelled as-is.                                                       |
| Symbol        | Any symbol with spaces around it is spelled as-is, the whitespace is only for clarity and may be omitted. |
| `Syntax`      | A syntax element defined by this document. Spelled as according to its grammar.                           |
| `Syntax...`   | A syntax element of which there may be any amount of. Spelled as according to its grammar.                |
| `Syntax{N}`   | A syntax element of which there may be exactly N amount of. Spelled as according to its grammar.          |
| `$[` and `]$` | An optional syntax element, which may be omitted by the user.                                             |
| `"text"`      | Any string literal, contents do not necessarily have to be what is inside unless explicitly stated.       |

Translation Unit
================

Full ZScript files are referred to as "translation units." This terminology
comes from the C standard, and refers simply to the entirety of a ZScript
source file. ZScript files are looked for in lumps named `zscript` with any
extension. The standard extension is `.txt`, but `.zsc` and `.zs` are common as
well. The author of this documentation prefers `.zsc`.

The base translation unit `zscript` may start with a version directive, then
followed by any number of top-level definitions and `#include` directives.
Included translation units may not have version directives.

All keywords and identifiers in ZScript are case insensitive.

Versions
========

A version directive may be placed at the very beginning of a ZScript file, the
syntax being:

```
version "num"
```

Where `num` is the ZScript version to use. By default ZScript is version
2.3, the original ZScript specification. This old version is not supported
by this documentation and it is highly encouraged to always use the latest
version of ZScript. The minimum version supported by this documentation is 3.0.

Top-level
=========

A ZScript file can have one of several things at the top level of the file,
following a version directive:

- Class definitions
- Structure definitions
- Enumeration definitions
- Constant definitions
- Include directives

Class definitions
=================

A class defines an object type within ZScript, and is most of what you'll be
creating within the language.

All classes inherit from other classes. The base class can be set within the
class header, but if it is not the class will automatically inherit from
Object.

Classes are subject to Scoping. They are also implicitly reference values, and
therefore can be null. Use `new` to instantiate a new class object.

Classes that inherit from Actor can replace other actors when spawned in maps,
and can also be used freely in `DECORATE`. Actors have states, which will not
be explained in this document as they are already well-documented on the ZDoom
wiki.

A class is formed with the syntax:

```
class Identifier $[ : Base-class]$ $[Class-flags...]$
{
   $[Class-content...]$
}
```

`Base-class` in this context is an `Identifier`.

Alternatively, the rest of the file can be used as class content. Note that
with this syntax you cannot use include directives afterward:

```
class Identifier $[ : Base-class]$ $[Class-flags...]$ ;

$[Class-content...]$
```

If the class is defined within the same archive as the current file, then one
can continue a class definition with the syntax:

```
extend class Identifier
```

In place of the class header.

### Example: Class headers

```
class MyCoolObject // automatically inherits Object
{
}

class MyCoolScopedObject play // has Play scope
{
}

class MyCoolThinker : Thinker // inherits Thinker
{
}

class MyCoolActor : Actor replaces OtherActor
{
}

class MyCoolInterface abstract // can only be inherited
{
}
```

### Example: Class definitions

Basic class definition with a member variable and member function.

```
class BasicClass
{
   int m_Thing;

   void ChangeThing()
   {
      m_Thing = 500;
   }
}
```

Alternate syntax usage.

```
class TheWholeFileIsAClassOhNo;

int m_MyMember;

// end of file
```

## Class flags

| Flag                     | Description                                                                       |
| ----                     | -----------                                                                       |
| `abstract`               | Cannot be instantiated with `new`.                                                |
| `native`                 | Class is from the engine. Only usable internally.                                 |
| `play`                   | Class has Play scope.                                                             |
| `replaces Replace-class` | Replaces `Replace-class` with this class. Only works with descendants of `Actor`. |
| `ui`                     | Class has UI scope.                                                               |
| `version ( "ver" )`      | Restricted to ZScript version `ver` or higher.                                    |

`Replace-class` in this context is an `Identifier` denoting a class which
inherits `Actor`.

## Class content

Class contents are an optional list of various things logically contained
within the class, including:

- Member declarations
- Method definitions
- Property definitions
- Flag definitions
- Default blocks
- State definitions
- Enumeration definitions
- Structure definitions
- Constant definitions
- Static array definitions

## Property definitions

Property definitions are used within classes to define defaultable attributes
on actors. They are not valid on classes not derived from Actor.

When registered, a property will be available in the `default` block as
`ClassName.PropertyName`. Properties can be given multiple members to
initialize.

Property definitions take the form:

```
property Identifier : Member $[ , Member]$... ;
```

Where `Member` is an identifier naming any member in the current class.

Properties defined in ZScript are usable from `DECORATE`.

### Example: Property definitions

A class with some properties.

```
class MyCoolActor : Actor
{
   default
   {
      MyCoolActor.MyCoolMember 5000;
      MyCoolActor.MyCoolMemberList 501, 502;
   }

   int m_MyCoolMember;
   int m_CoolMember1, m_CoolMember2;

   property MyCoolMember: m_MyCoolMember;
   property MyCoolMemberList: m_CoolMember1, m_CoolMember2;
}
```

## Flag definitions

*Version 3.7.0 and newer.*

Flag definitions are used within classes to define defaultable boolean flags on
actors. They are not valid on classes not derived from Actor.

When registered, a flag will be available in the `default` block as
`CLASSNAME.FLAGNAME`, as well as a member as `bFLAGNAME`.

Each flag operates on a singular bit of any integer member of the class. The
integer must be exactly 32 bits, though if it is signed or not does not matter.
This means each backing integer can hold exactly 32 flags each (assuming no
duplicated flags,) and more will require another one to be added. (Internally,
the `Actor` flags are currently up to over 8 backing integers.)

A flag's backing integer may not be `meta`, although it may be `readonly`,
`private`, or any other access modifier. The generated flag member will be
publicly visible regardless of the backing integer's visibility.

Flag definitions take the form:

```
flagdef Identifier : Member , Number ;
```

Where `Number` is the bit in `Member` to use, starting from `0` and ending at
`31`.

Flags defined in ZScript are usable from `DECORATE`.

### Example: Flag definitions

A class with some flags.

```
class MyCoolActorWithFlags : Actor
{
   default
   {
      +MYCOOLACTORWITHFLAGS.THIS_ONE_IS_ON
      -MYCOOLACTORWITHFLAGS.THIS_ONE_IS_OFF
   }

   int m_Flags;

   flagdef This_One_Is_On: m_Flags, 0;
   flagdef This_One_Is_Off: m_Flags, 1;
   flagdef This_One_Aliases_On: m_Flags, 0;

   bool CheckIfOnIsOn()
   {
      return bTHIS_ONE_IS_ON;
   }
}
```

## Default blocks

Default blocks are used on classes derived from Actor to create an overridable
list of defaults to properties, allowing for swift creation of flexible actor
types.

In `DECORATE`, this is everything that isn't in the `states` block, but in
ZScript, for syntax flexibility purposes, it must be enclosed in a block with
`default` at the beginning, formed:

```
default
{
   $[Default-statement...]$
}
```

Default statements include either flags or properties:

### Default flag

Default flags are formed either:

```
+ Identifier $[ ; ]$
- Identifier $[ ; ]$
```

The former will enable the flag on this actor, the latter will disable it.

### Default property

Default properties are formed as:

```
Identifier $[ . Identifier]$... Expression ;
```

Note that all properties *except for* `DamageFunction` require `Expression` to
be a constant expression.

## State definitions

These are the same as `DECORATE`, but states that do not have function blocks
require terminating semicolons. Double quotes around `#` and `-` are no longer
required. State blocks can be subject to Action Scoping with the syntax
`states(Scope)`.

A state definition block has the syntax:

```
states $[ ( Scope $[ , Scope]$... ) ]$
{
   $[State-or-label...]$
}
```

State-or-label either defines a state label or a state itself, with the syntax:

```
Identifier :
Char{4} Char... Number-or-random $[State-option...]$ State-func
```

Where `Char` is any ASCII character, `Number-or-random` is one of:

```
Number
random ( Number , Number )
```

`State-option` is one of:

```
bright
fast
slow
nodelay
canraise
offset ( Number , Number )
light ( String $[ , String]$... )
```

And finally, `State-func` is one of:

```
;
Identifier ( Argument-list ) ;
{ $[Statement...]$ }
```

The first will attach no action function to the state. The second will attach
the specified action function with the specified arguments, and the third will
create an anonymous action function and attach it.

Structure definitions
=====================

A structure is an object type that does not inherit from Object and is not
always (though occasionally is) a reference type, unlike classes. Structures
marked as `native` are passed by-reference to and from the engine in an
implicit pseudo-type `Pointer<T>`, and `null` can be passed in their place.
Also note that this means the engine can return `null` structures. Non-native
structures cannot be passed as arguments or returned normally.

Structures are preferred for basic compound data types that do not need to be
instanced and are often used as a way of generalizing code. They cannot be
returned from functions.

Structures are subject to Scoping.

A structure takes the form of:

```
struct Identifier $[Structure-flags...]$
{
   $[Structure-content...]$
}
```

Optionally followed by a semicolon.

### Example: Structure definitions

Simple structure.

```
struct MyCoolStructure
{
   int X;
   int Y;
   int Z;
}
```

## Structure flags

| Flag                | Description                                           |
| ----                | -----------                                           |
| `clearscope`        | Structure has Data scope. Default.                    |
| `native`            | Structure is from the engine. Only usable internally. |
| `play`              | Structure has Play scope.                             |
| `ui`                | Structure has UI scope.                               |
| `version ( "ver" )` | Restricted to ZScript version `ver` or higher.        |

## Structure content

Structure contents are an optional list of various things logically contained
within the structure, including:

- Member declarations
- Method definitions
- Enumeration definitions
- Constant definitions

Enumeration definitions
=======================

An enumeration is a list of named numbers, which by default will be incremental
from 0. By default they decay to the type `int`, but the default decay type can
be set manually.

An enumeration definition takes the form:

```
enum Identifier $[ : Integer-type]$
{
   $[Enumerator $[ , Enumerator]$... $[ , ]$]$
}
```

Optionally followed by a semicolon. `Integer-type` in this context is any valid
integral type name.

Enumerators can either be incremental (from the last enumerator or 0 if there
is none) or explicitly set with the syntax `Identifier = Expression`.
Enumerators must be followed by a comma unless it is the end of the list.

Enumerator syntax is:

```
Identifier $[ = Expression]$
```

### Example: Enumeration definitions

Basic enumeration.

```
enum MyCoolEnum
{
   A, // has value int(0)
   B, // 1 ...
   C, // 2 ...
   D  // and 3
}
```

Less trivial example.

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
const Identifier = Expression ;
```

Constants are not assignable. Their type is inferred from their value, so if
you wish for them to have a specific type, you must cast the value to that
type.

### Example: Constant definitions

Making an integer constant from a double.

```
const MY_COOL_INT = int(777.7777);
```

Static array definitions
=========================

Similar to constants, static arrays are named values, but for an array. They
are created with the syntax:

```
static const Type Variable-name = { $[Expression $[ , Expression]$...]$ } ;
```

Static arrays cannot be multi-dimensional, unlike normal fixed-size arrays.

Include directives
==================

Include directives include other files to be processed by the ZScript compiler,
allowing you to organize and separate code into different files. Their syntax
is simple:

```
#include "filename"
```

Note that included filenames will conflict with other mods. If two mods have a
file named `zscript/MyCoolClasses.zsc` and both include it, expecting to get
different files, the engine will fail to load with a script error.

To avoid this, it is suggested to place your ZScript code under a uniquely
named sub-folder.

### Example: Include directives

Basic includes.

```
#include "zscript/MyCoolMod/MyCoolClasses.zsc"
```

Types
=====

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

## Integers

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

### Symbols

Integer types have symbols attached which can be accessed by `typename.name`,
for instance `int.Max`.

- `Max`

   Maximum value of type.

- `Min`

   Minimum value of type.

## Floating-point types

Floating-point types hold exponents, generally represented as regular decimal
numbers. There are two such types available to ZScript:

| Name      | Usable as argument | Notes                                                              |
| ----      | :----------------: | -----                                                              |
| `double`  | Yes                | 64-bit floating-point number.                                      |
| `float`   | Yes (64 bits)      | 32-bit in structures and classes, 64-bit otherwise.                |
| `float64` | Yes                | Alias for `double`.                                                |
| `float32` | No                 | 32-bit floating-point number. Not implemented correctly, unusable. |

### Symbols

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

## Strings

| Name     | Usable as argument |
| ----     | :----------------: |
| `string` | Yes                |

The `string` type is a mutable, garbage-collected string reference type.
Strings are not structures or classes, however there are methods attached to
the type, detailed in the API section.

## Names

| Name   | Usable as argument |
| ----   | :----------------: |
| `name` | Yes                |

The `name` type is an indexed string. While their contents are the same as a
string, their actual value is merely an integer which can be compared far
quicker than a string. Names are used for many internal purposes such as damage
type names. Strings are implicitly cast to names.

Names can be converted to `int` with an explicit cast, and the negative of
`int(name())` may be used to create an integer representation of a string
usable by action specials, most prominently `ACS_NamedExecute`.

## Color

| Name    | Usable as argument |
| ----    | :----------------: |
| `color` | Yes                |

The `color` type can be converted from a string using the `X11RGB` lump or a
hex color in the format `#RRGGBB`, or with either of:

```
color(R, G, B)
color(A, R, G, B)
```

## Vectors

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

## Fixed-size arrays

| Name              | Usable as argument |
| ----              | :----------------: |
| `Type Array-size` | No                 |

Fixed-size arrays take the form `Type[size]`. They hold `size` number of `Type`
elements, which can be accessed with the array access operator.

Multi-dimensional arrays are also supported, although the dimensions will be
backwards (right to left instead of left to right) unless `version` is `3.7.2`
or greater.

Note that this kind of type can also be declared in variable names themselves.

## Dynamic-size arrays

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

## Maps

| Name                  | Usable as argument |
| ----                  | :----------------: |
| `map < Type , Type >` | No                 |

Map types take the form `map<Type, Type>`. They are not yet implemented.

## Class type references

| Name             | Usable as argument |
| ----             | :----------------: |
| `class < Type >` | Yes                |
| `class`          | Yes                |

Class type references are used to describe a concrete *type* rather than an
object. They simply take the form `class`, and can be restrained to descendants
of a type with the syntax `class<Type>`. Strings are implicitly cast to class
type references.

## User types

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

## Read-only types

| Name                | Usable as argument |
| ----                | :----------------: |
| `readonly < Type >` | Yes                |

A read-only type, as its name implies, may only be read from, and is
effectively immutable. They take the form `readonly<Type>`. Do note that this
is separate from the member declaration flag.

## Other types

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

## Variable name

Variable names can have an array's size on them, instead of on the type, or
none. Variable names are formed as either:

```
Identifier
Identifier Array-size
```

## Array size

Array sizes can be multi-dimensional or automatically sized, so all of the
following syntaxes are available:

```
[ ]
[ Expression ] $[Array-size...]$
```

Expressions and Operators
=========================

## Literals

Much like C or most other programming languages, ZScript has object literals,
including string literals, integer literals, float literals, name literals,
boolean literals, and the null pointer.

### String literals

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

### Class type literals

Class type literals take the same form as string literals, but do note that
they are not the same.

### Name literals

Name literals are similar to string literals, though they use apostrophes
instead of quote marks:

```
'text here'
```

They do not concatenate like string literals, and do not have character
escapes.

### Integer literals

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

### Float literals

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

### Boolean literals

The two boolean literals are spelled `false` and `true`, and much like C, can
decay to the integer literals `0` and `1`.

### Null pointer

The null pointer literal is spelled `null` and represents an object that does
not exist in memory. Like C, it is not equivalent to the integer literal `0`,
and is more similar to C++'s `nullptr`.

## Expressions

Expressions contain literals or other such *expressions* of objects, including
arithmetic and various conditions.

### Primary expressions

Basic expressions, also known as primary expressions, can be one of:

- An identifier for a constant or variable.
- The `Super` keyword.
- Any object literal.
- A vector literal.
- An expression in parentheses.

Identifiers work as you expect, they reference a variable or constant. The
`Super` keyword references the parent type or any member within it.

#### Vector literals

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

### Postfix expressions

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

#### Argument list

The syntax for an argument list is:

```
Expression $[ , Expression]$...
```

Function calls may name arguments which have defaults with the syntax
`Identifier : Expression`, possibly skipping over other defaulted arguments.
After the first named defaultable argument, all other arguments must be named
as well.

### Unary expressions

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

### Binary expressions

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

#### Assignment expressions

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

### Ternary expression

The ternary expression is formed `A ? B : C`, and will evaluate to `B` if `A`
is `true`, or `C` if it is `false`.

Statements
==========

All functions are made up of a list of *statements* enclosed with left and
right braces, which in and of itself is a statement called a *compound
statement*, or *block*.

## Compound statements

A compound statement is formed as:

```
{
   $[Statement...]$
}
```

Note that the statement list is optional, so an empty compound statement `{}`
is entirely valid.

## Expression statements

An expression statement is the single most common type of statement in just
about any programming language. In ZScript, exactly like C and C++, an
expression statement is simply formed with any expression followed by a
semicolon. Function calls and variable assignments are expressions, for
instance, so it is quite clear why they are common.

Their syntax is:

```
Expression ;
```

### Example: Expression statements

Some basic expressions.

```
MyCoolFunction(5, 4);
m_MyCoolMember = 500;
5 * 5; // does nothing of course, but valid
```

## Conditional statements

A conditional statement will, conditionally, choose a statement (or none) to
execute. They work the same as in C and ACS:

```
if ( Expression ) Statement $[ else Statement]$
```

### Example: Conditional statements

Simple conditional.

```
if(a)
   B();
```

Simple conditional, with else statement and a block.

```
if(a)
{
   B();
   c = d;
}
else
   e = f;
```

## Switch statements

A switch statement takes an expression of integer or name type and selects a
labeled statement to run. They work the same as in C and ACS:

```
switch ( Expression ) Statement
```

### Example: Switch statements

A switch demonstrating fall-through and default cases.

```
switch(a)
{
case 500: Console.Printf("a is 500"); break;
case 501: Console.Printf("a is 501"); // falls through to next case
case 502: Console.Printf("a is 501 or 502"); break;
default:
   Console.Printf("not sure what a is!");
   // break is implied here
}
```

## Loop statements

ZScript has five loop statements, `for`, `while`, `until`, `do while` and `do
until`. `for`, `while` and `do while` work the same as in C, C++ and ACS, while
`until` and `do until` do the inverse of `while` and `do while`.

The `for` loop takes a limited statement and two optional expressions: The
statement for when the loop begins (which is scoped to the loop,) one
expression for checking if the loop should break, and one which is executed
every time the loop iterates. Its syntax is:

```
for ( $[Expression-or-Local-variable-statement]$ ; $[Expression]$ ; $[Expression]$ ) Statement
```

The `while` loop simply takes one expression for checking if the loop should
break, equivalent to `for(; a;)`.

The `until` loop is equivalent to `while(!a)`. Their syntax are:

```
while ( Expression ) Statement
until ( Expression ) Statement
```

`do while` and `do until` will only check the expression after the first
iteration is complete. The `do while` and `do until` loops are formed as such:

```
do
   Statement
while ( Expression ) // unlike C, you don't need a semicolon here

do
   Statement
until ( Expression )
```

## Control flow statements

As in C, there are three control flow statements that manipulate where the
program will execute statements next, which are available contextually. They
are `continue`, `break` and `return`.

`continue` is available in loop statements and will continue to the next
iteration immediately:

```
continue ;
```

`break` is available in loop statements and switch statements, and will break
out of the containing statement early:

```
break ;
```

`return` is available in functions. If the function does not return any values,
it may only be spelled `return;` and will simply exit the function early. If
the function does return values, it takes a comma-separated list for each value
returned:

```
return $[Expression $[ , Expression]$...]$ ;
```

### Example: Control flow statements

Use of `continue`.

```
for(int i = 0; i < 50; i++)
{
   if(i == 25) continue; // don't do anything on 25!

   DoThing(i);
}
```

Use of `break`.

```
for(int i = 0; i < 50; i++)
{
   if(i == 25) break; // exit the loop at 25!

   DoThing(i);
}
```

Use of `return` in various contexts.

```
void ReturnsNothing()
{
   if(m_Thing != 50) return; // exit early if m_Thing isn't 50.

   DoThing(m_Thing);
}

int ReturnsInt()
{
   if(m_Thing == 50)
      return 50; // m_thing is 50, so return 50.

   return 0; // must have a return eventually
}

int, int ReturnsTwoInts()
{
   return 1, 2; // returns 1 and 2.
}
```

## Local variable statements

Local variable statements are formed in one of 2 ways. The `let` keyword can be
used to automatically determine the type of the variable from the initializer,
while the regular syntax uses an explicit type, and initialization is optional.

Variables' syntax are one of:

```
Variable-name
Variable-name = Expression
```

And local variable statements have the syntax of either:

```
let Identifier = Expression ;
Type Variable $[ , Variable]$... ;
```

## Multi-assignment statements

Expressions or functions that return multiple values can be assigned into
multiple variables with the syntax:

```
[ Expression $[ , Expression]$... ] = Expression ;
```

Note that the surrounding brackets are literal and not an optional element.

### Example: Multi-assignment statements

Getting the actor out of `A_SpawnItemEx`.

```
Actor mo;
bool spawned;
[spawned, mo] = A_SpawnItemEx("MyCoolActor");
```

## Static array statements

Static arrays can be defined normally as a statement.

## Null statements

A null statement does nothing, and is formed `;`. It is similar to an empty
compound statement.

Member declarations
===================

Member declarations define data within a structure or class that can be
accessed directly within methods of the object (or its derived classes,) or
indirectly from instances of it with the member access operator.

A member declaration is formed as so:

```
$[Member-declaration-flags...]$ Type Variable-name $[ , Variable-name]$... ;
```

### Example: Member declarations

Some basic member variables.

```
int m_MyCoolInt;
int m_CoolInt1, m_CoolInt2, m_CoolInt3;
int[10] m_CoolIntArray;
private int m_CoolPrivateInt;
protected meta int m_CoolMetaInt;
```

## Member declaration flags

| Flag                   | Description                                                                                                         |
| ----                   | -----------                                                                                                         |
| `deprecated ( "ver" )` | If accessed, a script warning will occur on load if the archive version is greater than `ver`.                      |
| `internal`             | Member is only writable from the base resource archive (`gzdoom.pk3`.) *Version 3.4.0 and newer.*                   |
| `latent`               | Does nothing. Purpose unknown.                                                                                      |
| `meta`                 | Member is read-only static class data. Only really useful on actors, since these can be set via properties on them. |
| `native`               | Member is from the engine. Only usable internally.                                                                  |
| `play`                 | Member has Play scope.                                                                                              |
| `private`              | Member is not visible to any class but this one.                                                                    |
| `protected`            | Member is not visible to any class but this one and any descendants of it.                                          |
| `readonly`             | Member is not writable.                                                                                             |
| `transient`            | Member is not saved into save games. Required for unserializable objects and recommended for UI context objects.    |
| `ui`                   | Member has UI scope.                                                                                                |
| `version ( "ver" )`    | Restricted to ZScript version `ver` or higher.                                                                      |

Method definitions
==================

Method definitions define functions within a structure or class that can be
accessed directly within other methods of the object (or its derived classes,)
or indirectly from instances of it with the member access operator.

Methods marked as `virtual` may have their functionality overridden by derived
classes, and in those overrides one can use the `Super` keyword to call the
parent function.

Methods are formed as so:

```
$[Method-definition-flags...]$ Type $[ , Type]$... Identifier ( $[Method-argument-list]$ ) $[ const ]$
{
   $[Statement...]$
}
```

If `const` is placed after the function signature and before the function body,
the method will not be allowed to modify any members in the object instance
it's being called on.

The keyword `void` can be used in place of the return type (or type list) to
have a method which does not have any return value. Similarly, one can place
`void` where the argument list might be, although this is redundant as having
no argument list at all is allowed.

Arguments of methods may only be of certain types due to technical limitations.
See the type table for a list of which are usable and which are not.

All methods which are not `static` have an implicit `self` parameter which
refers to this object, although if you wish to refer to a member of `self`, you
do not need to reference it directly, as it is already implicitly in scope.

## Method argument list

Method arguments must all have a name and type, and optionally the last
arguments in the list may have a default value, (*Version 3.3.0 and newer*)
except in functions marked `override`. The syntax is:

```
Type Variable-name $[ , Method-argument-list]$
Type Variable-name = Expression $[ , Method-argument-list]$
```

Or, the entire list may simply be `void` or empty.

### Example: Method argument lists

With the function:

```
void Fn(int one, int two, int a = 0, int b = 0);
```

One could do the following:

```
Fn(4, 5);
Fn(5, 6, 7);
Fn(6, 7, 8, 9);
```

Or using named default arguments,

```
Fn(5, 6, a: 7);
Fn(6, 7, b: 8);
Fn(7, 8, a: 9, b: 10);

// equivalent to:
Fn(5, 6, 7);
// (no equivalent, must use above)
Fn(7, 8, 9, 10);
```

## Method definition flags

| Flag                   | Description                                                                                    |
| ----                   | -----------                                                                                    |
| `action ( Scope )`     | Same as `action`, but has a specified action scope. See "Action Scoping" for more information. |
| `action`               | Method has implicit `invoker` and `stateinfo` parameters. See below for more info.             |
| `clearscope`           | Method has Data scope.                                                                         |
| `deprecated ( "ver" )` | If accessed, a script warning will occur on load if the archive version is greater than `ver`. |
| `final`                | Virtual method cannot be further overridden from derived classes.                              |
| `native`               | Method is from the engine. Only usable internally.                                             |
| `override`             | Method is overriding a base class' virtual method.                                             |
| `play`                 | Method has Play scope.                                                                         |
| `private`              | Method is not visible to any class but this one.                                               |
| `protected`            | Method is not visible to any class but this one and any descendants of it.                     |
| `static`               | Function is not a method, but a global function without a `self` pointer.                      |
| `ui`                   | Method has UI scope.                                                                           |
| `vararg`               | Method doesn't type-check arguments after `...`. Only usable internally.                       |
| `version ( "ver" )`    | Restricted to ZScript version `ver` or higher.                                                 |
| `virtual`              | Method can be overridden in derived classes.                                                   |
| `virtualscope`         | Method has scope of the type of the object it's being called on.                               |

### Action functions

ZScript includes an extra method type for descendents of `Actor` called
*actions*, which are intended to be run from actor states and give extra
information to the function. Action functions change the meaning of the `self`
parameter and pass in `invoker` and `stateinfo` parameters as well. `stateinfo`
refers to the `State` which this action was called from. Here is a chart for
the meanings of the `self` and `invoker` variables under each scope:

| Scope     | `self` meaning                                                  | `invoker` meaning |
| -----     | --------------                                                  | ----------------- |
| None      | The actor this function operates on, ambiguous in some contexts | State owner       |
| `actor`   | The actor                                                       | The actor         |
| `item`    | Item owner                                                      | Item itself       |
| `overlay` | Weapon owner                                                    | Weapon itself     |
| `weapon`  | Weapon owner                                                    | Weapon itself     |

<!-- EOF -->
