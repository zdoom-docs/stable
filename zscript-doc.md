Table of Conents
================

* [Top-level](#top-level)
* [Class definitions](#class-definitions)
* [Structure definitions](#structure-definitions)
* [Enumeration definitions](#enumeration-definitions)
* [Constant definitions](#constant-definitions)
* [Static array definitions](#static-array-definitions)
* [Include directives](#include-directives)
* [Types](#types)
* [Expressions and Operators](#expressions-and-operators)
* [Statements](#statements)
* [Member declarations](#member-declarations)
* [Method definitions](#method-definitions)
* [Concepts](#concepts)
  * [Action scoping](#action-scoping)
  * [Object scoping](#object-scoping)
* [API](#api)

Examples:

* [Class headers](#examples-class-headers)
* [Class definitions](#examples-class-definitions)
* [Structure definitions](#examples-structure-definitions)
* [Enumeration definitions](#examples-enumeration-definitions)
* [Constant definitions](#examples-constant-definitions)
* [Include directives](#examples-include-directives)
* [Expression statements](#examples-expression-statements)
* [Conditional statements](#examples-conditional-statements)
* [Switch statements](#examples-switch-statements)
* [Control flow statements](#examples-control-flow-statements)
* [Multi-assignment statements](#examples-multi-assignment-statements)
* [Member declarations](#examples-member-declarations)

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

| Flag                    | Description |
| ----------------------- | --- |
| `abstract`              | Cannot be instantiated with `new`. |
| `ui`                    | Class has UI scope. |
| `play`                  | Class has Play scope. |
| `replaces ReplaceClass` | Replaces ReplaceClass with this class. Only works with descendants of Actor. |
| `native`                | Class is from the engine. Do not use in user code. |
| `version("ver")`        | Restricted to ZScript version *ver* or higher. Do not use in user code. |

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

These are the same as DECORATE, but states require terminating semicolons. Double quotes around `####` and `----` are no longer required. State blocks can be subject to Action Scoping with the syntax `states(Scope)`.

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

A structure is an object type that does not inherit from Object and is not always a reference type, unlike classes. Structures are passed by-reference as arguments, however, and can be null when doing so.

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

| Flag             | Description |
| ---------------- | --- |
| `ui`             | Structure has UI scope. |
| `play`           | Structure has Play scope. |
| `clearscope`     | Structure has Data scope. Default. |
| `native`         | Structure is from the engine. Do not use in user code. |
| `version("ver")` | Restricted to ZScript version *ver* or higher. Do not use in user code. |

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
<!--| `void`       | Alias for `None`. Unknown purpose. |-->

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

Literals
--------

Much like C or most other programming languages, ZScript has object literals, including string literals, integer literals, float literals, name literals, boolean literals, and the null pointer.

### String literals

String literals take the same form as in C:

```
"text here"
```

String literals have character escapes, which are formed with a backslash and a character. Character escapes include:

| Spelling | Output |
| -------- | --- |
| `\"`     | A literal `"`. |
| `\\`     | A literal `\`. |
| `\` followed by newline | Concatenates the next line with this one. |

String literals, also like C and C++, will be concatenated when put directly next to eachother. For example, this:

```
"text 1" "text 2"
```

Will be parsed as a single string literal with the text `"text 1text 2"`.

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

The null pointer literal is spelled `null` and represents an object that does not exist in memory. Unlike C++, it is not equivalent to the integer literal `0`.

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

### Postfix expressions

Postfix expressions are affixed at the end of an expression, and are used for a large variety of things, although the actual amount of postfix expressions is small:

| Form | Description |
| --- | --- |
| `a([Argument list...])` | Function call. |
| `Type(a)` | Type cast. |
| `(class<Type>)(a)` | Class type reference cast. |
| `a[b]` | Array access. |
| `a.b` | Member access. |
| `a++` | Post-increment. This increments (adds 1 to) the object after the expression is evaluated. |
| `a--` | Post-decrement. This decrements (subtracts 1 from) the object after the expression is evaluated. |

### Unary expressions

Unary expressions are affixed at the beginning of an expression. The simplest example of a unary expression is the negation operator, `-`, as in `-500`. Unary expressions include:

| Form | Description |
| --- | --- |
| `-a` | Negation. |
| `!a` | Logical negation, "not." |
| `++a` | Pre-increment. This adds 1 to the object and evaluates as the resulting value. |
| `--a` | Pre-decrement. This subtracts 1 from the object and evaluates as the resulting value. |
| `~a` | Bitwise negation. Flips all bits in an integer. |
| `+a` | Affirmation. Does not actually do anything. |
| `sizeof a` | Evaluates the size of the type of an expression. Unknown purpose. |
| `alignof a` | Evaluates the alignment of the type of an expression. Unknown purpose. |

### Binary expressions

Binary expressions operate on two expressions, and are the most common kind of expression. They are used inline like regular math syntax, ie. `1 + 1`. Binary expressions include:

| Form | Description |
| --- | --- |
| `a + b` | Addition. |
| `a - b` | Subtraction. |
| `a * b` | Multiplication. |
| `a / b` | Division (quotient.) |
| `a % b` | Division (remainder,) also known as "modulus." Unlike C, this works on floats, too. |
| `a ** b` | Exponent/power of. |
| `a << b` | Left bitwise shift. |
| `a >> b` | Right bitwise shift. |
| `a >>> b` | Right unsigned bitwise shift. |
| `a cross b` | Vector cross-product. |
| `a dot b` | Vector dot-product. |
| `a .. b` | Concatenation, creates a string from two values. |
| `a < b` | `true` if `a` is less than `b`. |
| `a > b` | `true` if `a` is greater than `b`. |
| `a <= b` | `true` if `a` is less than or equal to `b`. |
| `a >= b` | `true` if `a` is greater than or equal to `b`. |
| `a == b` | `true` if `a` is equal to `b`. |
| `a != b` | `true` if `a` is not equal to `b`. |
| `a ~== b` | `true` if `a` is approximately equal to `b`. For strings this is a case-insensitive comparison, and for floats and vectors this checks if the difference between the two numbers is smaller than ε. |
| `a && b` | `true` if `a` and `b` are both `true`. |
| `a \|\| b` | `true` if `a` or `b` is `true`. |
| `a is "b"` | `true` if `a` is the type, or a descendant of, `b`. |
| `a <>= b` | Signed difference between `a` and `b`. |
| `a & b` | Bitwise AND. |
| `a ^ b` | Bitwise XOR. |
| `a \| b` | Bitwise OR. |
| `a::b` | Scope operator. Not implemented yet. |

#### Assignment expressions

Assignment expressions are a subset of binary expressions which *are never constant expressions*. They assign a value to another value, as one might guess.

| Form | Description |
| --- | --- |
| `a = b` | Assigns `b` to `a`. |
| `a += b` | Assigns `a + b` to `a`. |
| `a -= b` | Assigns `a - b` to `a`. |
| `a *= b` | Assigns `a * b` to `a`. |
| `a /= b` | Assigns `a / b` to `a`. |
| `a %= b` | Assigns `a % b` to `a`. |
| `a <<= b` | Assigns `a << b` to `a`. |
| `a >>= b` | Assigns `a >> b` to `a`. |
| `a >>>= b` | Assigns `a >>> b` to `a`. |
| `a \|= b` | Assigns `a \| b` to `a`. |
| `a &= b` | Assigns `a & b` to `a`. |
| `a ^= b` | Assigns `a ^ b` to `a`. |

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

A switch statement takes an integer or name and selects a labeled statement to run. They work the same as in C and ACS, though they accept `name` as well as `int` and enumeration types.

Examples: Switch statements
---------------------------

A switch demonstrating fallthrough and default cases:

```
switch(a)
{
case 500: Console.printf("a is 500"); break;
case 501: Console.printf("a is 501");
case 502: Console.printf("a is 501 or 502"); break;
default:
   Console.printf("not sure what a is!");
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
while(a)

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

Member declaration flags
------------------------

| Flag                   | Description |
| ---------------------- | --- |
| `private`              | Member is not visible to any class but this one. |
| `protected`            | Member is not visible to any class but this one and any descendants of it. |
| `ui`                   | Member has UI scope. |
| `play`                 | Member has Play scope. |
| `meta`                 | Member is read-only static class data. Only really useful on actors, since these can be set via properties on them. |
| `transient`            | Member is not saved into save games. Required for Font members and recommended for other UI context members. |
| `readonly`             | Member is not writable. |
| `deprecated("reason")` | If accessed, a script warning will occur on load, with *reason* as the message. |
| `native`               | Member is from the engine. Do not use in user code. |
| `version("ver")`       | Restricted to ZScript version *ver* or higher. Do not use in user code. |

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

Method definition flags
-----------------------

| Flag                   | Description |
| ---------------------- | --- |
| `private`              | Method is not visible to any class but this one. |
| `protected`            | Method is not visible to any class but this one and any descendants of it. |
| `static`               | Function is not a method, but a global function without a `self` pointer. |
| `ui`                   | Method has UI scope. |
| `play`                 | Method has Play scope. |
| `clearscope`           | Method has Data scope. |
| `virtualscope`         | Method has scope of the type of the object it's being called on. |
| `virtual`              | Method can be overridden in derived classes. |
| `override`             | Method is overriding a base class' virtual method. |
| `final`                | Virtual method cannot be further overridden from derived classes. |
| `action`               | Method has implicit `owner` and `state` parameters, mostly useful on weapons. |
| `action(Scope)`        | Same as above, but has an action scope. See "Action Scoping" for more information. |
| `deprecated("reason")` | When accessed, a script warning will occur on load, with *reason* as the message. |
| `vararg`               | Method doesn't type-check arguments after `...`. Do not use in user code. |
| `native`               | Method is from the engine. Do not use in user code. |
| `version("ver")`       | Restricted to ZScript version *ver* or higher. Do not use in user code. |

Concepts
========

Action Scoping
--------------

On classes derived from Actor, states and methods can be scoped to a certain subset of uses. This is mainly to differentiate actions which take place in inventory items and weapons, and actions which take place in the actual game map. The available scopes are:

| Name      | Description |
| --------- | --- |
| `actor`   | Actions are called from an actual map object. |
| `overlay` | Actions are called from a weapon overlay. |
| `weapon`  | Actions are called from a weapon. |
| `item`    | Actions are called from an inventory item. |

Object Scoping
--------------

Most objects are subject to object scoping, which restricts the way data can be used in certain contexts. This is to ensure that the playsim does not get changed by the UI, for instance, or that the playsim doesn't read from the UI and break network synchronization. In other words, it is to prevent a multitude of errors that arise when data is modified or read from the wrong places.

There are three scopes in ZScript: Play, UI, and Data (also known as "clearscope.") The Play scope is used for objects that are part of the game simulation and interact with the world in some way or another, while the UI scope is for objects that have no correlation with the world besides perhaps reading information from it. The Data scope is shared between the two, and must be used carefully.

Here is a chart of data access possibilities for each scope:

|                   | Data scope | Play scope | UI scope  |
| ----------------- | ---------- | ---------- | --------- |
| From Data context | Read/write | Read-only  | No access |
| From Play context | Read/write | Read/write | No access |
| From UI context   | Read/write | Read-only  | No access |

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