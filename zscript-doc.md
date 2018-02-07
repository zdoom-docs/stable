Table of Conents
================

* [Top-level](#top-level)
* [Class definitions](#class-definitions)
* [Structure definitions](#structure-definitions)
* [Enumeration definitions](#enumeration-definitions)
* [Constant definitions](#constant-definitions)
* [Include directives](#include-directives)

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

| Name     | Notes |
| -------- | --- |
| `float`  | Fastest floating-point type available on the platform. Limited use. |
| `double` | 64-bit standard floating-point type. |

Strings
-------

string

Names
-----

name

Vectors
-------

vector2
vector3

Other types
-----------

| Name        | Description |
| ----------- | --- |
| `bool`      | Holds one of two values: `true` or `false`. |
| `sound`     | Similar to `int`, but holds a sound identifier. |
| `textureid` | Similar to `int`, but holds a texture identifier. |
| `color`     | A string which cannot be `null`. Holds the name or hex value of a color. |
| `state`     | A reference to a state. Similar to `name`. |
| `void`      | Holds no data. Nothing can be done with it. |

Fixed-size arrays
-----------------

Type[Expr]

Dynamic-size arrays
-------------------

array<Type>

Maps
----

map<Type, Type>

Class types
-----------

class
class<DotId>

User types
----------

Ident
@Ident

Read-only types
---------------

readonly<Ident>
readonly<@Ident>

Fully-specified types
---------------------

.DotId
TypeList, Type