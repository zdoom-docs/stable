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

A class definition starts with a class header, followed by an opening brace, class content and a closing brace.

Alternatively, you can follow the class header with a semicolon and the rest of the file will be considered class content. Note that with this syntax you cannot use include directives after the class header.

Classes all inherit from other classes. The base class can be set within the class header, though if it is not the class will automatically inherit from Object.

Classes are subject to Scoping.

Class headers
-------------

The class header is formed as such:

```
class Name [: BaseClass] [Class flags...]
```

Class flags include:

| Flag                    | Description |
| ----------------------- | --- |
| `abstract`              | Cannot be instantiated with new(). |
| `native`                | Class is from the engine. Do not use in user code. |
| `ui`                    | Has UI scope. |
| `play`                  | Has Play scope. |
| `replaces ReplaceClass` | Replaces ReplaceClass with this class. Only works on objects which are descendants of Actor. |
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

Enumeration definitions
=======================

An enumeration is a list of named numbers, which by default will be incremental from 0. By default they decay to the type `int`, but the default decay type can be set manually.

An enumeration definition takes the form:

```
enum Name [: IntegerType]
{
   [Enumerator list]
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