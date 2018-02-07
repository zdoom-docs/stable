Table of Conents
================

* [Top-level](#top-level)
* [Class definitions](#class-definitions)
* [Structure definitions](#structure-definitions)
* [Enumeration definitions](#enumeration-definitions)
* [Constant definitions](#constant-definitions)
* [Include directives](#include-directives)
* [Types](#types)
* [Expressions and Operators](#expressions-and-operators)
* [Statements](#statements)
* [API](#api)

Examples:

* [Class headers](#examples-class-headers)
* [Class definitions](#examples-class-definitions)
* [Structure definitions](#examples-structure-definitions)
* [Enumeration definitions](#examples-enumeration-definitions)
* [Constant definitions](#examples-constant-definitions)
* [Include directives](#examples-include-directives)

Top-level
=========

A ZScript file can have one of several things at the top level of the file:

- Class definitions
- Structure definitions
- Enumeration definitions
- Constant definitions
- Include directives

Class definitions
=================

A class defines an object type within ZScript, and is most of what you'll be creating within the language.

All classes inherit from other classes. The base class can be set within the class header, but if it is not the class will automatically inherit from Object.

Classes are subject to Scoping. They are also implicitly reference values, and therefore can be null. Use the `new` expression to instantiate a new class object.

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

Class flags
-----------

| Flag                    | Description |
| ----------------------- | --- |
| `abstract`              | Cannot be instantiated with `new`. |
| `ui`                    | Has UI scope. |
| `play`                  | Has Play scope. |
| `replaces ReplaceClass` | Replaces ReplaceClass with this class. Only works with descendants of Actor. |
| `native`                | Class is from the engine. Do not use in user code. |
| `version("ver")`        | Restricted to version *ver*. Do not use in user code. |

Class content
-------------

Class contents are an optional list of various things logically contained within the class, including:

- Member declarations
- Static array declarations
- State definitions
- Default definitions
- Property definitions
- Enumeration definitions
- Structure definitions
- Constant definitions

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

Structure definitions
=====================

A structure is an object type that does not inherit from Object and is not always a reference type, unlike classes. Structures are passed by-reference as arguments, however, and can be null when doing so.

Structures are preferred for basic compound data types that do not need to be instanced and are often used as a way of generalizing code. They cannot be returned from functions.

Structures are subject to Scoping, however their scope can be reset with the clearscope flag.

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

| Flag             | Description |
| ---------------- | --- |
| `ui`             | Has UI scope. |
| `play`           | Has Play scope. |
| `clearscope`     | Clears the default scope. |
| `native`         | Structure is from the engine. Do not use in user code. |
| `version("ver")` | Restricted to version *ver*. Do not use in user code. |

Structure content
-----------------

Structure contents are an optional list of various things logically contained within the structure, including:

- Member declarations
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

Include directives
==================

Include directives include other files to be processed by the ZScript compiler, allowing you to orgnaize and separate code into different files. Their syntax is simple:

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

Integers
-------------

Integer types are basic integral numbers. They include:

| Name     | Bits | Lowest value   | Highest value |
| -------- |:----:| --------------:|:------------- |
| `int8`   | 8    | -128           | 127           |
| `uint8`  | 8    | 0              | 255           |
| `int16`  | 16   | -32,768        | 32,767        |
| `uint16` | 16   | 0              | 65,535        |
| `int`    | 32   | -2,147,483,648 | 2,147,483,647 |
| `uint`   | 32   | 0              | 4,294,967,296 |

Floating-point types
--------------------

Floating-point types hold exponents, generally represented as regular decimal numbers. There are two such types available to ZScript:

| Name      | Notes |
| --------  | --- |
| `float`   | 32-bit in structures and classes, 64-bit otherwise. |
| `double`  | 64-bit floating-point number. |
| `float32` | 32-bit floating-point number. Not implemented correctly, unusable. |
| `float64` | Alias for `double`. |

Strings
-------

The `string` type is an immutable, garbage-collected string reference type. Strings are not structures or classes, however there are methods attached to the type, detailed in the API section.

Names
-----

The `name` type is an indexed string. While their contents are the same as a string, their actual value is merely an integer which can be compared far quicker than a string. Names are used for many internal purposes such as damage type names.

Color
-----

The `color` type can be converted from a string using the X11RGB lump or a hex color in the format `#RRGGBB`. There are 4 accessible members in `color`: `r`, `g`, `b`, and `a`, for each color channel.

Vectors
-------

There are two vector types in ZScript, `vector2` and `vector3`, which hold two and three members, respectively. Their members can be accessed through `x`, `y` and (for `vector3`,) `z`. `vector3` can additionally get the X and Y components as a `vector2` with `xy`.

Vectors can use many operators and even have special ones to themselves. See the Expressions and Operators section for more information.

Other types
-----------

| Name         | Description |
| ------------ | --- |
| `bool`       | Holds one of two values: `true` or `false`. |
| `sound`      | Similar to `int`, but holds a sound identifier. |
| `textureid`  | Similar to `int`, but holds a texture identifier. |
| `spriteid`   | Similar to `int`, but holds a sprite identifier. |
| `state`      | A reference to an actor state. |
| `statelabel` | The name of an actor state. Similar to `name`. |
| `void`       | Alias for `None`. Unknown purpose. |

Fixed-size arrays
-----------------

Fixed-size arrays take the form `Type[size]`. They hold `size` number of `Type` elements, which can be accessed with the array access operator. Multi-dimensional arrays are also supported.

Dynamic-size arrays
-------------------

Dynamically sized arrays take the form `array<Type>`, and hold an arbitrary number of `Type` elements, which can be accessed with the array access operator. Multi-dimensional dynamic arrays are not supported.

Maps
----

Map types take the form `map<Type, Type>`. They are not yet implemented.

Class type references
---------------------

Class type references are used to describe a concrete *type* rather than an object. They simply take the form `class`, and can be restrained to descendants of a type with the syntax `class<Type>`.

User types
----------

Any other identifier used as a type will resolve to a user class, structure or enumeration type.

Identifiers prefixed with `@` are internal types which are not exposed to ZScript. Do not use this in user code.

A type name that is within a specific scope can be accessed by prefixing it with a `.`. The type `.MyClass.MySubStructure` will resolve to the type `MySubStructure` contained within `MyClass`.

Read-only types
---------------

A read-only type, as its name implies, may only be read from, and is effectively immutable. They take the form `readonly<Type>`.

Expressions and Operators
=========================

Constant:
StringConst (can be concatenated like C)
IntConst
UIntConst
FloatConst
NameConst
False
True
Null

PrimExpr:
Ident
Super
Constant
Vector3Const (x, y)
Vector2Const (x, y, z)
ParenExpr (x)
FuncCall
(class<Iden>)(params)
ArraySubscript
MemberAccess
PostIncr
PostDecr

UnaryExpr:
PrimExpr
Negate
Positive
PreIncr
PreDecr
BitNot
LogNot
Sizeof
Alignof (why)

BinExpr:
UnaryExpr
Add
Sub
Mul
Div
Mod
Pow **
CrossProduct cross
DotProduct dot
LSh
RSh
URSh >>>
Concat ..
Lt
Gt
LtEq
GtEq
Difference <>=
Is
Eq
NEq
ApproxEq ~== only works on floats, vecs strings - casecmp for strings, LT epsilon diff. for floats & vectors
BitAnd
BitXor
BitOr
LogAnd
LogOr
Assign
AddAssign
SubAssign
MulAssign
DivAssign
ModAssign
LShAssign
RShAssign
URShAssign
OrAssign
XorAssign
Scope (x scope ui etc.) (why does this exist?)

TriExpr:
BinExpr
TernaryOp

Statements
==========

while
until
for
if
if-else
do-while
do-until
switch
continue
break
return
multiassign-stmt
local-var
static array stmt

API
===

String
------

Replace
Format
AppendFormat
Mid
Left
Truncate
Remove
CharAt
CharCodeAt
Filter
IndexOf
LastIndexOf
ToUpper
ToLower
ToInt
ToDouble
Split
Length