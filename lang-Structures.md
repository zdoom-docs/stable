Structure Definitions
=====================

<!-- vim-markdown-toc GFM -->

   * [Example: Structure definitions](#example-structure-definitions)
* [Structure Flags](#structure-flags)
* [Structure Content](#structure-content)

<!-- vim-markdown-toc -->

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

## Example: Structure definitions

Simple structure.

```
struct MyCoolStructure
{
   int X;
   int Y;
   int Z;
}
```

Structure Flags
===============

| Flag                | Description                                           |
| ----                | -----------                                           |
| `clearscope`        | Structure has Data scope. Default.                    |
| `native`            | Structure is from the engine. Only usable internally. |
| `play`              | Structure has Play scope.                             |
| `ui`                | Structure has UI scope.                               |
| `version ( "ver" )` | Restricted to ZScript version `ver` or higher.        |

Structure Content
=================

Structure contents are an optional list of various things logically contained
within the structure, including:

- Member declarations
- Method definitions
- Enumeration definitions
- Constant definitions

<!-- EOF -->
