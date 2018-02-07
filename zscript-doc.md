Table of Conents
================

* [Top-level](#top-level)
* [Class definitions](#class-definitions)
* [Enumeration definitions](#enumeration-definitions)
* [Include directives](#include-directives)

Examples:

* [Class headers](#examples-class-headers)
* [Class definitions](#examples-class-definitions)
* [Enumeration definitions](#examples-enumeration-definitions)
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
| `replaces ReplaceClass` | Replaces ReplaceClass with this class. Only works on objects which are descendants of Actor. |
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