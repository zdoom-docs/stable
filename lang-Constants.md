Constant Definitions
====================

<!-- vim-markdown-toc GFM -->

   * [Example: Constant definitions](#example-constant-definitions)
* [Static array definitions](#static-array-definitions)

<!-- vim-markdown-toc -->

Constants are simple named values. They are created with the syntax:

```
const Identifier = Expression ;
```

Constants are not assignable. Their type is inferred from their value, so if
you wish for them to have a specific type, you must cast the value to that
type.

## Example: Constant definitions

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

<!-- EOF -->
