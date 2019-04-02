Language
========

<!-- vim-markdown-toc GFM -->

* [Reading This Document](#reading-this-document)
* [Translation Unit](#translation-unit)
* [Versions](#versions)
* [Top-level](#top-level)
* [Include directives](#include-directives)
   * [Example: Include directives](#example-include-directives)
* [Table of Contents](#table-of-contents)

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

## Example: Include directives

Basic includes.

```
#include "zscript/MyCoolMod/MyCoolClasses.zsc"
```

Table of Contents
=================

Finally, here is a table of contents for each language element:

<!-- toc glossary -->

* [Classes](lang-Classes.md)
* [Constants](lang-Constants.md)
* [Enumerations](lang-Enumerations.md)
* [Expressions](lang-Expressions.md)
* [Members](lang-Members.md)
* [Methods](lang-Methods.md)
* [Statements](lang-Statements.md)
* [Structures](lang-Structures.md)
* [Types](lang-Types.md)

<!-- toc end -->

<!-- EOF -->
