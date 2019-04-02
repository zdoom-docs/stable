Enumeration Definitions
=======================

<!-- vim-markdown-toc GFM -->

* [Example: Enumeration definitions](#example-enumeration-definitions)

<!-- vim-markdown-toc -->

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

## Example: Enumeration definitions

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
<!-- EOF -->
